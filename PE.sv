`timescale 1ns / 1ps
//作為 OS/down side WS 時所有的output_right都分為兩個部分, 前面[7:0]是需要往右繼續傳的input 後面[24:8]是要傳的運算結果
//作為 right side WS時分成兩部分的則是output_down
module PE(input_left,input_right,input_up,input_down,output_left,output_right,output_up,output_down,workstate,clk,reset,penumx,penumy,sizex,sizey,kernelsize,result);//沒有接上TSV的一般PE
/*
mode0 = idle
mode1 = WS load right
mode2 = WS load down 
mode3 = WS computation right side
mode4 = WS computation down side
mode7 = OS
*/
input clk,reset,workstate;
input [24:0] input_left,input_right,input_up,input_down,penumx,penumy,sizex,sizey,kernelsize;

output reg [24:0] output_right,output_left,output_down,output_up,result;//first 8 bit is input data, last 17 bit is computation result

reg[2:0] NSmode,CSmode;
reg[15:0] weight, OS_counter;

always @(*) begin//state machine
    case(CSmode)
    0:begin//idle
        if(workstate)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if((penumx%sizex <= (kernelsize*kernelsize)) && (penumy%sizey <= (kernelsize*kernelsize)))begin//OS
                if((penumx%sizex==0) && (penumy%sizey==0))begin
                    NSmode = 2;
                end else begin
                    NSmode = 7;
                end
            end else if((sizey-(penumy%sizey)) <= kernelsize) begin//下方WS
                NSmode = 2;
            end else if((sizex-(penumx%sizex)) <= kernelsize)begin//右邊WS
                NSmode = 1;
            end else begin
                NSmode = 0;
            end
        end else begin
            NSmode = 0;
        end
    end
    1:begin
        if(OS_counter >= ((sizey-(penumy%sizey))%kernelsize)*kernelsize)begin
            NSmode = 3;
        end else begin
            NSmode = 1;
        end
    end
    2:begin
        if(OS_counter >= ((sizey-(penumy%sizey))%kernelsize)*kernelsize)begin
            NSmode = 4;
        end else begin
            NSmode = 2;
        end
    end
    3:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在WS
            NSmode = 0;
        end else begin
            NSmode = 3;
        end
    end
    4:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在WS
            NSmode = 0;
        end else begin
            NSmode = 4;
        end
    end
    7:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 7;
        end
    end
    default: NSmode = 0;
    endcase
end

always @(posedge clk or posedge reset) begin//state machine
    if(reset)begin
        CSmode <= 0;
    end else begin
        CSmode <= NSmode;
    end
end

always @(posedge clk or posedge reset) begin//計算運算時間的工具
    if(reset)begin
        OS_counter <=0 ;
    end else begin
        OS_counter <= OS_counter + 1;
    end
end

always @(posedge clk or posedge reset) begin//PE操作
    if (reset==1) begin
        result <= 0;
        weight <= 0;
        output_right <= 0 ;
        output_left <= 0;
        output_down <= 0;
        output_up <= 0;
    end else if(CSmode==7) begin//OS
        output_right[7:0] <= input_left[7:0];
        output_right[24:8] <= input_left[7:0]*input_up+input_left[24:8];
        output_down <= input_up;
    end else if(CSmode==1) begin//WS load from right
        weight <= input_right;
        output_left <= input_right;
    end else if(CSmode==2) begin//WS load from down
        weight <= input_down;
        output_up <= input_down;
    end else if(CSmode==3) begin//右方WS computation
        if(((sizex-(penumx%sizex))%kernelsize==0) && ((sizey-(penumy%sizey))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE, these condition probably have logic error
            result <= result + ((input_up[7:0]*weight) + input_left) + input_left[24:8];//左邊運算和
        end else begin
            if((sizex-(penumx%sizex))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出 會往下傳送運算結果以及input
                output_right <= 0; 
                output_down[7:0] <= input_up[7:0];
                output_down[24:8] <= ((input_up[7:0]*weight)+input_left)+input_up[24:8];//把左邊傳來的結果加上這次自己運算的結果往右傳
            end else if((sizey-(penumy%sizey))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 
                output_down <= 0;
                output_right[7:0] <= input_left[7:0];
            end else begin
                output_down[7:0] <= input_up[7:0];
                output_right <= input_up[7:0]*weight + input_left;
            end
        end
    end else if(CSmode==4) begin//下方WS computation
        if(((sizex-(penumx%sizex))%kernelsize==0) && ((sizey-(penumy%sizey))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE
            result <= result + (input_left[7:0]*weight)+input_up + input_left[24:8];
        end else begin
            if((sizex-(penumx%sizex))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出
                output_down <= (input_left[7:0]*weight)+input_up;
                output_right <= 0; 
            end else if((sizey-(penumy%sizey))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 會往右傳送運算結果以及input
                output_down <= 0;
                output_right[7:0] <= input_left[7:0];
                output_right[24:8] <= ((input_left[7:0]*weight)+input_up)+input_left[24:8];//把左邊傳來的結果加上這次自己運算的結果往右傳
            end else begin
                output_down <= (input_left*weight)+input_up;
                output_right[7:0] <= input_left[7:0];
            end
        end
    end else if(CSmode==0)begin
        result <= 0;
        weight <= 0;
        output_right <= 0 ;
        output_left <= 0;
        output_down <= 0;
        output_up <= 0;
    end else begin
        result <= result;
        weight <= weight;
        output_right <= output_right ;
        output_left <= output_left;
        output_down <= output_down;
        output_up <= output_up;
    end
end

endmodule

module PE_tsv(input_left,input_right,input_up,input_down,output_left,output_right,output_up,output_down,workstate,clk,tsv_in,tsv_out,reset,penumx,penumy,sizex,sizey,kernelsize,result);//有接上TSV通道的PE 但也可能沒有TSV輸入而是做為裡面的PE
/*
mode0 = idle
mode1 = OS
mode2 = OS load tsv(左側的PE仍然有可能會作為運算單元)
mode3 = WS load right
mode4 = WS load down 
mode5 = WS computation right side
mode6 = WS computation down side
*/
input clk,reset,workstate;
input [24:0] input_left,input_right,input_up,input_down,penumx,penumy,sizex,sizey,kernelsize,tsv_in;

output reg [24:0] output_right,output_left,output_down,output_up,tsv_out,result;//first 8 bit is input data, last 17 bit is computation result

reg[2:0] NSmode,CSmode;
reg[15:0] weight, OS_counter;

always @(*) begin//state machine
    case(CSmode)
    0:begin//idle
        if(workstate)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if((penumx%sizex <= (kernelsize*kernelsize)) && (penumy%sizey <= (kernelsize*kernelsize)))begin//OS
                if((penumx%sizex ==1) || (penumy%sizey ==1))begin//OS
                    NSmode = 2;
                end else begin
                    NSmode = 1;
                end
            end else if((sizey-(penumy%sizey)) <= kernelsize) begin//下方WS
                NSmode = 4;
            end else if((sizex-(penumx%sizex)) <= kernelsize)begin//右邊WS
                NSmode = 3;
            end else begin
                NSmode = 0;
            end
        end else begin
            NSmode = 0;
        end
    end
    1:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 1;
        end
    end
    2:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 2;
        end
    end
    3:begin
        if(OS_counter >= ((sizey-(penumy%sizey))%kernelsize)*kernelsize)begin
            NSmode = 5;
        end else begin
            NSmode = 3;
        end
    end
    4:begin
        if(OS_counter >= ((sizey-(penumy%sizey))%kernelsize)*kernelsize)begin
            NSmode = 6;
        end else begin
            NSmode = 4;
        end
    end
    5:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 5;
        end
    end
    6:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 6;
        end
    end
    default: NSmode = 0;
    endcase
end

always @(posedge clk or posedge reset) begin//state machine
    if(reset)begin
        CSmode <= 0;
    end else begin
        CSmode <= NSmode;
    end
end

always @(posedge clk or posedge reset) begin//用來看運算時間的
    if(reset)begin
        OS_counter <=0 ;
    end else begin
        OS_counter <= OS_counter + 1;
    end
end

always @(posedge clk or posedge reset) begin//PE operation
    if (reset==1) begin
        result <= 0;
        weight <= 0;
        output_right <= 0 ;
        output_left <= 0;
        output_down <= 0;
        output_up <= 0;
    end else if(CSmode==0)begin//idle
        result <= 0;
        weight <= 0;
        output_right <= 0 ;
        output_left <= 0;
        output_down <= 0;
        output_up <= 0;
    end else if(CSmode==1) begin//OS 
        output_right[7:0] <= input_left[7:0];
        output_right[24:8] <= input_left[7:0]*input_up+input_left[24:8];
        if(penumy%sizey==kernelsize)begin//如果是在最下方的OS不會有往下給的輸出
            output_down <= 0;
        end else begin
            output_down <= input_up;
        end
        output_down <= input_up;
    end else if(CSmode==2)begin
        if((penumx%sizex==1))begin//左方OS第一個PE TSV吃input
            output_right[7:0] <= tsv_in;
            output_right[24:8] <= tsv_in*input_up;
            output_down <= input_up;//傳送weight
        end else begin//上方OS第一個PE TSV吃weight
            output_down <= tsv_in;
            output_right[7:0] <= input_left[7:0];
            output_right[24:8] <= input_left[7:0]*tsv_in+input_left[24:8];
        end
    end else if(CSmode==3) begin//WS load from right
        weight <= input_right;
        output_left <= input_right;
    end else if(CSmode==4) begin//WS load from down
        weight <= input_down;
        output_up <= input_down;
    end else if(CSmode==5) begin//右方WS computation
        if(((sizex-(penumx%sizex))%kernelsize==0) && ((sizey-(penumy%sizey))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE, these condition probably have logic error
            result <= result + ((input_up[7:0]*weight) + input_left) + input_up[24:8];
        end else begin
            if((sizex-(penumx%sizex))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出 會往下傳送運算結果以及input
                if(OS_counter < 3*kernelsize*kernelsize+kernelsize)begin//如果OS算完的結果還沒傳過來
                    output_right <= 0; 
                    output_down[7:0] <= input_up[7:0];
                    output_down[24:8] <= ((input_up[7:0]*weight)+input_left)+input_up[24:8];//把上面傳來的結果加上這次自己運算的結果往下傳
                end else begin//把OS運算結果往右傳
                    output_right[24:8] <= input_left[24:8];
                end
            end else if((sizey-(penumy%sizey))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 
                output_down <= 0;
                output_right[7:0] <= input_left[7:0];
            end else begin
                output_down[7:0] <= input_up[7:0];
                output_right <= input_up[7:0]*weight + input_left;
            end
        end
    end else if(CSmode==6) begin//下方WS computation
        if(((sizex-(penumx%sizex))%kernelsize==0) && ((sizey-(penumy%sizey))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE
            result <= result + (input_left[7:0]*weight)+input_up + input_left[24:8];
        end else begin
            if((sizex-(penumx%sizex))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出
                output_down <= (input_left[7:0]*weight)+input_up;
                output_right <= 0; 
            end else if((sizey-(penumy%sizey))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 會往右傳送運算結果以及input
                if(OS_counter < 3*kernelsize*kernelsize+kernelsize)begin//如果OS算完的結果還沒傳過來
                    output_down <= 0;
                    output_right[7:0] <= input_left[7:0];
                    output_right[24:8] <= ((input_left[7:0]*weight)+input_up)+input_left[24:8];//把左邊傳來的結果加上這次自己運算的結果往右傳
                end else begin
                    output_down <= 0;
                    output_right[7:0] <= input_left[7:0];
                    output_right[24:8] <= input_left[24:8];//只傳送OS的運算結果
                end
            end else begin
                output_down <= (input_left*weight)+input_up;
                output_right[7:0] <= input_left[7:0];
            end
        end
    end else begin
        result <= result;
        weight <= weight;
        output_right <= output_right ;
        output_left <= output_left;
        output_down <= output_down;
        output_up <= output_up;
    end
end

endmodule

module PE_dual_tsv(input_left,input_right,input_up,input_down,output_left,output_right,output_up,output_down,workstate,clk,tsv_in1,tsv_in2,tsv_out,reset,penumx,penumy,sizex,sizey,kernelsize,result);//在每一個PE區塊中最左上角的那個PE 需要有兩個TSVinput
/*
如果作為最左上角PE的話input from tsv_in1, weight from tsv_in2
但作為其他一般輸入單元的話資料就都從tsv_in1進去
----------------------------------------------------------------------
mode0 = idle
mode1 = OS
mode2 = OS load tsv(左側的PE仍然有可能會作為運算單元)
mode3 = WS load right
mode4 = WS load down 
mode5 = WS computation right side
mode6 = WS computation down side
*/
input clk,reset,workstate;
input [24:0] input_left,input_right,input_up,input_down,penumx,penumy,sizex,sizey,kernelsize,tsv_in1,tsv_in2;

output reg [24:0] output_right,output_left,output_down,output_up,tsv_out,result;//first 8 bit is input data, last 17 bit is computation result

reg[2:0] NSmode,CSmode;
reg[15:0] weight, OS_counter;

always @(*) begin//state machine
    case(CSmode)
    0:begin//idle
        if(workstate)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if((penumx%sizex <= (kernelsize*kernelsize)) && (penumy%sizey <= (kernelsize*kernelsize)))begin//OS
                if((penumx%sizex ==1) || (penumy%sizey ==1))begin//OS
                    NSmode = 2;
                end else begin
                    NSmode = 1;
                end
            end else if((sizey-(penumy%sizey)) <= kernelsize) begin//下方WS
                NSmode = 4;
            end else if((sizex-(penumx%sizex)) <= kernelsize)begin//右邊WS
                NSmode = 3;
            end else begin
                NSmode = 0;
            end
        end else begin
            NSmode = 0;
        end
    end
    1:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 1;
        end
    end
    2:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 2;
        end
    end
    3:begin
        if(OS_counter >= ((sizey-(penumy%sizey))%kernelsize)*kernelsize)begin
            NSmode = 5;
        end else begin
            NSmode = 3;
        end
    end
    4:begin
        if(OS_counter >= ((sizey-(penumy%sizey))%kernelsize)*kernelsize)begin
            NSmode = 6;
        end else begin
            NSmode = 4;
        end
    end
    5:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 5;
        end
    end
    6:begin
        if(OS_counter >= (3*kernelsize*kernelsize + (sizey-(penumy%sizey))))begin//stitch to idle if calculation is done 不然就維持在OS
            NSmode = 0; 
        end else begin
            NSmode = 6;
        end
    end
    default: NSmode = 0;
    endcase
end

always @(posedge clk or posedge reset) begin//state machine
    if(reset)begin
        CSmode <= 0;
    end else begin
        CSmode <= NSmode;
    end
end

always @(posedge clk or posedge reset) begin//用來看運算時間的
    if(reset)begin
        OS_counter <=0 ;
    end else begin
        OS_counter <= OS_counter + 1;
    end
end

always @(posedge clk or posedge reset) begin//PE operation
    if (reset==1) begin
        result <= 0;
        weight <= 0;
        output_right <= 0 ;
        output_left <= 0;
        output_down <= 0;
        output_up <= 0;
    end else if(CSmode==0)begin//idle
        result <= 0;
        weight <= 0;
        output_right <= 0 ;
        output_left <= 0;
        output_down <= 0;
        output_up <= 0;
    end else if(CSmode==1) begin//OS 
        output_right[7:0] <= input_left[7:0];
        output_right[24:8] <= input_left[7:0]*input_up+input_left[24:8];
        output_down <= input_up;
    end else if(CSmode==2)begin
        if((penumx%sizex ==1) && (penumy%sizey ==1))begin//如果是最左上那個PE
            output_right[7:0] <= tsv_in1;//pass input
            output_right[24:8] <= tsv_in1*tsv_in2;
            output_down <= tsv_in2;//pass weight
        end else begin
            if((penumx%sizex==1))begin//左方OS第一個PE TSV吃input
                output_right[7:0] <= tsv_in1;
                output_right[24:8] <= tsv_in1*input_up+input_left[24:8];
                output_down <= input_up;//傳送weight
            end else begin//上方OS第一個PE TSV吃weight
                output_down <= tsv_in1;
                output_right[7:0] <= input_left[7:0];
                output_right[24:8] <= input_left[7:0]*tsv_in1+input_left[24:8];
            end
        end
    end else if(CSmode==3) begin//WS load from right
        weight <= input_right;
        output_left <= input_right;
    end else if(CSmode==4) begin//WS load from down
        weight <= input_down;
        output_up <= input_down;
    end else if(CSmode==5) begin//右方WS computation
        if(((sizex-(penumx%sizex))%kernelsize==0) && ((sizey-(penumy%sizey))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE, these condition probably have logic error
            result <= result + ((input_up[7:0]*weight) + input_left) + input_up[24:8];
        end else begin
            if((sizex-(penumx%sizex))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出 會往下傳送運算結果以及input
                if(OS_counter < 3*kernelsize*kernelsize+kernelsize)begin//如果OS算完的結果還沒傳過來
                    output_right <= 0; 
                    output_down[7:0] <= input_up[7:0];
                    output_down[24:8] <= ((input_up[7:0]*weight)+input_left)+input_up[24:8];//把上面傳來的結果加上這次自己運算的結果往下傳
                end else begin//把OS運算結果往右傳
                    output_right[24:8] <= input_left[24:8];
                end
            end else if((sizey-(penumy%sizey))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 
                output_down <= 0;
                output_right[7:0] <= input_left[7:0];
            end else begin
                output_down[7:0] <= input_up[7:0];
                output_right <= input_up[7:0]*weight + input_left;
            end
        end
    end else if(CSmode==6) begin//下方WS computation
        if(((sizex-(penumx%sizex))%kernelsize==0) && ((sizey-(penumy%sizey))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE
            result <= result + (input_left[7:0]*weight)+input_up + input_left[24:8];
        end else begin
            if((sizex-(penumx%sizex))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出
                output_down <= (input_left[7:0]*weight)+input_up;
                output_right <= 0; 
            end else if((sizey-(penumy%sizey))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 會往右傳送運算結果以及input
                if(OS_counter < 3*kernelsize*kernelsize+kernelsize)begin//如果OS算完的結果還沒傳過來
                    output_down <= 0;
                    output_right[7:0] <= input_left[7:0];
                    output_right[24:8] <= ((input_left[7:0]*weight)+input_up)+input_left[24:8];//把左邊傳來的結果加上這次自己運算的結果往右傳
                end else begin
                    output_down <= 0;
                    output_right[7:0] <= input_left[7:0];
                    output_right[24:8] <= input_left[24:8];//只傳送OS的運算結果
                end
            end else begin
                output_down <= (input_left*weight)+input_up;
                output_right[7:0] <= input_left[7:0];
            end
        end
    end else begin
        result <= result;
        weight <= weight;
        output_right <= output_right ;
        output_left <= output_left;
        output_down <= output_down;
        output_up <= output_up;
    end
end

endmodule

module Controller(clk,reset,workstate,tsv_out);//,penumx,penumy,sizex,sizey,kernelsize

input clk,reset;
input  workstate;//開始給資料就變成1 運算結束變0
// input[24:0] penumx,penumy,sizex,sizey,kernelsize;
output[24:0] tsv_out;

logic [24:0] output_right[3:0];
logic [24:0] output_left[3:0];
logic [24:0] output_down[3:0];
logic [24:0] output_up[3:0];
logic [24:0] result[3:0];

PE_dual_tsv pe11(25'd1,25'd2,25'd3,25'd4,output_left[0],output_right[0],output_up[0],output_down[0],workstate,clk,25'd3,25'd3,tsv_out,reset,25'd1,25'd1,25'd12,25'd12,25'd3,result[0]);
PE_tsv pe21(25'd1,25'd2,25'd3,output_down[0],output_left[1],output_right[1],output_up[1],output_down[1],workstate,clk,25'd9,tsv_out,reset,25'd2,25'd1,25'd12,25'd12,25'd3,result[1]);
PE pe22(output_right[1],25'd2,25'd3,25'd4,output_left[2],output_right[2],output_up[2],output_down[2],workstate,clk,reset,25'd2,25'd2,25'd12,25'd12,25'd3,result[2]);
PE pe23(output_right[2],25'd2,25'd3,25'd4,output_left[3],output_right[3],output_up[3],output_down[3],workstate,clk,reset,25'd2,25'd3,25'd12,25'd12,25'd3,result[3]);

endmodule

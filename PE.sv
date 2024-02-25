`timescale 1ns / 1ps
//作為 OS/down side WS 時所有的output_right都分為兩個部分, 前面[7:0]是需要往右繼續傳的input 後面[24:8]是要傳的運算結果
//作為 right side WS時分成兩部分的則是output_down
//OS運算所需的時間為3*(kernelsize)^2
module PE(input_left,input_right,input_up,input_down,output_left,output_right,output_up,output_down,state,clk,rst,penumx,penumy,size,kernelsize,result);//沒有接上TSV的一般PE
/*
mode0 = idle
mode1 = WS load right
mode2 = WS load down 
mode3 = WS computation right side
mode4 = WS computation down side
mode7 = OS
*/
input clk,rst,state;
input [15:0] size;
input [41:0] input_left,input_right,input_up,input_down,penumx,penumy,kernelsize;

output reg [41:0] output_right,output_left,output_down,output_up,result;//first 8 bit is input data, last 17 bit is computation result

reg[2:0] NSmode,CSmode;
reg[15:0] weight, OS_counter;

always @(*) begin//state machine
    case(CSmode)
    0:begin//idle
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if((penumx%size <= (kernelsize*kernelsize)) && (penumy%size <= (kernelsize*kernelsize)))begin//OS
                if((penumx%size==0) && (penumy%size==0))begin
                    NSmode = 2;
                end else begin
                    NSmode = 7;
                end
            end else if((size-(penumy%size)) <= kernelsize) begin//下方WS
                NSmode = 2;
            end else if((size-(penumx%size)) <= kernelsize)begin//右邊WS
                NSmode = 1;
            end else begin
                NSmode = 0;
            end
        end else begin
            NSmode = 0;
        end
    end
    1:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= ((size-(penumy%size))%kernelsize)*kernelsize)begin
                NSmode = 3;
            end else begin
                NSmode = 1;
            end
        end else begin
            NSmode = 0;
        end
    end
    2:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= ((size-(penumy%size))%kernelsize)*kernelsize)begin
                NSmode = 4;
            end else begin
                NSmode = 2;
            end
        end else begin
            NSmode = 0;
        end
    end
    3:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在WS
                NSmode = 0;
            end else begin
                NSmode = 3;
            end
        end else begin
            NSmode = 0;
        end
    end
    4:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
           if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在WS
                NSmode = 0;
            end else begin
                NSmode = 4;
            end 
        end else begin
            NSmode = 0;
        end
    end
    7:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 7;
            end
        end else begin
            NSmode = 0;
        end
    end
    default: NSmode = 0;
    endcase
end

always @(posedge clk or posedge rst) begin//state machine
    if(rst)begin
        CSmode <= 0;
    end else begin
        CSmode <= NSmode;
    end
end

always @(posedge clk or posedge rst) begin//計算運算時間的工具
    if(rst)begin
        OS_counter <=0 ;
    end else begin
        OS_counter <= OS_counter + 1;
    end
end

always @(posedge clk or posedge rst) begin//PE操作
    if (rst==1) begin
        result <= 0;
        weight <= 0;
        output_right <= 0 ;
        output_left <= 0;
        output_down <= 0;
        output_up <= 0;
    end else if(CSmode==7) begin//OS
        output_right[7:0] <= input_left[7:0];
        if(penumy%size==kernelsize*kernelsize)begin//如果是在最下方的OS不會有往下給的輸出
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_up[24:8] <= input_down[24:8];
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                if(OS_counter == 3*kernelsize*kernelsize-1)begin
                    output_up[24:8] <= result + input_left[7:0]*input_up;
                end else begin
                    result <= result + input_left[7:0]*input_up;
                end
            end
            output_down <= 0;
        end else begin//不是最下方的OS
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_up[24:8] <= input_down[24:8];
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                if(OS_counter == 3*kernelsize*kernelsize-1)begin
                    output_up[24:8] <= result + input_left[7:0]*input_up;
                end else begin
                    result <= result + input_left[7:0]*input_up;
                end
            end
            output_down <= input_up;
        end
    end else if(CSmode==1) begin//WS load from right
        weight <= input_right;
        output_left <= input_right;
    end else if(CSmode==2) begin//WS load from down
        weight <= input_down;
        output_up <= input_down;
    end else if(CSmode==3) begin//右方WS computation
        if(((size-(penumx%size))%kernelsize==0) && ((size-(penumy%size))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE, these condition probably have logic error
            output_right[41:25] <= output_right[41:25] + ((input_up[7:0]*weight) + input_left) + input_left[24:8];//左邊運算和
        end else begin
            output_right[41:25] <= input_left[41:25];//傳送左邊另一塊WS運算和 Controller會在需要的時候自己拿
            if((size-(penumx%size))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出 會往下傳送運算結果以及input
                if(OS_counter < 3*kernelsize*kernelsize+kernelsize)begin//如果OS算完的結果還沒傳過來
                    output_right <= 0; 
                    output_down[7:0] <= input_up[7:0];
                    output_down[24:8] <= ((input_up[7:0]*weight)+input_left)+input_up[24:8];//把上面傳來的結果加上這次自己運算的結果往下傳
                end else begin//把OS運算結果往右傳
                    output_right[24:8] <= input_left[24:8];
                end
            end else if((size-(penumy%size))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 
                output_down <= 0;
                output_right[7:0] <= input_left[7:0];
            end else begin
                output_down[7:0] <= input_up[7:0];
                output_right <= input_up[7:0]*weight + input_left;
            end
        end
    end else if(CSmode==4) begin//下方WS computation
        if(((size-(penumx%size))%kernelsize==0) && ((size-(penumy%size))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE
            output_down[41:25] <= output_down[41:25] + (input_left[7:0]*weight)+input_up + input_left[24:8];//會不斷累積運算結果
        end else begin
            output_down[41:25] <= input_down[41:25];//單純傳送前一塊WS的最終結果
            if((size-(penumx%size))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出
                output_down <= (input_left[7:0]*weight)+input_up;
                output_right <= 0; 
            end else if((size-(penumy%size))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 會往右傳送運算結果以及input
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

module PE_tsv(input_left,input_right,input_up,input_down,output_left,output_right,output_up,output_down,state,clk,tsv_in,tsv_out,rst,penumx,penumy,size,kernelsize,result);//有接上TSV通道的PE 但也可能沒有TSV輸入而是做為裡面的PE
/*
mode0 = idle
mode1 = OS
mode2 = OS load tsv(左側的PE仍然有可能會作為運算單元)
mode3 = WS load right
mode4 = WS load down 
mode5 = WS computation right side
mode6 = WS computation down side
*/
input clk,rst,state;
input [15:0] size;
input [41:0] input_left,input_right,input_up,input_down,penumx,penumy,kernelsize,tsv_in;

output reg [41:0] output_right,output_left,output_down,output_up,tsv_out,result;//first 8 bit is input data, last 17 bit is computation result

reg[2:0] NSmode,CSmode;
reg[15:0] weight, OS_counter;

always @(*) begin//state machine
    case(CSmode)
    0:begin//idle
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if((penumx%size <= (kernelsize*kernelsize)) && (penumy%size <= (kernelsize*kernelsize)))begin//OS
                if((penumx%size ==1) || (penumy%size ==1))begin//OS
                    NSmode = 2;
                end else begin
                    NSmode = 1;
                end
            end else if((size-(penumy%size)) <= kernelsize) begin//下方WS
                NSmode = 4;
            end else if((size-(penumx%size)) <= kernelsize)begin//右邊WS
                NSmode = 3;
            end else begin
                NSmode = 0;
            end
        end else begin
            NSmode = 0;
        end
    end
    1:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 1;
            end
        end else begin
            NSmode = 0;
        end
        
    end
    2:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 2;
            end
        end else begin
            NSmode = 0;
        end
        
    end
    3:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= ((size-(penumy%size))%kernelsize)*kernelsize)begin
                NSmode = 5;
            end else begin
                NSmode = 3;
            end
        end else begin
            NSmode = 0;
        end
        
    end
    4:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= ((size-(penumy%size))%kernelsize)*kernelsize)begin
                NSmode = 6;
            end else begin
                NSmode = 4;
            end
        end else begin
            NSmode = 0;
        end
    end
    5:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 5;
            end
        end else begin
            NSmode = 0;
        end
    end
    6:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 6;
            end
        end else begin
            NSmode = 0;
        end
    end
    default: NSmode = 0;
    endcase
end

always @(posedge clk or posedge rst) begin//state machine
    if(rst)begin
        CSmode <= 0;
    end else begin
        CSmode <= NSmode;
    end
end

always @(posedge clk or posedge rst) begin//用來看運算時間的
    if(rst)begin
        OS_counter <=0 ;
    end else begin
        OS_counter <= OS_counter + 1;
    end
end

always @(posedge clk or posedge rst) begin//PE operation
    if (rst==1) begin
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
        if(penumy%size==kernelsize*kernelsize)begin//如果是在最下方的OS不會有往下給的輸出
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_up[24:8] <= input_down[24:8];
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                if(OS_counter == 3*kernelsize*kernelsize-1)begin
                    output_up[24:8] <= result + input_left[7:0]*input_up;
                end else begin
                    result <= result + input_left[7:0]*input_up;
                end
            end
            output_down <= 0;
        end else begin//不是最下方的OS
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_up[24:8] <= input_down[24:8];
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                if(OS_counter == 3*kernelsize*kernelsize-1)begin
                    output_up[24:8] <= result + input_left[7:0]*input_up;
                end else begin
                    result <= result + input_left[7:0]*input_up;
                end
            end
            output_down <= input_up;
        end
    end else if(CSmode==2)begin
        if((penumx%size==1))begin//左方OS第一個PE TSV吃input
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_right[24:8] <= input_left[24:8];
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                if(OS_counter == 3*kernelsize*kernelsize-1)begin
                    output_right[24:8] <= result + tsv_in*input_up;
                end else begin
                    result <= result + tsv_in*input_up;
                end
            end
            output_right[7:0] <= tsv_in;
            output_down <= input_up;//傳送weight
        end else begin//上方OS第一個PE TSV吃weight
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_right[24:8] <= input_left[24:8];
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                if(OS_counter == 3*kernelsize*kernelsize-1)begin
                    output_right[24:8] <= result + input_left[7:0]*tsv_in;
                end else begin
                    result <= result + input_left[7:0]*tsv_in;
                end
            end
            output_down <= tsv_in;
            output_right[7:0] <= input_left[7:0];
        end
    end else if(CSmode==3) begin//WS load from right
        weight <= input_right;
        output_left <= input_right;
    end else if(CSmode==4) begin//WS load from down
        weight <= input_down;
        output_up <= input_down;
    end else if(CSmode==5) begin//右方WS computation
        if(((size-(penumx%size))%kernelsize==0) && ((size-(penumy%size))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE, these condition probably have logic error
            output_right[41:25] <= output_right[41:25] + ((input_up[7:0]*weight) + input_left) + input_left[24:8];//左邊運算和
        end else begin
            output_right[41:25] <= input_left[41:25];//傳送左邊另一塊WS運算和 Controller會在需要的時候自己拿
            if((size-(penumx%size))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出 會往下傳送運算結果以及input
                if(OS_counter < 3*kernelsize*kernelsize+kernelsize)begin//如果OS算完的結果還沒傳過來
                    output_right <= 0; 
                    output_down[7:0] <= input_up[7:0];
                    output_down[24:8] <= ((input_up[7:0]*weight)+input_left)+input_up[24:8];//把上面傳來的結果加上這次自己運算的結果往下傳
                end else begin//把OS運算結果往右傳
                    output_right[24:8] <= input_left[24:8];
                end
            end else if((size-(penumy%size))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 
                output_down <= 0;
                output_right[7:0] <= input_left[7:0];
            end else begin
                output_down[7:0] <= input_up[7:0];
                output_right <= input_up[7:0]*weight + input_left;
            end
        end
    end else if(CSmode==6) begin//下方WS computation
        if(((size-(penumx%size))%kernelsize==0) && ((size-(penumy%size))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE
            output_down[41:25] <= output_down[41:25] + (input_left[7:0]*weight)+input_up + input_left[24:8];//會不斷累積運算結果
        end else begin
            output_down[41:25] <= input_down[41:25];//單純傳送前一塊WS的最終結果
            if((size-(penumx%size))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出
                output_down <= (input_left[7:0]*weight)+input_up;
                output_right <= 0; 
            end else if((size-(penumy%size))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 會往右傳送運算結果以及input
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

module PE_dual_tsv(input_left,input_right,input_up,input_down,output_left,output_right,output_up,output_down,state,clk,tsv_in1,tsv_in2,tsv_out,rst,penumx,penumy,size,kernelsize,result);//在每一個PE區塊中最左上角的那個PE 需要有兩個TSVinput
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
input clk,rst,state;
input [15:0] size;
input [41:0] input_left,input_right,input_up,input_down,penumx,penumy,kernelsize,tsv_in1,tsv_in2;

output reg [41:0] output_right,output_left,output_down,output_up,tsv_out,result;//first 8 bit is input data, last 17 bit is computation result

reg[2:0] NSmode,CSmode;
logic [15:0] weight, OS_counter;

always @(*) begin//state machine
    case(CSmode)
    0:begin//idle
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if((penumx%size <= (kernelsize*kernelsize)) && (penumy%size <= (kernelsize*kernelsize)))begin//OS
                if((penumx%size ==1) || (penumy%size ==1))begin//OS
                    NSmode = 2;
                end else begin
                    NSmode = 1;
                end
            end else if((size-(penumy%size)) <= kernelsize) begin//下方WS
                NSmode = 4;
            end else if((size-(penumx%size)) <= kernelsize)begin//右邊WS
                NSmode = 3;
            end else begin
                NSmode = 0;
            end
        end else begin
            NSmode = 0;
        end
    end
    1:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 1;
            end
        end else begin
            NSmode = 0;
        end
    end
    2:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 2;
            end
        end else begin
            NSmode = 0;
        end
        
    end
    3:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= ((size-(penumy%size))%kernelsize)*kernelsize)begin
                NSmode = 5;
            end else begin
                NSmode = 3;
            end
        end else begin
            NSmode = 0;
        end
        
    end
    4:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
           if(OS_counter >= ((size-(penumy%size))%kernelsize)*kernelsize)begin
                NSmode = 6;
            end else begin
                NSmode = 4;
            end 
        end else begin
            NSmode = 0;
        end
        
    end
    5:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 5;
            end
        end else begin
            NSmode = 0;
        end
        
    end
    6:begin
        if(state)begin//如果開始有資料傳進來 根據PE所在相對位置判斷該是甚麼工作狀態(OS or WS)
            if(OS_counter >= (3*kernelsize*kernelsize + (size-(penumy%size))))begin//stitch to idle if calculation is done 不然就維持在OS
                NSmode = 0; 
            end else begin
                NSmode = 6;
            end
        end else begin
            NSmode = 0;
        end
    end
    default: NSmode = 0;
    endcase
end

always @(posedge clk or posedge rst) begin//state machine
    if(rst)begin
        CSmode <= 0;
    end else begin
        CSmode <= NSmode;
    end
end

always @(posedge clk or posedge rst) begin//用來看運算時間的
    if(rst)begin
        OS_counter <=0 ;
    end else begin
        OS_counter <= OS_counter + 1;
    end
end

always @(posedge clk or posedge rst) begin//PE operation
    if (rst==1) begin
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
        if(penumy%size==kernelsize*kernelsize)begin//如果是在最下方的OS不會有往下給的輸出
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_up[24:8] <= input_down[24:8];
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                if(OS_counter == 3*kernelsize*kernelsize-1)begin
                    output_up[24:8] <= result + input_left[7:0]*input_up;
                end else begin
                    result <= result + input_left[7:0]*input_up;
                end
            end
            output_down <= 0;
        end else begin//不是最下方的OS
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_up[24:8] <= input_down[24:8];
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                if(OS_counter == 3*kernelsize*kernelsize-1)begin
                    output_up[24:8] <= result + input_left[7:0]*input_up;
                end else begin
                    result <= result + input_left[7:0]*input_up;
                end
            end
            output_down <= input_up;
        end
    end else if(CSmode==2)begin
        if((penumx%size ==1) && (penumy%size ==1))begin//如果是最左上那個PE
            if(OS_counter >= 3*kernelsize*kernelsize)begin
                output_right[24:8] <= result;
            end else  begin//OS運作結束之前都會在PE內累計運算結果
                result <= result + tsv_in1*tsv_in2;
            end
            output_right[7:0] <= tsv_in1;//pass input
            output_down <= tsv_in2;//pass weight
        end else begin
            if((penumx%size==1))begin//左方OS第一個PE TSV吃input
                if(OS_counter >= 3*kernelsize*kernelsize)begin
                    output_right[24:8] <= input_left[24:8];
                end else  begin//OS運作結束之前都會在PE內累計運算結果
                    if(OS_counter == 3*kernelsize*kernelsize-1)begin
                        output_right[24:8] <= result + tsv_in1*input_up;
                    end else begin
                        result <= result + tsv_in1*input_up;
                    end
                end
                output_right[7:0] <= tsv_in1;
                output_down <= input_up;//傳送weight
            end else begin//上方OS第一個PE TSV吃weight
                if(OS_counter >= 3*kernelsize*kernelsize)begin
                    output_right[24:8] <= input_left[24:8];
                end else  begin//OS運作結束之前都會在PE內累計運算結果
                    if(OS_counter == 3*kernelsize*kernelsize-1)begin
                        output_right[24:8] <= result + input_left[7:0]*tsv_in1;
                    end else begin
                        result <= result + input_left[7:0]*tsv_in1;
                    end
                end
                output_down <= tsv_in1;
                output_right[7:0] <= input_left[7:0];
            end
        end
    end else if(CSmode==3) begin//WS load from right
        weight <= input_right;
        output_left <= input_right;
    end else if(CSmode==4) begin//WS load from down
        weight <= input_down;
        output_up <= input_down;
    end else if(CSmode==5) begin//右方WS computation
        if(((size-(penumx%size))%kernelsize==0) && ((size-(penumy%size))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE, these condition probably have logic error
            output_right[41:25] <= output_right[41:25] + ((input_up[7:0]*weight) + input_left) + input_left[24:8];//左邊運算和
        end else begin
            output_right[41:25] <= input_left[41:25];//傳送左邊另一塊WS運算和 Controller會在需要的時候自己拿
            if((size-(penumx%size))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出 會往下傳送運算結果以及input
                if(OS_counter < 3*kernelsize*kernelsize+kernelsize)begin//如果OS算完的結果還沒傳過來
                    output_right <= 0; 
                    output_down[7:0] <= input_up[7:0];
                    output_down[24:8] <= ((input_up[7:0]*weight)+input_left)+input_up[24:8];//把上面傳來的結果加上這次自己運算的結果往下傳
                end else begin//把OS運算結果往右傳
                    output_right[24:8] <= input_left[24:8];
                end
            end else if((size-(penumy%size))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 
                output_down <= 0;
                output_right[7:0] <= input_left[7:0];
            end else begin
                output_down[7:0] <= input_up[7:0];
                output_right <= input_up[7:0]*weight + input_left;
            end
        end
    end else if(CSmode==6) begin//下方WS computation
        if(((size-(penumx%size))%kernelsize==0) && ((size-(penumy%size))%kernelsize==0))begin//如果是最右下那個滿足兩種條件的PE
            output_down[41:25] <= output_down[41:25] + (input_left[7:0]*weight)+input_up + input_left[24:8];//會不斷累積運算結果
        end else begin
            output_down[41:25] <= input_down[41:25];//單純傳送前一塊WS的最終結果
            if((size-(penumx%size))%kernelsize==0)begin//如果在WS中是最右的 不會有往右的輸出
                output_down <= (input_left[7:0]*weight)+input_up;
                output_right <= 0; 
            end else if((size-(penumy%size))%kernelsize==0) begin//如果在WS中是最下的 不會有往下的輸出 會往右傳送運算結果以及input
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



module Controller(input clk, input rst, input integer kernelsize[1:0], input integer input_totalnum, output logic[41:0]tsv_out[8:0][8:0]);//,penumx,penumy,size,kernelsize
// input[24:0] penumx,penumy,size,kernelsize;
//f n是state abcdr是OSnum jp是OS counter

logic [41:0] OSIS[15:0];//OS sram input
logic [41:0] OSWS[15:0];//OS sram weight
logic [5:0]  OSISnum[15:0][15:0];//用來決定OS sram input的位置讀到哪的參數
logic [5:0]  OSWSnum[15:0][15:0];//用來決定OS sram weight的位置讀到哪的參數
logic [15:0] OS_counter[1:0][15:0];
logic [15:0] state[2];

assign state[0] = state0;
assign state[1] = state1;

logic [15:0] size[1:0];
logic [15:0] PE_size;
assign PE_size = 16'd16;

always_comb begin//決定切割後的PE大小
    for(int a=0 ; a<1 ; a=a+1)begin
        if(PE_size/2 >= kernelsize[a]*kernelsize[a])begin
            if(PE_size/4 >= kernelsize[a]*kernelsize[a])begin
                size[a] = PE_size/4;
            end else begin
                size[a] = PE_size/2;
            end
        end else begin
            size[a] = PE_size;
        end
    end
end

logic [15:0] state0,state1;//這樣才能用每個bit or的操作
integer f0;
integer n0;
always_ff @( posedge clk or posedge rst ) begin//state 操作
    if(rst)begin
        for(f0=0 ; f0<16 ; f0=f0+1)begin
            state0[f0] <= 0;
        end
    end else begin
        for(n0=0 ; n0<16 ; n0=n0+1) begin
            if(state0[n0] == 0 && total_num >= 0*(PE_size/size[0])*(PE_size/size[0])+n0%16)begin//如果PE現在沒有再進行運算而且剩下能算的input數量夠多
                if(PE_size/size[0]==4)begin
                    state0[n0] <= 1;
                end else if(PE_size/size[0]==2)begin
                    if(n0%4==0)begin
                        state0[n0] <= 1;state0[n0+1] <= 1;state0[n0+2] <= 1;state0[n0+3] <= 1;
                    end else begin
                        state0[n0] <= state0[n0];state0[n0+1] <= state0[n0+1];
                        state0[n0+2] <= state0[n0+2];state0[n0+3] <= state0[n0+3];
                    end
                end else begin
                    if(n0==0)begin
                        state0[n0] <= 1;state0[n0+1] <= 1;state0[n0+2] <= 1;state0[n0+3] <= 1;state0[n0+4] <= 1;state0[n0+5] <= 1;state0[n0+6] <= 1;state0[n0+7] <= 1;
                        state0[n0+8] <= 1;state0[n0+9] <= 1;state0[n0+10] <= 1;state0[n0+11] <= 1;state0[n0+12] <= 1;state0[n0+13] <= 1;state0[n0+14] <= 1;state0[n0+15] <= 1;
                    end
                end
            end else begin
                if(OS_counter[0][n0] > 4*kernelsize[0]*kernelsize[0])begin
                    state0[n0] <= 0;
                end else begin
                    state0[n0] <= state0[n0];
                end
            end
        end
    end
end

integer f1;
integer n1;
always_ff @( posedge clk or posedge rst ) begin//state 操作
    if(rst)begin
        for(f1=0 ; f1<16 ; f1=f1+1)begin
            state1[f1] <= 0;
        end
    end else begin
        for(n1=0 ; n1<16 ; n1=n1+1) begin
            if(state1[n1] == 0 && total_num >= 1*(PE_size/size[1])*(PE_size/size[1])+n1%16)begin//如果PE現在沒有再進行運算而且剩下能算的input數量夠多
                if(PE_size/size[1]==4)begin
                    state1[n1] <= 1;
                end else if(PE_size/size[1]==2)begin
                    if(n1%4==0)begin
                        state1[n1] <= 1;state1[n1+1] <= 1;state1[n1+2] <= 1;state1[n1+3] <= 1;
                    end else begin
                        state1[n1] <= state1[n1];state1[n1+1] <= state1[n1+1];
                        state1[n1+2] <= state1[n1+2];state1[n1+3] <= state1[n1+3];
                    end
                end else begin
                    if(n1==0)begin
                        state1[n1] <= 1;state1[n1+1] <= 1;state1[n1+2] <= 1;state1[n1+3] <= 1;state1[n1+4] <= 1;state1[n1+5] <= 1;state1[n1+6] <= 1;state1[n1+7] <= 1;
                        state1[n1+8] <= 1;state1[n1+9] <= 1;state1[n1+10] <= 1;state1[n1+11] <= 1;state1[n1+12] <= 1;state1[n1+13] <= 1;state1[n1+14] <= 1;state1[n1+15] <= 1;
                    end
                end
            end else begin
                if(OS_counter[0][n1] > 4*kernelsize[1]*kernelsize[1])begin
                    state1[n1] <= 0;
                end else begin
                    state1[n1] <= state1[n1];
                end
            end
        end
    end
end

logic signal[2][16][4];
always_comb begin : blockName
    for (int s=0 ; s<2 ; s=s+1) begin//第幾層Layer
        for (int s1=0 ; s1<16 ; s1=s1+1) begin//第幾個PE block
            for (int s2=0 ; s2<5 ; s2=s2+1) begin//4是PE切割的大小
                if ( ((s2+(s1%(PE_size/size[s]))*size[s])) < OS_counter[s][s1] && (size[s]-s2 > WS_width[s]*kernelsize[s])) //OS而且換成她輸出了
                    signal[s][s1][s2] = 1;
                else begin
                    if ( ((size[s]-s2)%kernelsize[s]) <= OS_counter[s][s1]-WS_width[s] && (size[s]-s2 <= WS_width[s]*kernelsize[s])) begin
                        signal[s][s1][s2] = 1;
                    end else 
                        signal[s][s1][s2] = 0;
                end
            end
        end
    end
end

integer a0;
integer b0;
integer c0;
integer d0[15:0][15:0];//用來看是不是數到三個數需要換行了 d0[PE part][inside]
integer r;
always_ff @(posedge clk or posedge rst) begin//調控第一個PE小區的Num
    if(rst)begin
        for ( r=0 ; r<16 ; r=r+1) begin
            c0<=0;
            for (a0=0 ; a0<16 ; a0=a0+1) begin
                if(a0 == 0)begin
                    OSISnum[r][0]=(0*(6*kernelsize[r]*kernelsize[r])/(16-kernelsize[r])*6)+(0*(6*kernelsize[r]*kernelsize[r])%(6-kernelsize[r]))+r*kernelsize[r]*kernelsize[r];
                    OSWSnum[r][0]=(0*(6*kernelsize[r]*kernelsize[r])/(16-kernelsize[r])*6)+(0*(6*kernelsize[r]*kernelsize[r])%(6-kernelsize[r]))+r*kernelsize[r]*kernelsize[r];
                end else begin
                    OSISnum[r][a0]=0;
                    OSWSnum[r][a0]=0;
                end
                d0[a0][r]<=0;
            end
        end
    end else begin
        for ( r=0 ; r<16 ; r=r+1) begin
            if(state0[r])begin
                for (b0=0 ; b0<16 ; b0=b0+1) begin
                    if(b0 == OS_counter[0][r] && b0!=0)begin//換到他輸入
                        if((6-(OSISnum[r][b0-1]+1))==(kernelsize[r]-1))begin
                            OSISnum[r][b0] <= OSISnum[r][b0-1]+OS_counter[0][r]-b0+c0+1;
                            OSWSnum[r][b0] <= OSISnum[r][b0-1]+OS_counter[0][r]-b0+c0+1;
                            c0=c0+kernelsize[r]-1;
                            d0[r][b0]<=d0[r][b0]+1;
                        end else begin
                            OSISnum[r][b0] <= OSISnum[r][b0-1]+OS_counter[0][r]-b0+c0+1;
                            OSWSnum[r][b0] <= OSWSnum[r][b0-1]+OS_counter[0][r]-b0+c0+1;
                            d0[r][b0]<=d0[r][b0]+1;
                        end
                    end
                    else if(b0 < OS_counter[0][0] || b0==0)begin
                        if((d0[r][b0])%(kernelsize[0])==0 && (d0[r][b0]) !=0 )begin//如果三個要換行
                            OSISnum[r][b0] <= OSISnum[r][b0]+6-kernelsize[r]+1;
                            OSWSnum[r][b0] <= OSWSnum[r][b0]+6-kernelsize[r]+1;
                            d0[r][b0]<=d0[r][b0]+1;
                        end else begin
                            OSISnum[r][b0] <= OSISnum[r][b0]+1;
                            OSWSnum[r][b0] <= OSWSnum[r][b0]+1;
                            d0[r][b0]<=d0[r][b0]+1;
                        end
                    end
                    else begin
                        OSISnum[r][b0] <= OSISnum[r][b0];
                        OSWSnum[r][b0] <= OSWSnum[r][b0];
                    end
                end
            end else begin
                c0<=0;
                for (a0=0 ; a0<16 ; a0=a0+1) begin
                    if(a0 == 0)begin
                        OSISnum[r][0]=(0*(6*kernelsize[r]*kernelsize[r])/(6-kernelsize[r])*16)+(0*(6*kernelsize[r]*kernelsize[r])%(6-kernelsize[r]))+r*kernelsize[r]*kernelsize[r];
                        OSWSnum[r][0]=(0*(6*kernelsize[r]*kernelsize[r])/(6-kernelsize[r])*16)+(0*(6*kernelsize[r]*kernelsize[r])%(6-kernelsize[r]))+r*kernelsize[r]*kernelsize[r];
                    end else begin
                        OSISnum[r][a0]=0;
                        OSWSnum[r][a0]=0;
                    end
                    d0[a0][r]<=0;
                end
            end
        end
    end
end

logic [41:0] output_right[8:0][8:0];
logic [41:0] output_left[8:0][8:0];
logic [41:0] output_down[8:0][8:0];
logic [41:0] output_up[8:0][8:0];
logic [41:0] result[8:0][8:0];

logic [41:0] WSIS[15:0];//WS sram input
logic [41:0] WSWS[15:0];//WS sram weight
logic [5:0]  WSISnum[15:0];//用來決定WS sram input的位置讀到哪的參數
logic [5:0]  WSWSnum[15:0];//用來決定WS sram weight的位置讀到哪的參數

integer total_num;//總共有多少可以算
integer WS_width[2],WS_length[2];
integer conputation_num[2];

always @(*) begin
    for (int kj=0 ; kj<=1 ; kj=kj+1) begin
        WS_width[kj] = (size[kj]-(kernelsize[kj]*kernelsize[kj]))/kernelsize[kj];
        WS_length[kj] = size[kj]/kernelsize[kj]; 
        conputation_num[kj] = WS_length[kj]*WS_width[kj]*2-(WS_width[kj]*WS_width[kj]);
    end
end

always @(state0 or state1 or rst) begin//用來看現在還剩下幾個 但只能算同時會完成所有運算的情況
    if(rst)begin
        total_num = input_totalnum;
    end else begin
        total_num = total_num-
        state0[0]+state0[1]+state0[2]+state0[3]+state0[4]+state0[5]+
        state0[6]+state0[7]+state0[8]+state0[9]+state0[10]+
        state0[11]+state0[12]+state0[13]+state0[14]+state0[15]+
        state1[0]+state1[1]+state1[2]+state1[3]+state1[4]+state1[5]+
        state1[6]+state1[7]+state1[8]+state1[9]+state1[10]+
        state1[11]+state1[12]+state1[13]+state1[14]+state1[15];
    end
end

integer wa0;
integer wb0;
integer wc0;
integer wd0[15:0][15:0];//用來看是不是數到三個數需要換行了 d0[PE part][inside]
integer wr;
always_ff @(posedge clk or posedge rst) begin//調控第一個PE小區的Num
    if(rst)begin
        for ( wr=0 ; wr<16 ; wr=wr+1) begin
            WSISnum[wr][0]=(0*kernelsize[wr]/(16-kernelsize[wr])*16)+(kernelsize[wr]%(16-kernelsize[wr]));
            WSWSnum[wr][0]=(0*kernelsize[wr]/(16-kernelsize[wr])*16)+(kernelsize[wr]%(16-kernelsize[wr]));
            wc0<=0;
            for (wa0=0 ; wa0<16 ; wa0=wa0+1) begin
                wd0[wa0][wr]<=0;
            end
        end

    end else begin
        for ( wr=0 ; wr<16 ; wr=wr+1) begin
            if(state[wr])begin
                for (wb0=0 ; wb0<16 ; wb0=wb0+1) begin
                    if(wb0 == OS_counter[0][wr] && wb0!=0)begin//換到他輸入
                        if((16-(WSISnum[wr][wb0-1]))%kernelsize[wr]==0)begin
                            WSISnum[wr][wb0] <= WSISnum[wr][wb0-1]+OS_counter[0][wr]-wb0+wc0;
                            WSWSnum[wr][wb0] <= WSISnum[wr][wb0-1]+OS_counter[0][wr]-wb0+wc0;
                            wc0=wc0+kernelsize[wr]-1;
                            wd0[wr][wb0]<=wd0[wr][wb0]+1;
                        end else begin
                            WSISnum[wr][wb0] <= WSISnum[wr][wb0-1]+OS_counter[0][wr]-wb0+wc0;
                            WSWSnum[wr][wb0] <= WSWSnum[wr][wb0-1]+OS_counter[0][wr]-wb0+wc0;
                            wd0[wr][wb0]<=wd0[wr][wb0]+1;
                        end
                    end
                    else if(wb0 < OS_counter[0][0] || wb0==0)begin
                        if((wd0[wr][wb0]+1)%3==0)begin//如果三個要換行
                            WSISnum[wr][wb0] <= WSISnum[wr][wb0]+16-kernelsize[wr]+1;
                            WSWSnum[wr][wb0] <= WSWSnum[wr][wb0]+16-kernelsize[wr]+1;
                            wd0[wr][wb0]<=wd0[wr][wb0]+1;
                        end else begin
                            WSISnum[wr][wb0] <= WSISnum[wr][wb0]+1;
                            WSWSnum[wr][wb0] <= WSWSnum[wr][wb0]+1;
                            wd0[wr][wb0]<=wd0[wr][wb0]+1;
                        end
                    end
                    else begin
                        WSISnum[wr][wb0] <= WSISnum[wr][wb0];
                        WSWSnum[wr][wb0] <= WSWSnum[wr][wb0];
                    end
                end
            end else begin
                for (wa0=0 ; wa0<16 ; wa0=wa0+1) begin
                    WSISnum[wr][wa0]=(0*kernelsize[wr]/(16-kernelsize[wr])*16)+(kernelsize[wr]%(16-kernelsize[wr]));
                    WSWSnum[wr][wa0]=(0*kernelsize[wr]/(16-kernelsize[wr])*16)+(kernelsize[wr]%(16-kernelsize[wr]));
                    wc0<=0;
                    wd0[wr][wa0]<=0;
                end
            end
        end
    end
end

integer j1,j;

always_ff @( posedge clk or posedge rst ) begin//OS_counter的運作 要分成不同Layer進行操作
    if(rst)begin
        for ( j=0 ; j<1 ; j=j+1) begin
            for ( j1=0 ; j1<16 ; j1=j1+1) begin
                OS_counter[0][j1] <= 0;
            end
        end
    end else begin
        for ( j=0 ; j<1 ; j=j+1) begin
            for ( j1=0 ; j1<16 ; j1=j1+1) begin
                if (state0[j1]) begin
                    OS_counter[0][j1] <= OS_counter[0][j1]+1;
                end else 
                    OS_counter[0][j1] <= 0;
            end
        end
    end
end

endmodule


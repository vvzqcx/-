`timescale 1ns / 1ns

module Controller1(
    input clk, input rst, input logic same, input logic[5:0]  kernelsize, input integer input_totalnum, input logic [15:0] total_inputmapnum,    input logic [18:0] OSIS[15:0][15:0], input logic [18:0] OSWS[15:0][15:0], input logic [18:0] WSIS[15:0][15:0], input logic [18:0] WSWS[15:0][15:0]);

logic [5:0] size,PE_size,round,layer_num,sram_size,partition;
integer total_num;
logic [9:0] WS_width,WS_length,computation_num;

always_comb begin 
    WS_width = (size-(kernelsize*kernelsize))/kernelsize;
    WS_length = size/kernelsize; 
end

always_comb begin
    if(PE_size/2 >= kernelsize*kernelsize)begin
        if(PE_size/4 >= kernelsize*kernelsize)begin
            size = PE_size/4;
        end else begin
            size = PE_size/2;
        end
    end else begin
        size = PE_size;
    end
end

assign PE_size = 10'd16;
assign sram_size = 10'd16;
assign layer_num = 4'd2;
assign partition = 4'd4;

logic [10:0]OS_counter0_0,OS_counter0_1,OS_counter0_2,OS_counter0_3,OS_counter0_4,OS_counter0_5,OS_counter0_6,OS_counter0_7,OS_counter0_8,OS_counter0_9,OS_counter0_10,OS_counter0_11,OS_counter0_12,OS_counter0_13,OS_counter0_14,OS_counter0_15;
logic state0_0,state0_1,state0_2,state0_3,state0_4,state0_5,state0_6,state0_7,state0_8,state0_9,state0_10,state0_11,state0_12,state0_13,state0_14,state0_15;
always_ff@( posedge clk or posedge rst ) begin  // 第0個 state
    if(rst)begin
        state0_0 <= 0;
    end else begin
        if(state0_0==0 && total_num >= (0%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_0 <= 1;
        end else if(state0_0==1)begin
            if(OS_counter0_0 >= 4*kernelsize*kernelsize)begin
                state0_0 <= 0;
            end   
            else begin
                state0_0 <= 1;
            end 
        end else begin
            state0_0 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第0個 OC
    if(rst)begin
        OS_counter0_0 <= 0;
    end else begin
        if(state0_0==0 && total_num - 0*layer_num*computation_num > 0)begin
                OS_counter0_0 <= 0;
        end else if(state0_0==1)begin
            if(OS_counter0_0 >= 4*kernelsize*kernelsize)begin
                OS_counter0_0 <= 0;
            end   
            else begin
                OS_counter0_0 <= OS_counter0_0 + 1;
            end 
        end else begin
            OS_counter0_0 <= OS_counter0_0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第1個 state
    if(rst)begin
        state0_1 <= 0;
    end else begin
        if(state0_1==0 && total_num >= (1%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_1 <= 1;
        end else if(state0_1==1)begin
            if(OS_counter0_1 >= 4*kernelsize*kernelsize)begin
                state0_1 <= 0;
            end   
            else begin
                state0_1 <= 1;
            end 
        end else begin
            state0_1 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第1個 OC
    if(rst)begin
        OS_counter0_1 <= 0;
    end else begin
        if(state0_1==0 && total_num - 1*layer_num*computation_num > 0)begin
                OS_counter0_1 <= 0;
        end else if(state0_1==1)begin
            if(OS_counter0_1 >= 4*kernelsize*kernelsize)begin
                OS_counter0_1 <= 0;
            end   
            else begin
                OS_counter0_1 <= OS_counter0_1 + 1;
            end 
        end else begin
            OS_counter0_1 <= OS_counter0_1;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第2個 state
    if(rst)begin
        state0_2 <= 0;
    end else begin
        if(state0_2==0 && total_num >= (2%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_2 <= 1;
        end else if(state0_2==1)begin
            if(OS_counter0_2 >= 4*kernelsize*kernelsize)begin
                state0_2 <= 0;
            end   
            else begin
                state0_2 <= 1;
            end 
        end else begin
            state0_2 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第2個 OC
    if(rst)begin
        OS_counter0_2 <= 0;
    end else begin
        if(state0_2==0 && total_num - 2*layer_num*computation_num > 0)begin
                OS_counter0_2 <= 0;
        end else if(state0_2==1)begin
            if(OS_counter0_2 >= 4*kernelsize*kernelsize)begin
                OS_counter0_2 <= 0;
            end   
            else begin
                OS_counter0_2 <= OS_counter0_2 + 1;
            end 
        end else begin
            OS_counter0_2 <= OS_counter0_2;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第3個 state
    if(rst)begin
        state0_3 <= 0;
    end else begin
        if(state0_3==0 && total_num >= (3%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_3 <= 1;
        end else if(state0_3==1)begin
            if(OS_counter0_3 >= 4*kernelsize*kernelsize)begin
                state0_3 <= 0;
            end   
            else begin
                state0_3 <= 1;
            end 
        end else begin
            state0_3 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第3個 OC
    if(rst)begin
        OS_counter0_3 <= 0;
    end else begin
        if(state0_3==0 && total_num - 3*layer_num*computation_num > 0)begin
                OS_counter0_3 <= 0;
        end else if(state0_3==1)begin
            if(OS_counter0_3 >= 4*kernelsize*kernelsize)begin
                OS_counter0_3 <= 0;
            end   
            else begin
                OS_counter0_3 <= OS_counter0_3 + 1;
            end 
        end else begin
            OS_counter0_3 <= OS_counter0_3;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第4個 state
    if(rst)begin
        state0_4 <= 0;
    end else begin
        if(state0_4==0 && total_num >= (4%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_4 <= 1;
        end else if(state0_4==1)begin
            if(OS_counter0_4 >= 4*kernelsize*kernelsize)begin
                state0_4 <= 0;
            end   
            else begin
                state0_4 <= 1;
            end 
        end else begin
            state0_4 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第4個 OC
    if(rst)begin
        OS_counter0_4 <= 0;
    end else begin
        if(state0_4==0 && total_num - 4*layer_num*computation_num > 0)begin
                OS_counter0_4 <= 0;
        end else if(state0_4==1)begin
            if(OS_counter0_4 >= 4*kernelsize*kernelsize)begin
                OS_counter0_4 <= 0;
            end   
            else begin
                OS_counter0_4 <= OS_counter0_4 + 1;
            end 
        end else begin
            OS_counter0_4 <= OS_counter0_4;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第5個 state
    if(rst)begin
        state0_5 <= 0;
    end else begin
        if(state0_5==0 && total_num >= (5%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_5 <= 1;
        end else if(state0_5==1)begin
            if(OS_counter0_5 >= 4*kernelsize*kernelsize)begin
                state0_5 <= 0;
            end   
            else begin
                state0_5 <= 1;
            end 
        end else begin
            state0_5 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第5個 OC
    if(rst)begin
        OS_counter0_5 <= 0;
    end else begin
        if(state0_5==0 && total_num - 5*layer_num*computation_num > 0)begin
                OS_counter0_5 <= 0;
        end else if(state0_5==1)begin
            if(OS_counter0_5 >= 4*kernelsize*kernelsize)begin
                OS_counter0_5 <= 0;
            end   
            else begin
                OS_counter0_5 <= OS_counter0_5 + 1;
            end 
        end else begin
            OS_counter0_5 <= OS_counter0_5;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第6個 state
    if(rst)begin
        state0_6 <= 0;
    end else begin
        if(state0_6==0 && total_num >= (6%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_6 <= 1;
        end else if(state0_6==1)begin
            if(OS_counter0_6 >= 4*kernelsize*kernelsize)begin
                state0_6 <= 0;
            end   
            else begin
                state0_6 <= 1;
            end 
        end else begin
            state0_6 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第6個 OC
    if(rst)begin
        OS_counter0_6 <= 0;
    end else begin
        if(state0_6==0 && total_num - 6*layer_num*computation_num > 0)begin
                OS_counter0_6 <= 0;
        end else if(state0_6==1)begin
            if(OS_counter0_6 >= 4*kernelsize*kernelsize)begin
                OS_counter0_6 <= 0;
            end   
            else begin
                OS_counter0_6 <= OS_counter0_6 + 1;
            end 
        end else begin
            OS_counter0_6 <= OS_counter0_6;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第7個 state
    if(rst)begin
        state0_7 <= 0;
    end else begin
        if(state0_7==0 && total_num >= (7%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_7 <= 1;
        end else if(state0_7==1)begin
            if(OS_counter0_7 >= 4*kernelsize*kernelsize)begin
                state0_7 <= 0;
            end   
            else begin
                state0_7 <= 1;
            end 
        end else begin
            state0_7 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第7個 OC
    if(rst)begin
        OS_counter0_7 <= 0;
    end else begin
        if(state0_7==0 && total_num - 7*layer_num*computation_num > 0)begin
                OS_counter0_7 <= 0;
        end else if(state0_7==1)begin
            if(OS_counter0_7 >= 4*kernelsize*kernelsize)begin
                OS_counter0_7 <= 0;
            end   
            else begin
                OS_counter0_7 <= OS_counter0_7 + 1;
            end 
        end else begin
            OS_counter0_7 <= OS_counter0_7;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第8個 state
    if(rst)begin
        state0_8 <= 0;
    end else begin
        if(state0_8==0 && total_num >= (8%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_8 <= 1;
        end else if(state0_8==1)begin
            if(OS_counter0_8 >= 4*kernelsize*kernelsize)begin
                state0_8 <= 0;
            end   
            else begin
                state0_8 <= 1;
            end 
        end else begin
            state0_8 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第8個 OC
    if(rst)begin
        OS_counter0_8 <= 0;
    end else begin
        if(state0_8==0 && total_num - 8*layer_num*computation_num > 0)begin
                OS_counter0_8 <= 0;
        end else if(state0_8==1)begin
            if(OS_counter0_8 >= 4*kernelsize*kernelsize)begin
                OS_counter0_8 <= 0;
            end   
            else begin
                OS_counter0_8 <= OS_counter0_8 + 1;
            end 
        end else begin
            OS_counter0_8 <= OS_counter0_8;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第9個 state
    if(rst)begin
        state0_9 <= 0;
    end else begin
        if(state0_9==0 && total_num >= (9%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_9 <= 1;
        end else if(state0_9==1)begin
            if(OS_counter0_9 >= 4*kernelsize*kernelsize)begin
                state0_9 <= 0;
            end   
            else begin
                state0_9 <= 1;
            end 
        end else begin
            state0_9 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第9個 OC
    if(rst)begin
        OS_counter0_9 <= 0;
    end else begin
        if(state0_9==0 && total_num - 9*layer_num*computation_num > 0)begin
                OS_counter0_9 <= 0;
        end else if(state0_9==1)begin
            if(OS_counter0_9 >= 4*kernelsize*kernelsize)begin
                OS_counter0_9 <= 0;
            end   
            else begin
                OS_counter0_9 <= OS_counter0_9 + 1;
            end 
        end else begin
            OS_counter0_9 <= OS_counter0_9;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第10個 state
    if(rst)begin
        state0_10 <= 0;
    end else begin
        if(state0_10==0 && total_num >= (10%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_10 <= 1;
        end else if(state0_10==1)begin
            if(OS_counter0_10 >= 4*kernelsize*kernelsize)begin
                state0_10 <= 0;
            end   
            else begin
                state0_10 <= 1;
            end 
        end else begin
            state0_10 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第10個 OC
    if(rst)begin
        OS_counter0_10 <= 0;
    end else begin
        if(state0_10==0 && total_num - 10*layer_num*computation_num > 0)begin
                OS_counter0_10 <= 0;
        end else if(state0_10==1)begin
            if(OS_counter0_10 >= 4*kernelsize*kernelsize)begin
                OS_counter0_10 <= 0;
            end   
            else begin
                OS_counter0_10 <= OS_counter0_10 + 1;
            end 
        end else begin
            OS_counter0_10 <= OS_counter0_10;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第11個 state
    if(rst)begin
        state0_11 <= 0;
    end else begin
        if(state0_11==0 && total_num >= (11%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_11 <= 1;
        end else if(state0_11==1)begin
            if(OS_counter0_11 >= 4*kernelsize*kernelsize)begin
                state0_11 <= 0;
            end   
            else begin
                state0_11 <= 1;
            end 
        end else begin
            state0_11 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第11個 OC
    if(rst)begin
        OS_counter0_11 <= 0;
    end else begin
        if(state0_11==0 && total_num - 11*layer_num*computation_num > 0)begin
                OS_counter0_11 <= 0;
        end else if(state0_11==1)begin
            if(OS_counter0_11 >= 4*kernelsize*kernelsize)begin
                OS_counter0_11 <= 0;
            end   
            else begin
                OS_counter0_11 <= OS_counter0_11 + 1;
            end 
        end else begin
            OS_counter0_11 <= OS_counter0_11;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第12個 state
    if(rst)begin
        state0_12 <= 0;
    end else begin
        if(state0_12==0 && total_num >= (12%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_12 <= 1;
        end else if(state0_12==1)begin
            if(OS_counter0_12 >= 4*kernelsize*kernelsize)begin
                state0_12 <= 0;
            end   
            else begin
                state0_12 <= 1;
            end 
        end else begin
            state0_12 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第12個 OC
    if(rst)begin
        OS_counter0_12 <= 0;
    end else begin
        if(state0_12==0 && total_num - 12*layer_num*computation_num > 0)begin
                OS_counter0_12 <= 0;
        end else if(state0_12==1)begin
            if(OS_counter0_12 >= 4*kernelsize*kernelsize)begin
                OS_counter0_12 <= 0;
            end   
            else begin
                OS_counter0_12 <= OS_counter0_12 + 1;
            end 
        end else begin
            OS_counter0_12 <= OS_counter0_12;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第13個 state
    if(rst)begin
        state0_13 <= 0;
    end else begin
        if(state0_13==0 && total_num >= (13%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_13 <= 1;
        end else if(state0_13==1)begin
            if(OS_counter0_13 >= 4*kernelsize*kernelsize)begin
                state0_13 <= 0;
            end   
            else begin
                state0_13 <= 1;
            end 
        end else begin
            state0_13 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第13個 OC
    if(rst)begin
        OS_counter0_13 <= 0;
    end else begin
        if(state0_13==0 && total_num - 13*layer_num*computation_num > 0)begin
                OS_counter0_13 <= 0;
        end else if(state0_13==1)begin
            if(OS_counter0_13 >= 4*kernelsize*kernelsize)begin
                OS_counter0_13 <= 0;
            end   
            else begin
                OS_counter0_13 <= OS_counter0_13 + 1;
            end 
        end else begin
            OS_counter0_13 <= OS_counter0_13;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第14個 state
    if(rst)begin
        state0_14 <= 0;
    end else begin
        if(state0_14==0 && total_num >= (14%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_14 <= 1;
        end else if(state0_14==1)begin
            if(OS_counter0_14 >= 4*kernelsize*kernelsize)begin
                state0_14 <= 0;
            end   
            else begin
                state0_14 <= 1;
            end 
        end else begin
            state0_14 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第14個 OC
    if(rst)begin
        OS_counter0_14 <= 0;
    end else begin
        if(state0_14==0 && total_num - 14*layer_num*computation_num > 0)begin
                OS_counter0_14 <= 0;
        end else if(state0_14==1)begin
            if(OS_counter0_14 >= 4*kernelsize*kernelsize)begin
                OS_counter0_14 <= 0;
            end   
            else begin
                OS_counter0_14 <= OS_counter0_14 + 1;
            end 
        end else begin
            OS_counter0_14 <= OS_counter0_14;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin  // 第15個 state
    if(rst)begin
        state0_15 <= 0;
    end else begin
        if(state0_15==0 && total_num >= (15%((PE_size/size)*(PE_size/size))+(round*(PE_size/size)*(PE_size/size))*computation_num))begin
                state0_15 <= 1;
        end else if(state0_15==1)begin
            if(OS_counter0_15 >= 4*kernelsize*kernelsize)begin
                state0_15 <= 0;
            end   
            else begin
                state0_15 <= 1;
            end 
        end else begin
            state0_15 <= 0;
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // 第15個 OC
    if(rst)begin
        OS_counter0_15 <= 0;
    end else begin
        if(state0_15==0 && total_num - 15*layer_num*computation_num > 0)begin
                OS_counter0_15 <= 0;
        end else if(state0_15==1)begin
            if(OS_counter0_15 >= 4*kernelsize*kernelsize)begin
                OS_counter0_15 <= 0;
            end   
            else begin
                OS_counter0_15 <= OS_counter0_15 + 1;
            end 
        end else begin
            OS_counter0_15 <= OS_counter0_15;
        end
    end
end

always@( state0_0 or state0_1 or state0_2 or state0_3 or state0_4 or state0_5 or state0_6 or state0_7 or state0_8 or state0_9 or state0_10 or state0_11 or state0_12 or state0_13 or state0_14 or state0_15 or  rst) begin
    if(rst) round = 0;
    else begin
        if(!state0_0)  round = round+1;
        else round = round;
    end
end
always@( state0_0 or state0_1 or state0_2 or state0_3 or state0_4 or state0_5 or state0_6 or state0_7 or state0_8 or state0_9 or state0_10 or state0_11 or state0_12 or state0_13 or state0_14 or state0_15 or rst or input_totalnum or PE_size) begin
    if(rst) total_num = input_totalnum;
    else begin
        if(PE_size/size == 4)begin
            total_num = total_num-(
                state0_0+state0_1+state0_2+state0_3+state0_4
                +state0_5+state0_6+state0_7+state0_8
                +state0_9+state0_10+state0_11+state0_12
                +state0_13+state0_14+state0_15)*computation_num;
        end else if(PE_size/size == 2)begin
            total_num = total_num-(
                state0_0+state0_2+state0_8+state0_10)*computation_num;
        end else if(PE_size/size == 1)begin
            total_num = total_num-(
                state0_0)*computation_num;
        end else total_num = 0;
    end
end

always_comb begin 
    case(WS_length)
    2:begin
        case(WS_width)
        1:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-1*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        default : computation_num = 0;
        endcase
    end
    3:begin
        case(WS_width)
        1:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        2:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-1*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        default : computation_num = 0;
        endcase
    end
    4:begin
        case(WS_width)
        1:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-2*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        2:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        3:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-1*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        default : computation_num = 0;
        endcase
    end
    5:begin
        case(WS_width)
        1:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-2*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-3*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        2:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-2*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        3:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        4:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-1*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        default : computation_num = 0;
        endcase
    end
    6:begin
        case(WS_width)
        1:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-2*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-3*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-4*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-6*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        2:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-2*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-3*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-6*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        3:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-2*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-6*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        4:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize+1-1*kernelsize)/(2*kernelsize)+
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-6*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        5:begin
            computation_num = (kernelsize*kernelsize)+WS_width*(
            2*((4*kernelsize*kernelsize)-(WS_width*kernelsize)-1*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-2*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-3*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-4*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-5*kernelsize-3*kernelsize+1)/(2*kernelsize)
            +((4*kernelsize*kernelsize)-(WS_width*kernelsize)-6*kernelsize-3*kernelsize+1)/(2*kernelsize))+(WS_width*WS_length*2-WS_width*WS_width);
        end
        default : computation_num = 0;
        endcase
    end
    default : computation_num = 0;
    endcase
end

logic [3:0]signal0_0,signal0_1,signal0_2,signal0_3,signal0_4,signal0_5,signal0_6,signal0_7,signal0_8,signal0_9,signal0_10,signal0_11,signal0_12,signal0_13,signal0_14,signal0_15;
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第0個signal
    if(rst)begin
        signal0_0[0] <= 0;        signal0_0[1] <= 0;        signal0_0[2] <= 0;        signal0_0[3] <= 0;
    end else begin
        if(state0_0)begin
            if(PE_size/size==4)begin
                if(OS_counter0_0 < (PE_size/partition)-1+(0*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_0 > WS_width*kernelsize && PE_size - (OS_counter0_0-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_0 < PE_size)begin//WS
                        signal0_0[PE_size - (OS_counter0_0-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_0 < kernelsize*kernelsize) signal0_0[OS_counter0_0] <= 1;                    else signal0_0[OS_counter0_0] <= 0;                end else begin//OS
                    if(OS_counter0_0 > WS_width*kernelsize && PE_size - (OS_counter0_0-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_0 < PE_size)begin//WS
                        if(OS_counter0_0 < kernelsize*kernelsize+4)begin                            signal0_0[OS_counter0_0] <= 1;                            signal0_0[OS_counter0_0-4] <= 0;                        end else signal0_0[OS_counter0_0] <= 0;                        signal0_0[PE_size - (OS_counter0_0-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_0 < kernelsize*kernelsize+4)begin                            signal0_0[OS_counter0_0] <= 1;                            signal0_0[OS_counter0_0-4] <= 0;                        end else signal0_0[OS_counter0_0] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_0 < (PE_size/partition)-1+(0*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_0 > WS_width*kernelsize && PE_size - (OS_counter0_0-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_0 < PE_size)begin//WS
                        signal0_0[PE_size - (OS_counter0_0-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_0 < kernelsize*kernelsize) signal0_0[OS_counter0_0] <= 1;                    else signal0_0[OS_counter0_0] <= 0;                end else begin//OS
                    if(OS_counter0_0 > WS_width*kernelsize && PE_size - (OS_counter0_0-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_0 < PE_size)begin//WS
                        if(OS_counter0_0 < kernelsize*kernelsize+4)begin                            signal0_0[OS_counter0_0] <= 1;                            signal0_0[OS_counter0_0-4] <= 0;                        end else signal0_0[OS_counter0_0] <= 0;                        signal0_0[PE_size - (OS_counter0_0-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_0 < kernelsize*kernelsize+4)begin                            signal0_0[OS_counter0_0] <= 1;                            signal0_0[OS_counter0_0-4] <= 0;                        end else signal0_0[OS_counter0_0] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_0 < (PE_size/partition)-1+(0*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_0 > WS_width*kernelsize && PE_size - (OS_counter0_0-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_0 < PE_size)begin//WS
                        signal0_0[PE_size - (OS_counter0_0-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_0 < kernelsize*kernelsize) signal0_0[OS_counter0_0] <= 1;                    else signal0_0[OS_counter0_0] <= 0;                end else begin//OS
                    if(OS_counter0_0 > WS_width*kernelsize && PE_size - (OS_counter0_0-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_0 < PE_size)begin//WS
                        if(OS_counter0_0 < kernelsize*kernelsize+4)begin                            signal0_0[OS_counter0_0] <= 1;                            signal0_0[OS_counter0_0-4] <= 0;                        end else signal0_0[OS_counter0_0] <= 0;                        signal0_0[PE_size - (OS_counter0_0-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_0 < kernelsize*kernelsize+4)begin                            signal0_0[OS_counter0_0] <= 1;                            signal0_0[OS_counter0_0-4] <= 0;                        end else signal0_0[OS_counter0_0] <= 0;                end            end else begin
                signal0_0[0] <= 0;                signal0_0[1] <= 0;                signal0_0[2] <= 0;                signal0_0[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第1個signal
    if(rst)begin
        signal0_1[0] <= 0;        signal0_1[1] <= 0;        signal0_1[2] <= 0;        signal0_1[3] <= 0;
    end else begin
        if(state0_1)begin
            if(PE_size/size==4)begin
                if(OS_counter0_1 < (PE_size/partition)-1+(1*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_1 > WS_width*kernelsize && PE_size - (OS_counter0_1-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_1 < PE_size)begin//WS
                        signal0_1[PE_size - (OS_counter0_1-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_1 < kernelsize*kernelsize) signal0_1[OS_counter0_1] <= 1;                    else signal0_1[OS_counter0_1] <= 0;                end else begin//OS
                    if(OS_counter0_1 > WS_width*kernelsize && PE_size - (OS_counter0_1-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_1 < PE_size)begin//WS
                        if(OS_counter0_1 < kernelsize*kernelsize+4)begin                            signal0_1[OS_counter0_1] <= 1;                            signal0_1[OS_counter0_1-4] <= 0;                        end else signal0_1[OS_counter0_1] <= 0;                        signal0_1[PE_size - (OS_counter0_1-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_1 < kernelsize*kernelsize+4)begin                            signal0_1[OS_counter0_1] <= 1;                            signal0_1[OS_counter0_1-4] <= 0;                        end else signal0_1[OS_counter0_1] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_1 < (PE_size/partition)-1+(1*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_1 > WS_width*kernelsize && PE_size - (OS_counter0_1-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_1 < PE_size)begin//WS
                        signal0_1[PE_size - (OS_counter0_1-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_1 < kernelsize*kernelsize) signal0_1[OS_counter0_1] <= 1;                    else signal0_1[OS_counter0_1] <= 0;                end else begin//OS
                    if(OS_counter0_1 > WS_width*kernelsize && PE_size - (OS_counter0_1-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_1 < PE_size)begin//WS
                        if(OS_counter0_1 < kernelsize*kernelsize+4)begin                            signal0_1[OS_counter0_1] <= 1;                            signal0_1[OS_counter0_1-4] <= 0;                        end else signal0_1[OS_counter0_1] <= 0;                        signal0_1[PE_size - (OS_counter0_1-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_1 < kernelsize*kernelsize+4)begin                            signal0_1[OS_counter0_1] <= 1;                            signal0_1[OS_counter0_1-4] <= 0;                        end else signal0_1[OS_counter0_1] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_1 < (PE_size/partition)-1+(1*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_1 > WS_width*kernelsize && PE_size - (OS_counter0_1-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_1 < PE_size)begin//WS
                        signal0_1[PE_size - (OS_counter0_1-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_1 < kernelsize*kernelsize) signal0_1[OS_counter0_1] <= 1;                    else signal0_1[OS_counter0_1] <= 0;                end else begin//OS
                    if(OS_counter0_1 > WS_width*kernelsize && PE_size - (OS_counter0_1-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_1 < PE_size)begin//WS
                        if(OS_counter0_1 < kernelsize*kernelsize+4)begin                            signal0_1[OS_counter0_1] <= 1;                            signal0_1[OS_counter0_1-4] <= 0;                        end else signal0_1[OS_counter0_1] <= 0;                        signal0_1[PE_size - (OS_counter0_1-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_1 < kernelsize*kernelsize+4)begin                            signal0_1[OS_counter0_1] <= 1;                            signal0_1[OS_counter0_1-4] <= 0;                        end else signal0_1[OS_counter0_1] <= 0;                end            end else begin
                signal0_1[0] <= 0;                signal0_1[1] <= 0;                signal0_1[2] <= 0;                signal0_1[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第2個signal
    if(rst)begin
        signal0_2[0] <= 0;        signal0_2[1] <= 0;        signal0_2[2] <= 0;        signal0_2[3] <= 0;
    end else begin
        if(state0_2)begin
            if(PE_size/size==4)begin
                if(OS_counter0_2 < (PE_size/partition)-1+(2*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_2 > WS_width*kernelsize && PE_size - (OS_counter0_2-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_2 < PE_size)begin//WS
                        signal0_2[PE_size - (OS_counter0_2-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_2 < kernelsize*kernelsize) signal0_2[OS_counter0_2] <= 1;                    else signal0_2[OS_counter0_2] <= 0;                end else begin//OS
                    if(OS_counter0_2 > WS_width*kernelsize && PE_size - (OS_counter0_2-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_2 < PE_size)begin//WS
                        if(OS_counter0_2 < kernelsize*kernelsize+4)begin                            signal0_2[OS_counter0_2] <= 1;                            signal0_2[OS_counter0_2-4] <= 0;                        end else signal0_2[OS_counter0_2] <= 0;                        signal0_2[PE_size - (OS_counter0_2-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_2 < kernelsize*kernelsize+4)begin                            signal0_2[OS_counter0_2] <= 1;                            signal0_2[OS_counter0_2-4] <= 0;                        end else signal0_2[OS_counter0_2] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_2 < (PE_size/partition)-1+(2*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_2 > WS_width*kernelsize && PE_size - (OS_counter0_2-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_2 < PE_size)begin//WS
                        signal0_2[PE_size - (OS_counter0_2-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_2 < kernelsize*kernelsize) signal0_2[OS_counter0_2] <= 1;                    else signal0_2[OS_counter0_2] <= 0;                end else begin//OS
                    if(OS_counter0_2 > WS_width*kernelsize && PE_size - (OS_counter0_2-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_2 < PE_size)begin//WS
                        if(OS_counter0_2 < kernelsize*kernelsize+4)begin                            signal0_2[OS_counter0_2] <= 1;                            signal0_2[OS_counter0_2-4] <= 0;                        end else signal0_2[OS_counter0_2] <= 0;                        signal0_2[PE_size - (OS_counter0_2-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_2 < kernelsize*kernelsize+4)begin                            signal0_2[OS_counter0_2] <= 1;                            signal0_2[OS_counter0_2-4] <= 0;                        end else signal0_2[OS_counter0_2] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_2 < (PE_size/partition)-1+(2*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_2 > WS_width*kernelsize && PE_size - (OS_counter0_2-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_2 < PE_size)begin//WS
                        signal0_2[PE_size - (OS_counter0_2-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_2 < kernelsize*kernelsize) signal0_2[OS_counter0_2] <= 1;                    else signal0_2[OS_counter0_2] <= 0;                end else begin//OS
                    if(OS_counter0_2 > WS_width*kernelsize && PE_size - (OS_counter0_2-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_2 < PE_size)begin//WS
                        if(OS_counter0_2 < kernelsize*kernelsize+4)begin                            signal0_2[OS_counter0_2] <= 1;                            signal0_2[OS_counter0_2-4] <= 0;                        end else signal0_2[OS_counter0_2] <= 0;                        signal0_2[PE_size - (OS_counter0_2-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_2 < kernelsize*kernelsize+4)begin                            signal0_2[OS_counter0_2] <= 1;                            signal0_2[OS_counter0_2-4] <= 0;                        end else signal0_2[OS_counter0_2] <= 0;                end            end else begin
                signal0_2[0] <= 0;                signal0_2[1] <= 0;                signal0_2[2] <= 0;                signal0_2[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第3個signal
    if(rst)begin
        signal0_3[0] <= 0;        signal0_3[1] <= 0;        signal0_3[2] <= 0;        signal0_3[3] <= 0;
    end else begin
        if(state0_3)begin
            if(PE_size/size==4)begin
                if(OS_counter0_3 < (PE_size/partition)-1+(3*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_3 > WS_width*kernelsize && PE_size - (OS_counter0_3-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_3 < PE_size)begin//WS
                        signal0_3[PE_size - (OS_counter0_3-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_3 < kernelsize*kernelsize) signal0_3[OS_counter0_3] <= 1;                    else signal0_3[OS_counter0_3] <= 0;                end else begin//OS
                    if(OS_counter0_3 > WS_width*kernelsize && PE_size - (OS_counter0_3-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_3 < PE_size)begin//WS
                        if(OS_counter0_3 < kernelsize*kernelsize+4)begin                            signal0_3[OS_counter0_3] <= 1;                            signal0_3[OS_counter0_3-4] <= 0;                        end else signal0_3[OS_counter0_3] <= 0;                        signal0_3[PE_size - (OS_counter0_3-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_3 < kernelsize*kernelsize+4)begin                            signal0_3[OS_counter0_3] <= 1;                            signal0_3[OS_counter0_3-4] <= 0;                        end else signal0_3[OS_counter0_3] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_3 < (PE_size/partition)-1+(3*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_3 > WS_width*kernelsize && PE_size - (OS_counter0_3-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_3 < PE_size)begin//WS
                        signal0_3[PE_size - (OS_counter0_3-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_3 < kernelsize*kernelsize) signal0_3[OS_counter0_3] <= 1;                    else signal0_3[OS_counter0_3] <= 0;                end else begin//OS
                    if(OS_counter0_3 > WS_width*kernelsize && PE_size - (OS_counter0_3-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_3 < PE_size)begin//WS
                        if(OS_counter0_3 < kernelsize*kernelsize+4)begin                            signal0_3[OS_counter0_3] <= 1;                            signal0_3[OS_counter0_3-4] <= 0;                        end else signal0_3[OS_counter0_3] <= 0;                        signal0_3[PE_size - (OS_counter0_3-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_3 < kernelsize*kernelsize+4)begin                            signal0_3[OS_counter0_3] <= 1;                            signal0_3[OS_counter0_3-4] <= 0;                        end else signal0_3[OS_counter0_3] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_3 < (PE_size/partition)-1+(3*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_3 > WS_width*kernelsize && PE_size - (OS_counter0_3-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_3 < PE_size)begin//WS
                        signal0_3[PE_size - (OS_counter0_3-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_3 < kernelsize*kernelsize) signal0_3[OS_counter0_3] <= 1;                    else signal0_3[OS_counter0_3] <= 0;                end else begin//OS
                    if(OS_counter0_3 > WS_width*kernelsize && PE_size - (OS_counter0_3-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_3 < PE_size)begin//WS
                        if(OS_counter0_3 < kernelsize*kernelsize+4)begin                            signal0_3[OS_counter0_3] <= 1;                            signal0_3[OS_counter0_3-4] <= 0;                        end else signal0_3[OS_counter0_3] <= 0;                        signal0_3[PE_size - (OS_counter0_3-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_3 < kernelsize*kernelsize+4)begin                            signal0_3[OS_counter0_3] <= 1;                            signal0_3[OS_counter0_3-4] <= 0;                        end else signal0_3[OS_counter0_3] <= 0;                end            end else begin
                signal0_3[0] <= 0;                signal0_3[1] <= 0;                signal0_3[2] <= 0;                signal0_3[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第4個signal
    if(rst)begin
        signal0_4[0] <= 0;        signal0_4[1] <= 0;        signal0_4[2] <= 0;        signal0_4[3] <= 0;
    end else begin
        if(state0_4)begin
            if(PE_size/size==4)begin
                if(OS_counter0_4 < (PE_size/partition)-1+(4*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_4 > WS_width*kernelsize && PE_size - (OS_counter0_4-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_4 < PE_size)begin//WS
                        signal0_4[PE_size - (OS_counter0_4-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_4 < kernelsize*kernelsize) signal0_4[OS_counter0_4] <= 1;                    else signal0_4[OS_counter0_4] <= 0;                end else begin//OS
                    if(OS_counter0_4 > WS_width*kernelsize && PE_size - (OS_counter0_4-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_4 < PE_size)begin//WS
                        if(OS_counter0_4 < kernelsize*kernelsize+4)begin                            signal0_4[OS_counter0_4] <= 1;                            signal0_4[OS_counter0_4-4] <= 0;                        end else signal0_4[OS_counter0_4] <= 0;                        signal0_4[PE_size - (OS_counter0_4-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_4 < kernelsize*kernelsize+4)begin                            signal0_4[OS_counter0_4] <= 1;                            signal0_4[OS_counter0_4-4] <= 0;                        end else signal0_4[OS_counter0_4] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_4 < (PE_size/partition)-1+(4*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_4 > WS_width*kernelsize && PE_size - (OS_counter0_4-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_4 < PE_size)begin//WS
                        signal0_4[PE_size - (OS_counter0_4-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_4 < kernelsize*kernelsize) signal0_4[OS_counter0_4] <= 1;                    else signal0_4[OS_counter0_4] <= 0;                end else begin//OS
                    if(OS_counter0_4 > WS_width*kernelsize && PE_size - (OS_counter0_4-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_4 < PE_size)begin//WS
                        if(OS_counter0_4 < kernelsize*kernelsize+4)begin                            signal0_4[OS_counter0_4] <= 1;                            signal0_4[OS_counter0_4-4] <= 0;                        end else signal0_4[OS_counter0_4] <= 0;                        signal0_4[PE_size - (OS_counter0_4-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_4 < kernelsize*kernelsize+4)begin                            signal0_4[OS_counter0_4] <= 1;                            signal0_4[OS_counter0_4-4] <= 0;                        end else signal0_4[OS_counter0_4] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_4 < (PE_size/partition)-1+(4*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_4 > WS_width*kernelsize && PE_size - (OS_counter0_4-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_4 < PE_size)begin//WS
                        signal0_4[PE_size - (OS_counter0_4-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_4 < kernelsize*kernelsize) signal0_4[OS_counter0_4] <= 1;                    else signal0_4[OS_counter0_4] <= 0;                end else begin//OS
                    if(OS_counter0_4 > WS_width*kernelsize && PE_size - (OS_counter0_4-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_4 < PE_size)begin//WS
                        if(OS_counter0_4 < kernelsize*kernelsize+4)begin                            signal0_4[OS_counter0_4] <= 1;                            signal0_4[OS_counter0_4-4] <= 0;                        end else signal0_4[OS_counter0_4] <= 0;                        signal0_4[PE_size - (OS_counter0_4-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_4 < kernelsize*kernelsize+4)begin                            signal0_4[OS_counter0_4] <= 1;                            signal0_4[OS_counter0_4-4] <= 0;                        end else signal0_4[OS_counter0_4] <= 0;                end            end else begin
                signal0_4[0] <= 0;                signal0_4[1] <= 0;                signal0_4[2] <= 0;                signal0_4[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第5個signal
    if(rst)begin
        signal0_5[0] <= 0;        signal0_5[1] <= 0;        signal0_5[2] <= 0;        signal0_5[3] <= 0;
    end else begin
        if(state0_5)begin
            if(PE_size/size==4)begin
                if(OS_counter0_5 < (PE_size/partition)-1+(5*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_5 > WS_width*kernelsize && PE_size - (OS_counter0_5-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_5 < PE_size)begin//WS
                        signal0_5[PE_size - (OS_counter0_5-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_5 < kernelsize*kernelsize) signal0_5[OS_counter0_5] <= 1;                    else signal0_5[OS_counter0_5] <= 0;                end else begin//OS
                    if(OS_counter0_5 > WS_width*kernelsize && PE_size - (OS_counter0_5-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_5 < PE_size)begin//WS
                        if(OS_counter0_5 < kernelsize*kernelsize+4)begin                            signal0_5[OS_counter0_5] <= 1;                            signal0_5[OS_counter0_5-4] <= 0;                        end else signal0_5[OS_counter0_5] <= 0;                        signal0_5[PE_size - (OS_counter0_5-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_5 < kernelsize*kernelsize+4)begin                            signal0_5[OS_counter0_5] <= 1;                            signal0_5[OS_counter0_5-4] <= 0;                        end else signal0_5[OS_counter0_5] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_5 < (PE_size/partition)-1+(5*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_5 > WS_width*kernelsize && PE_size - (OS_counter0_5-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_5 < PE_size)begin//WS
                        signal0_5[PE_size - (OS_counter0_5-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_5 < kernelsize*kernelsize) signal0_5[OS_counter0_5] <= 1;                    else signal0_5[OS_counter0_5] <= 0;                end else begin//OS
                    if(OS_counter0_5 > WS_width*kernelsize && PE_size - (OS_counter0_5-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_5 < PE_size)begin//WS
                        if(OS_counter0_5 < kernelsize*kernelsize+4)begin                            signal0_5[OS_counter0_5] <= 1;                            signal0_5[OS_counter0_5-4] <= 0;                        end else signal0_5[OS_counter0_5] <= 0;                        signal0_5[PE_size - (OS_counter0_5-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_5 < kernelsize*kernelsize+4)begin                            signal0_5[OS_counter0_5] <= 1;                            signal0_5[OS_counter0_5-4] <= 0;                        end else signal0_5[OS_counter0_5] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_5 < (PE_size/partition)-1+(5*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_5 > WS_width*kernelsize && PE_size - (OS_counter0_5-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_5 < PE_size)begin//WS
                        signal0_5[PE_size - (OS_counter0_5-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_5 < kernelsize*kernelsize) signal0_5[OS_counter0_5] <= 1;                    else signal0_5[OS_counter0_5] <= 0;                end else begin//OS
                    if(OS_counter0_5 > WS_width*kernelsize && PE_size - (OS_counter0_5-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_5 < PE_size)begin//WS
                        if(OS_counter0_5 < kernelsize*kernelsize+4)begin                            signal0_5[OS_counter0_5] <= 1;                            signal0_5[OS_counter0_5-4] <= 0;                        end else signal0_5[OS_counter0_5] <= 0;                        signal0_5[PE_size - (OS_counter0_5-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_5 < kernelsize*kernelsize+4)begin                            signal0_5[OS_counter0_5] <= 1;                            signal0_5[OS_counter0_5-4] <= 0;                        end else signal0_5[OS_counter0_5] <= 0;                end            end else begin
                signal0_5[0] <= 0;                signal0_5[1] <= 0;                signal0_5[2] <= 0;                signal0_5[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第6個signal
    if(rst)begin
        signal0_6[0] <= 0;        signal0_6[1] <= 0;        signal0_6[2] <= 0;        signal0_6[3] <= 0;
    end else begin
        if(state0_6)begin
            if(PE_size/size==4)begin
                if(OS_counter0_6 < (PE_size/partition)-1+(6*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_6 > WS_width*kernelsize && PE_size - (OS_counter0_6-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_6 < PE_size)begin//WS
                        signal0_6[PE_size - (OS_counter0_6-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_6 < kernelsize*kernelsize) signal0_6[OS_counter0_6] <= 1;                    else signal0_6[OS_counter0_6] <= 0;                end else begin//OS
                    if(OS_counter0_6 > WS_width*kernelsize && PE_size - (OS_counter0_6-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_6 < PE_size)begin//WS
                        if(OS_counter0_6 < kernelsize*kernelsize+4)begin                            signal0_6[OS_counter0_6] <= 1;                            signal0_6[OS_counter0_6-4] <= 0;                        end else signal0_6[OS_counter0_6] <= 0;                        signal0_6[PE_size - (OS_counter0_6-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_6 < kernelsize*kernelsize+4)begin                            signal0_6[OS_counter0_6] <= 1;                            signal0_6[OS_counter0_6-4] <= 0;                        end else signal0_6[OS_counter0_6] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_6 < (PE_size/partition)-1+(6*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_6 > WS_width*kernelsize && PE_size - (OS_counter0_6-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_6 < PE_size)begin//WS
                        signal0_6[PE_size - (OS_counter0_6-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_6 < kernelsize*kernelsize) signal0_6[OS_counter0_6] <= 1;                    else signal0_6[OS_counter0_6] <= 0;                end else begin//OS
                    if(OS_counter0_6 > WS_width*kernelsize && PE_size - (OS_counter0_6-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_6 < PE_size)begin//WS
                        if(OS_counter0_6 < kernelsize*kernelsize+4)begin                            signal0_6[OS_counter0_6] <= 1;                            signal0_6[OS_counter0_6-4] <= 0;                        end else signal0_6[OS_counter0_6] <= 0;                        signal0_6[PE_size - (OS_counter0_6-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_6 < kernelsize*kernelsize+4)begin                            signal0_6[OS_counter0_6] <= 1;                            signal0_6[OS_counter0_6-4] <= 0;                        end else signal0_6[OS_counter0_6] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_6 < (PE_size/partition)-1+(6*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_6 > WS_width*kernelsize && PE_size - (OS_counter0_6-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_6 < PE_size)begin//WS
                        signal0_6[PE_size - (OS_counter0_6-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_6 < kernelsize*kernelsize) signal0_6[OS_counter0_6] <= 1;                    else signal0_6[OS_counter0_6] <= 0;                end else begin//OS
                    if(OS_counter0_6 > WS_width*kernelsize && PE_size - (OS_counter0_6-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_6 < PE_size)begin//WS
                        if(OS_counter0_6 < kernelsize*kernelsize+4)begin                            signal0_6[OS_counter0_6] <= 1;                            signal0_6[OS_counter0_6-4] <= 0;                        end else signal0_6[OS_counter0_6] <= 0;                        signal0_6[PE_size - (OS_counter0_6-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_6 < kernelsize*kernelsize+4)begin                            signal0_6[OS_counter0_6] <= 1;                            signal0_6[OS_counter0_6-4] <= 0;                        end else signal0_6[OS_counter0_6] <= 0;                end            end else begin
                signal0_6[0] <= 0;                signal0_6[1] <= 0;                signal0_6[2] <= 0;                signal0_6[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第7個signal
    if(rst)begin
        signal0_7[0] <= 0;        signal0_7[1] <= 0;        signal0_7[2] <= 0;        signal0_7[3] <= 0;
    end else begin
        if(state0_7)begin
            if(PE_size/size==4)begin
                if(OS_counter0_7 < (PE_size/partition)-1+(7*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_7 > WS_width*kernelsize && PE_size - (OS_counter0_7-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_7 < PE_size)begin//WS
                        signal0_7[PE_size - (OS_counter0_7-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_7 < kernelsize*kernelsize) signal0_7[OS_counter0_7] <= 1;                    else signal0_7[OS_counter0_7] <= 0;                end else begin//OS
                    if(OS_counter0_7 > WS_width*kernelsize && PE_size - (OS_counter0_7-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_7 < PE_size)begin//WS
                        if(OS_counter0_7 < kernelsize*kernelsize+4)begin                            signal0_7[OS_counter0_7] <= 1;                            signal0_7[OS_counter0_7-4] <= 0;                        end else signal0_7[OS_counter0_7] <= 0;                        signal0_7[PE_size - (OS_counter0_7-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_7 < kernelsize*kernelsize+4)begin                            signal0_7[OS_counter0_7] <= 1;                            signal0_7[OS_counter0_7-4] <= 0;                        end else signal0_7[OS_counter0_7] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_7 < (PE_size/partition)-1+(7*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_7 > WS_width*kernelsize && PE_size - (OS_counter0_7-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_7 < PE_size)begin//WS
                        signal0_7[PE_size - (OS_counter0_7-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_7 < kernelsize*kernelsize) signal0_7[OS_counter0_7] <= 1;                    else signal0_7[OS_counter0_7] <= 0;                end else begin//OS
                    if(OS_counter0_7 > WS_width*kernelsize && PE_size - (OS_counter0_7-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_7 < PE_size)begin//WS
                        if(OS_counter0_7 < kernelsize*kernelsize+4)begin                            signal0_7[OS_counter0_7] <= 1;                            signal0_7[OS_counter0_7-4] <= 0;                        end else signal0_7[OS_counter0_7] <= 0;                        signal0_7[PE_size - (OS_counter0_7-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_7 < kernelsize*kernelsize+4)begin                            signal0_7[OS_counter0_7] <= 1;                            signal0_7[OS_counter0_7-4] <= 0;                        end else signal0_7[OS_counter0_7] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_7 < (PE_size/partition)-1+(7*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_7 > WS_width*kernelsize && PE_size - (OS_counter0_7-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_7 < PE_size)begin//WS
                        signal0_7[PE_size - (OS_counter0_7-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_7 < kernelsize*kernelsize) signal0_7[OS_counter0_7] <= 1;                    else signal0_7[OS_counter0_7] <= 0;                end else begin//OS
                    if(OS_counter0_7 > WS_width*kernelsize && PE_size - (OS_counter0_7-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_7 < PE_size)begin//WS
                        if(OS_counter0_7 < kernelsize*kernelsize+4)begin                            signal0_7[OS_counter0_7] <= 1;                            signal0_7[OS_counter0_7-4] <= 0;                        end else signal0_7[OS_counter0_7] <= 0;                        signal0_7[PE_size - (OS_counter0_7-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_7 < kernelsize*kernelsize+4)begin                            signal0_7[OS_counter0_7] <= 1;                            signal0_7[OS_counter0_7-4] <= 0;                        end else signal0_7[OS_counter0_7] <= 0;                end            end else begin
                signal0_7[0] <= 0;                signal0_7[1] <= 0;                signal0_7[2] <= 0;                signal0_7[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第8個signal
    if(rst)begin
        signal0_8[0] <= 0;        signal0_8[1] <= 0;        signal0_8[2] <= 0;        signal0_8[3] <= 0;
    end else begin
        if(state0_8)begin
            if(PE_size/size==4)begin
                if(OS_counter0_8 < (PE_size/partition)-1+(8*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_8 > WS_width*kernelsize && PE_size - (OS_counter0_8-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_8 < PE_size)begin//WS
                        signal0_8[PE_size - (OS_counter0_8-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_8 < kernelsize*kernelsize) signal0_8[OS_counter0_8] <= 1;                    else signal0_8[OS_counter0_8] <= 0;                end else begin//OS
                    if(OS_counter0_8 > WS_width*kernelsize && PE_size - (OS_counter0_8-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_8 < PE_size)begin//WS
                        if(OS_counter0_8 < kernelsize*kernelsize+4)begin                            signal0_8[OS_counter0_8] <= 1;                            signal0_8[OS_counter0_8-4] <= 0;                        end else signal0_8[OS_counter0_8] <= 0;                        signal0_8[PE_size - (OS_counter0_8-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_8 < kernelsize*kernelsize+4)begin                            signal0_8[OS_counter0_8] <= 1;                            signal0_8[OS_counter0_8-4] <= 0;                        end else signal0_8[OS_counter0_8] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_8 < (PE_size/partition)-1+(8*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_8 > WS_width*kernelsize && PE_size - (OS_counter0_8-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_8 < PE_size)begin//WS
                        signal0_8[PE_size - (OS_counter0_8-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_8 < kernelsize*kernelsize) signal0_8[OS_counter0_8] <= 1;                    else signal0_8[OS_counter0_8] <= 0;                end else begin//OS
                    if(OS_counter0_8 > WS_width*kernelsize && PE_size - (OS_counter0_8-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_8 < PE_size)begin//WS
                        if(OS_counter0_8 < kernelsize*kernelsize+4)begin                            signal0_8[OS_counter0_8] <= 1;                            signal0_8[OS_counter0_8-4] <= 0;                        end else signal0_8[OS_counter0_8] <= 0;                        signal0_8[PE_size - (OS_counter0_8-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_8 < kernelsize*kernelsize+4)begin                            signal0_8[OS_counter0_8] <= 1;                            signal0_8[OS_counter0_8-4] <= 0;                        end else signal0_8[OS_counter0_8] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_8 < (PE_size/partition)-1+(8*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_8 > WS_width*kernelsize && PE_size - (OS_counter0_8-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_8 < PE_size)begin//WS
                        signal0_8[PE_size - (OS_counter0_8-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_8 < kernelsize*kernelsize) signal0_8[OS_counter0_8] <= 1;                    else signal0_8[OS_counter0_8] <= 0;                end else begin//OS
                    if(OS_counter0_8 > WS_width*kernelsize && PE_size - (OS_counter0_8-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_8 < PE_size)begin//WS
                        if(OS_counter0_8 < kernelsize*kernelsize+4)begin                            signal0_8[OS_counter0_8] <= 1;                            signal0_8[OS_counter0_8-4] <= 0;                        end else signal0_8[OS_counter0_8] <= 0;                        signal0_8[PE_size - (OS_counter0_8-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_8 < kernelsize*kernelsize+4)begin                            signal0_8[OS_counter0_8] <= 1;                            signal0_8[OS_counter0_8-4] <= 0;                        end else signal0_8[OS_counter0_8] <= 0;                end            end else begin
                signal0_8[0] <= 0;                signal0_8[1] <= 0;                signal0_8[2] <= 0;                signal0_8[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第9個signal
    if(rst)begin
        signal0_9[0] <= 0;        signal0_9[1] <= 0;        signal0_9[2] <= 0;        signal0_9[3] <= 0;
    end else begin
        if(state0_9)begin
            if(PE_size/size==4)begin
                if(OS_counter0_9 < (PE_size/partition)-1+(9*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_9 > WS_width*kernelsize && PE_size - (OS_counter0_9-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_9 < PE_size)begin//WS
                        signal0_9[PE_size - (OS_counter0_9-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_9 < kernelsize*kernelsize) signal0_9[OS_counter0_9] <= 1;                    else signal0_9[OS_counter0_9] <= 0;                end else begin//OS
                    if(OS_counter0_9 > WS_width*kernelsize && PE_size - (OS_counter0_9-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_9 < PE_size)begin//WS
                        if(OS_counter0_9 < kernelsize*kernelsize+4)begin                            signal0_9[OS_counter0_9] <= 1;                            signal0_9[OS_counter0_9-4] <= 0;                        end else signal0_9[OS_counter0_9] <= 0;                        signal0_9[PE_size - (OS_counter0_9-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_9 < kernelsize*kernelsize+4)begin                            signal0_9[OS_counter0_9] <= 1;                            signal0_9[OS_counter0_9-4] <= 0;                        end else signal0_9[OS_counter0_9] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_9 < (PE_size/partition)-1+(9*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_9 > WS_width*kernelsize && PE_size - (OS_counter0_9-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_9 < PE_size)begin//WS
                        signal0_9[PE_size - (OS_counter0_9-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_9 < kernelsize*kernelsize) signal0_9[OS_counter0_9] <= 1;                    else signal0_9[OS_counter0_9] <= 0;                end else begin//OS
                    if(OS_counter0_9 > WS_width*kernelsize && PE_size - (OS_counter0_9-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_9 < PE_size)begin//WS
                        if(OS_counter0_9 < kernelsize*kernelsize+4)begin                            signal0_9[OS_counter0_9] <= 1;                            signal0_9[OS_counter0_9-4] <= 0;                        end else signal0_9[OS_counter0_9] <= 0;                        signal0_9[PE_size - (OS_counter0_9-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_9 < kernelsize*kernelsize+4)begin                            signal0_9[OS_counter0_9] <= 1;                            signal0_9[OS_counter0_9-4] <= 0;                        end else signal0_9[OS_counter0_9] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_9 < (PE_size/partition)-1+(9*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_9 > WS_width*kernelsize && PE_size - (OS_counter0_9-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_9 < PE_size)begin//WS
                        signal0_9[PE_size - (OS_counter0_9-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_9 < kernelsize*kernelsize) signal0_9[OS_counter0_9] <= 1;                    else signal0_9[OS_counter0_9] <= 0;                end else begin//OS
                    if(OS_counter0_9 > WS_width*kernelsize && PE_size - (OS_counter0_9-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_9 < PE_size)begin//WS
                        if(OS_counter0_9 < kernelsize*kernelsize+4)begin                            signal0_9[OS_counter0_9] <= 1;                            signal0_9[OS_counter0_9-4] <= 0;                        end else signal0_9[OS_counter0_9] <= 0;                        signal0_9[PE_size - (OS_counter0_9-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_9 < kernelsize*kernelsize+4)begin                            signal0_9[OS_counter0_9] <= 1;                            signal0_9[OS_counter0_9-4] <= 0;                        end else signal0_9[OS_counter0_9] <= 0;                end            end else begin
                signal0_9[0] <= 0;                signal0_9[1] <= 0;                signal0_9[2] <= 0;                signal0_9[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第10個signal
    if(rst)begin
        signal0_10[0] <= 0;        signal0_10[1] <= 0;        signal0_10[2] <= 0;        signal0_10[3] <= 0;
    end else begin
        if(state0_10)begin
            if(PE_size/size==4)begin
                if(OS_counter0_10 < (PE_size/partition)-1+(10*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_10 > WS_width*kernelsize && PE_size - (OS_counter0_10-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_10 < PE_size)begin//WS
                        signal0_10[PE_size - (OS_counter0_10-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_10 < kernelsize*kernelsize) signal0_10[OS_counter0_10] <= 1;                    else signal0_10[OS_counter0_10] <= 0;                end else begin//OS
                    if(OS_counter0_10 > WS_width*kernelsize && PE_size - (OS_counter0_10-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_10 < PE_size)begin//WS
                        if(OS_counter0_10 < kernelsize*kernelsize+4)begin                            signal0_10[OS_counter0_10] <= 1;                            signal0_10[OS_counter0_10-4] <= 0;                        end else signal0_10[OS_counter0_10] <= 0;                        signal0_10[PE_size - (OS_counter0_10-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_10 < kernelsize*kernelsize+4)begin                            signal0_10[OS_counter0_10] <= 1;                            signal0_10[OS_counter0_10-4] <= 0;                        end else signal0_10[OS_counter0_10] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_10 < (PE_size/partition)-1+(10*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_10 > WS_width*kernelsize && PE_size - (OS_counter0_10-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_10 < PE_size)begin//WS
                        signal0_10[PE_size - (OS_counter0_10-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_10 < kernelsize*kernelsize) signal0_10[OS_counter0_10] <= 1;                    else signal0_10[OS_counter0_10] <= 0;                end else begin//OS
                    if(OS_counter0_10 > WS_width*kernelsize && PE_size - (OS_counter0_10-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_10 < PE_size)begin//WS
                        if(OS_counter0_10 < kernelsize*kernelsize+4)begin                            signal0_10[OS_counter0_10] <= 1;                            signal0_10[OS_counter0_10-4] <= 0;                        end else signal0_10[OS_counter0_10] <= 0;                        signal0_10[PE_size - (OS_counter0_10-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_10 < kernelsize*kernelsize+4)begin                            signal0_10[OS_counter0_10] <= 1;                            signal0_10[OS_counter0_10-4] <= 0;                        end else signal0_10[OS_counter0_10] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_10 < (PE_size/partition)-1+(10*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_10 > WS_width*kernelsize && PE_size - (OS_counter0_10-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_10 < PE_size)begin//WS
                        signal0_10[PE_size - (OS_counter0_10-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_10 < kernelsize*kernelsize) signal0_10[OS_counter0_10] <= 1;                    else signal0_10[OS_counter0_10] <= 0;                end else begin//OS
                    if(OS_counter0_10 > WS_width*kernelsize && PE_size - (OS_counter0_10-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_10 < PE_size)begin//WS
                        if(OS_counter0_10 < kernelsize*kernelsize+4)begin                            signal0_10[OS_counter0_10] <= 1;                            signal0_10[OS_counter0_10-4] <= 0;                        end else signal0_10[OS_counter0_10] <= 0;                        signal0_10[PE_size - (OS_counter0_10-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_10 < kernelsize*kernelsize+4)begin                            signal0_10[OS_counter0_10] <= 1;                            signal0_10[OS_counter0_10-4] <= 0;                        end else signal0_10[OS_counter0_10] <= 0;                end            end else begin
                signal0_10[0] <= 0;                signal0_10[1] <= 0;                signal0_10[2] <= 0;                signal0_10[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第11個signal
    if(rst)begin
        signal0_11[0] <= 0;        signal0_11[1] <= 0;        signal0_11[2] <= 0;        signal0_11[3] <= 0;
    end else begin
        if(state0_11)begin
            if(PE_size/size==4)begin
                if(OS_counter0_11 < (PE_size/partition)-1+(11*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_11 > WS_width*kernelsize && PE_size - (OS_counter0_11-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_11 < PE_size)begin//WS
                        signal0_11[PE_size - (OS_counter0_11-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_11 < kernelsize*kernelsize) signal0_11[OS_counter0_11] <= 1;                    else signal0_11[OS_counter0_11] <= 0;                end else begin//OS
                    if(OS_counter0_11 > WS_width*kernelsize && PE_size - (OS_counter0_11-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_11 < PE_size)begin//WS
                        if(OS_counter0_11 < kernelsize*kernelsize+4)begin                            signal0_11[OS_counter0_11] <= 1;                            signal0_11[OS_counter0_11-4] <= 0;                        end else signal0_11[OS_counter0_11] <= 0;                        signal0_11[PE_size - (OS_counter0_11-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_11 < kernelsize*kernelsize+4)begin                            signal0_11[OS_counter0_11] <= 1;                            signal0_11[OS_counter0_11-4] <= 0;                        end else signal0_11[OS_counter0_11] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_11 < (PE_size/partition)-1+(11*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_11 > WS_width*kernelsize && PE_size - (OS_counter0_11-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_11 < PE_size)begin//WS
                        signal0_11[PE_size - (OS_counter0_11-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_11 < kernelsize*kernelsize) signal0_11[OS_counter0_11] <= 1;                    else signal0_11[OS_counter0_11] <= 0;                end else begin//OS
                    if(OS_counter0_11 > WS_width*kernelsize && PE_size - (OS_counter0_11-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_11 < PE_size)begin//WS
                        if(OS_counter0_11 < kernelsize*kernelsize+4)begin                            signal0_11[OS_counter0_11] <= 1;                            signal0_11[OS_counter0_11-4] <= 0;                        end else signal0_11[OS_counter0_11] <= 0;                        signal0_11[PE_size - (OS_counter0_11-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_11 < kernelsize*kernelsize+4)begin                            signal0_11[OS_counter0_11] <= 1;                            signal0_11[OS_counter0_11-4] <= 0;                        end else signal0_11[OS_counter0_11] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_11 < (PE_size/partition)-1+(11*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_11 > WS_width*kernelsize && PE_size - (OS_counter0_11-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_11 < PE_size)begin//WS
                        signal0_11[PE_size - (OS_counter0_11-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_11 < kernelsize*kernelsize) signal0_11[OS_counter0_11] <= 1;                    else signal0_11[OS_counter0_11] <= 0;                end else begin//OS
                    if(OS_counter0_11 > WS_width*kernelsize && PE_size - (OS_counter0_11-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_11 < PE_size)begin//WS
                        if(OS_counter0_11 < kernelsize*kernelsize+4)begin                            signal0_11[OS_counter0_11] <= 1;                            signal0_11[OS_counter0_11-4] <= 0;                        end else signal0_11[OS_counter0_11] <= 0;                        signal0_11[PE_size - (OS_counter0_11-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_11 < kernelsize*kernelsize+4)begin                            signal0_11[OS_counter0_11] <= 1;                            signal0_11[OS_counter0_11-4] <= 0;                        end else signal0_11[OS_counter0_11] <= 0;                end            end else begin
                signal0_11[0] <= 0;                signal0_11[1] <= 0;                signal0_11[2] <= 0;                signal0_11[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第12個signal
    if(rst)begin
        signal0_12[0] <= 0;        signal0_12[1] <= 0;        signal0_12[2] <= 0;        signal0_12[3] <= 0;
    end else begin
        if(state0_12)begin
            if(PE_size/size==4)begin
                if(OS_counter0_12 < (PE_size/partition)-1+(12*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_12 > WS_width*kernelsize && PE_size - (OS_counter0_12-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_12 < PE_size)begin//WS
                        signal0_12[PE_size - (OS_counter0_12-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_12 < kernelsize*kernelsize) signal0_12[OS_counter0_12] <= 1;                    else signal0_12[OS_counter0_12] <= 0;                end else begin//OS
                    if(OS_counter0_12 > WS_width*kernelsize && PE_size - (OS_counter0_12-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_12 < PE_size)begin//WS
                        if(OS_counter0_12 < kernelsize*kernelsize+4)begin                            signal0_12[OS_counter0_12] <= 1;                            signal0_12[OS_counter0_12-4] <= 0;                        end else signal0_12[OS_counter0_12] <= 0;                        signal0_12[PE_size - (OS_counter0_12-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_12 < kernelsize*kernelsize+4)begin                            signal0_12[OS_counter0_12] <= 1;                            signal0_12[OS_counter0_12-4] <= 0;                        end else signal0_12[OS_counter0_12] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_12 < (PE_size/partition)-1+(12*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_12 > WS_width*kernelsize && PE_size - (OS_counter0_12-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_12 < PE_size)begin//WS
                        signal0_12[PE_size - (OS_counter0_12-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_12 < kernelsize*kernelsize) signal0_12[OS_counter0_12] <= 1;                    else signal0_12[OS_counter0_12] <= 0;                end else begin//OS
                    if(OS_counter0_12 > WS_width*kernelsize && PE_size - (OS_counter0_12-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_12 < PE_size)begin//WS
                        if(OS_counter0_12 < kernelsize*kernelsize+4)begin                            signal0_12[OS_counter0_12] <= 1;                            signal0_12[OS_counter0_12-4] <= 0;                        end else signal0_12[OS_counter0_12] <= 0;                        signal0_12[PE_size - (OS_counter0_12-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_12 < kernelsize*kernelsize+4)begin                            signal0_12[OS_counter0_12] <= 1;                            signal0_12[OS_counter0_12-4] <= 0;                        end else signal0_12[OS_counter0_12] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_12 < (PE_size/partition)-1+(12*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_12 > WS_width*kernelsize && PE_size - (OS_counter0_12-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_12 < PE_size)begin//WS
                        signal0_12[PE_size - (OS_counter0_12-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_12 < kernelsize*kernelsize) signal0_12[OS_counter0_12] <= 1;                    else signal0_12[OS_counter0_12] <= 0;                end else begin//OS
                    if(OS_counter0_12 > WS_width*kernelsize && PE_size - (OS_counter0_12-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_12 < PE_size)begin//WS
                        if(OS_counter0_12 < kernelsize*kernelsize+4)begin                            signal0_12[OS_counter0_12] <= 1;                            signal0_12[OS_counter0_12-4] <= 0;                        end else signal0_12[OS_counter0_12] <= 0;                        signal0_12[PE_size - (OS_counter0_12-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_12 < kernelsize*kernelsize+4)begin                            signal0_12[OS_counter0_12] <= 1;                            signal0_12[OS_counter0_12-4] <= 0;                        end else signal0_12[OS_counter0_12] <= 0;                end            end else begin
                signal0_12[0] <= 0;                signal0_12[1] <= 0;                signal0_12[2] <= 0;                signal0_12[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第13個signal
    if(rst)begin
        signal0_13[0] <= 0;        signal0_13[1] <= 0;        signal0_13[2] <= 0;        signal0_13[3] <= 0;
    end else begin
        if(state0_13)begin
            if(PE_size/size==4)begin
                if(OS_counter0_13 < (PE_size/partition)-1+(13*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_13 > WS_width*kernelsize && PE_size - (OS_counter0_13-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_13 < PE_size)begin//WS
                        signal0_13[PE_size - (OS_counter0_13-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_13 < kernelsize*kernelsize) signal0_13[OS_counter0_13] <= 1;                    else signal0_13[OS_counter0_13] <= 0;                end else begin//OS
                    if(OS_counter0_13 > WS_width*kernelsize && PE_size - (OS_counter0_13-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_13 < PE_size)begin//WS
                        if(OS_counter0_13 < kernelsize*kernelsize+4)begin                            signal0_13[OS_counter0_13] <= 1;                            signal0_13[OS_counter0_13-4] <= 0;                        end else signal0_13[OS_counter0_13] <= 0;                        signal0_13[PE_size - (OS_counter0_13-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_13 < kernelsize*kernelsize+4)begin                            signal0_13[OS_counter0_13] <= 1;                            signal0_13[OS_counter0_13-4] <= 0;                        end else signal0_13[OS_counter0_13] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_13 < (PE_size/partition)-1+(13*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_13 > WS_width*kernelsize && PE_size - (OS_counter0_13-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_13 < PE_size)begin//WS
                        signal0_13[PE_size - (OS_counter0_13-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_13 < kernelsize*kernelsize) signal0_13[OS_counter0_13] <= 1;                    else signal0_13[OS_counter0_13] <= 0;                end else begin//OS
                    if(OS_counter0_13 > WS_width*kernelsize && PE_size - (OS_counter0_13-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_13 < PE_size)begin//WS
                        if(OS_counter0_13 < kernelsize*kernelsize+4)begin                            signal0_13[OS_counter0_13] <= 1;                            signal0_13[OS_counter0_13-4] <= 0;                        end else signal0_13[OS_counter0_13] <= 0;                        signal0_13[PE_size - (OS_counter0_13-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_13 < kernelsize*kernelsize+4)begin                            signal0_13[OS_counter0_13] <= 1;                            signal0_13[OS_counter0_13-4] <= 0;                        end else signal0_13[OS_counter0_13] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_13 < (PE_size/partition)-1+(13*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_13 > WS_width*kernelsize && PE_size - (OS_counter0_13-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_13 < PE_size)begin//WS
                        signal0_13[PE_size - (OS_counter0_13-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_13 < kernelsize*kernelsize) signal0_13[OS_counter0_13] <= 1;                    else signal0_13[OS_counter0_13] <= 0;                end else begin//OS
                    if(OS_counter0_13 > WS_width*kernelsize && PE_size - (OS_counter0_13-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_13 < PE_size)begin//WS
                        if(OS_counter0_13 < kernelsize*kernelsize+4)begin                            signal0_13[OS_counter0_13] <= 1;                            signal0_13[OS_counter0_13-4] <= 0;                        end else signal0_13[OS_counter0_13] <= 0;                        signal0_13[PE_size - (OS_counter0_13-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_13 < kernelsize*kernelsize+4)begin                            signal0_13[OS_counter0_13] <= 1;                            signal0_13[OS_counter0_13-4] <= 0;                        end else signal0_13[OS_counter0_13] <= 0;                end            end else begin
                signal0_13[0] <= 0;                signal0_13[1] <= 0;                signal0_13[2] <= 0;                signal0_13[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第14個signal
    if(rst)begin
        signal0_14[0] <= 0;        signal0_14[1] <= 0;        signal0_14[2] <= 0;        signal0_14[3] <= 0;
    end else begin
        if(state0_14)begin
            if(PE_size/size==4)begin
                if(OS_counter0_14 < (PE_size/partition)-1+(14*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_14 > WS_width*kernelsize && PE_size - (OS_counter0_14-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_14 < PE_size)begin//WS
                        signal0_14[PE_size - (OS_counter0_14-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_14 < kernelsize*kernelsize) signal0_14[OS_counter0_14] <= 1;                    else signal0_14[OS_counter0_14] <= 0;                end else begin//OS
                    if(OS_counter0_14 > WS_width*kernelsize && PE_size - (OS_counter0_14-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_14 < PE_size)begin//WS
                        if(OS_counter0_14 < kernelsize*kernelsize+4)begin                            signal0_14[OS_counter0_14] <= 1;                            signal0_14[OS_counter0_14-4] <= 0;                        end else signal0_14[OS_counter0_14] <= 0;                        signal0_14[PE_size - (OS_counter0_14-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_14 < kernelsize*kernelsize+4)begin                            signal0_14[OS_counter0_14] <= 1;                            signal0_14[OS_counter0_14-4] <= 0;                        end else signal0_14[OS_counter0_14] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_14 < (PE_size/partition)-1+(14*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_14 > WS_width*kernelsize && PE_size - (OS_counter0_14-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_14 < PE_size)begin//WS
                        signal0_14[PE_size - (OS_counter0_14-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_14 < kernelsize*kernelsize) signal0_14[OS_counter0_14] <= 1;                    else signal0_14[OS_counter0_14] <= 0;                end else begin//OS
                    if(OS_counter0_14 > WS_width*kernelsize && PE_size - (OS_counter0_14-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_14 < PE_size)begin//WS
                        if(OS_counter0_14 < kernelsize*kernelsize+4)begin                            signal0_14[OS_counter0_14] <= 1;                            signal0_14[OS_counter0_14-4] <= 0;                        end else signal0_14[OS_counter0_14] <= 0;                        signal0_14[PE_size - (OS_counter0_14-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_14 < kernelsize*kernelsize+4)begin                            signal0_14[OS_counter0_14] <= 1;                            signal0_14[OS_counter0_14-4] <= 0;                        end else signal0_14[OS_counter0_14] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_14 < (PE_size/partition)-1+(14*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_14 > WS_width*kernelsize && PE_size - (OS_counter0_14-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_14 < PE_size)begin//WS
                        signal0_14[PE_size - (OS_counter0_14-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_14 < kernelsize*kernelsize) signal0_14[OS_counter0_14] <= 1;                    else signal0_14[OS_counter0_14] <= 0;                end else begin//OS
                    if(OS_counter0_14 > WS_width*kernelsize && PE_size - (OS_counter0_14-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_14 < PE_size)begin//WS
                        if(OS_counter0_14 < kernelsize*kernelsize+4)begin                            signal0_14[OS_counter0_14] <= 1;                            signal0_14[OS_counter0_14-4] <= 0;                        end else signal0_14[OS_counter0_14] <= 0;                        signal0_14[PE_size - (OS_counter0_14-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_14 < kernelsize*kernelsize+4)begin                            signal0_14[OS_counter0_14] <= 1;                            signal0_14[OS_counter0_14-4] <= 0;                        end else signal0_14[OS_counter0_14] <= 0;                end            end else begin
                signal0_14[0] <= 0;                signal0_14[1] <= 0;                signal0_14[2] <= 0;                signal0_14[3] <= 0;
            end

        end
    end
end
always_ff@( posedge clk or posedge rst ) begin //  第0個layer中第15個signal
    if(rst)begin
        signal0_15[0] <= 0;        signal0_15[1] <= 0;        signal0_15[2] <= 0;        signal0_15[3] <= 0;
    end else begin
        if(state0_15)begin
            if(PE_size/size==4)begin
                if(OS_counter0_15 < (PE_size/partition)-1+(15*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_15 > WS_width*kernelsize && PE_size - (OS_counter0_15-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_15 < PE_size)begin//WS
                        signal0_15[PE_size - (OS_counter0_15-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_15 < kernelsize*kernelsize) signal0_15[OS_counter0_15] <= 1;                    else signal0_15[OS_counter0_15] <= 0;                end else begin//OS
                    if(OS_counter0_15 > WS_width*kernelsize && PE_size - (OS_counter0_15-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_15 < PE_size)begin//WS
                        if(OS_counter0_15 < kernelsize*kernelsize+4)begin                            signal0_15[OS_counter0_15] <= 1;                            signal0_15[OS_counter0_15-4] <= 0;                        end else signal0_15[OS_counter0_15] <= 0;                        signal0_15[PE_size - (OS_counter0_15-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_15 < kernelsize*kernelsize+4)begin                            signal0_15[OS_counter0_15] <= 1;                            signal0_15[OS_counter0_15-4] <= 0;                        end else signal0_15[OS_counter0_15] <= 0;                end            end else if(PE_size/size==2)begin
                if(OS_counter0_15 < (PE_size/partition)-1+(15*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_15 > WS_width*kernelsize && PE_size - (OS_counter0_15-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_15 < PE_size)begin//WS
                        signal0_15[PE_size - (OS_counter0_15-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_15 < kernelsize*kernelsize) signal0_15[OS_counter0_15] <= 1;                    else signal0_15[OS_counter0_15] <= 0;                end else begin//OS
                    if(OS_counter0_15 > WS_width*kernelsize && PE_size - (OS_counter0_15-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_15 < PE_size)begin//WS
                        if(OS_counter0_15 < kernelsize*kernelsize+4)begin                            signal0_15[OS_counter0_15] <= 1;                            signal0_15[OS_counter0_15-4] <= 0;                        end else signal0_15[OS_counter0_15] <= 0;                        signal0_15[PE_size - (OS_counter0_15-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_15 < kernelsize*kernelsize+4)begin                            signal0_15[OS_counter0_15] <= 1;                            signal0_15[OS_counter0_15-4] <= 0;                        end else signal0_15[OS_counter0_15] <= 0;                end            end else if(PE_size/size==1)begin
                if(OS_counter0_15 < (PE_size/partition)-1+(15*(PE_size/partition)%(PE_size/size)))begin//OS
                    if(OS_counter0_15 > WS_width*kernelsize && PE_size - (OS_counter0_15-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_15 < PE_size)begin//WS
                        signal0_15[PE_size - (OS_counter0_15-WS_width*kernelsize-1)] <= 1;
                    end
                    if(OS_counter0_15 < kernelsize*kernelsize) signal0_15[OS_counter0_15] <= 1;                    else signal0_15[OS_counter0_15] <= 0;                end else begin//OS
                    if(OS_counter0_15 > WS_width*kernelsize && PE_size - (OS_counter0_15-WS_width*kernelsize-1) >= kernelsize*kernelsize &&  OS_counter0_15 < PE_size)begin//WS
                        if(OS_counter0_15 < kernelsize*kernelsize+4)begin                            signal0_15[OS_counter0_15] <= 1;                            signal0_15[OS_counter0_15-4] <= 0;                        end else signal0_15[OS_counter0_15] <= 0;                        signal0_15[PE_size - (OS_counter0_15-WS_width*kernelsize-1)] <= 1;
                    end 
                        if(OS_counter0_15 < kernelsize*kernelsize+4)begin                            signal0_15[OS_counter0_15] <= 1;                            signal0_15[OS_counter0_15-4] <= 0;                        end else signal0_15[OS_counter0_15] <= 0;                end            end else begin
                signal0_15[0] <= 0;                signal0_15[1] <= 0;                signal0_15[2] <= 0;                signal0_15[3] <= 0;
            end

        end
    end
end

logic [9:0]OSISnum0_0[3:0],OSISnum0_1[3:0],OSISnum0_2[3:0],OSISnum0_3[3:0],OSISnum0_4[3:0],OSISnum0_5[3:0],OSISnum0_6[3:0],OSISnum0_7[3:0],OSISnum0_8[3:0],OSISnum0_9[3:0],OSISnum0_10[3:0],OSISnum0_11[3:0],OSISnum0_12[3:0],OSISnum0_13[3:0],OSISnum0_14[3:0],OSISnum0_15[3:0];
logic [9:0]OSWSnum0_0[3:0],OSWSnum0_1[3:0],OSWSnum0_2[3:0],OSWSnum0_3[3:0],OSWSnum0_4[3:0],OSWSnum0_5[3:0],OSWSnum0_6[3:0],OSWSnum0_7[3:0],OSWSnum0_8[3:0],OSWSnum0_9[3:0],OSWSnum0_10[3:0],OSWSnum0_11[3:0],OSWSnum0_12[3:0],OSWSnum0_13[3:0],OSWSnum0_14[3:0],OSWSnum0_15[3:0];
always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第0個OS的input
    if(rst)begin
        OSISnum0_0[0] <= 0; OSISnum0_0[1] <= 0; OSISnum0_0[2] <= 0; OSISnum0_0[3] <= 0;
    end else begin
        if(state0_0)begin
            if(PE_size/size==4)begin
                if(OS_counter0_0 == 4*0+0)begin
                    OSISnum0_0[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_0 == 4*0+1)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_0 == 4*0+2)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_0 == 4*0+3)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[2] + 1;                    OSISnum0_0[3] <= OSISnum0_0[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[2] + 1;                    OSISnum0_0[3] <= OSISnum0_0[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_0 == 4*0+0)begin
                    OSISnum0_0[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_0 == 4*0+1)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_0 == 4*0+2)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_0 == 4*0+3)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[2] + 1;                    OSISnum0_0[3] <= OSISnum0_0[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[2] + 1;                    OSISnum0_0[3] <= OSISnum0_0[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_0 == 4*0+0)begin
                    OSISnum0_0[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_0 == 4*0+1)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_0 == 4*0+2)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_0 == 4*0+3)begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[2] + 1;                    OSISnum0_0[3] <= OSISnum0_0[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_0[0] <= OSISnum0_0[0] + 1;                    OSISnum0_0[1] <= OSISnum0_0[1] + 1;                    OSISnum0_0[2] <= OSISnum0_0[2] + 1;                    OSISnum0_0[3] <= OSISnum0_0[3] + 1;                end
            end        end else begin
            OSISnum0_0[0] <= 0; OSISnum0_0[1] <= 0; OSISnum0_0[2] <= 0; OSISnum0_0[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第1個OS的input
    if(rst)begin
        OSISnum0_1[0] <= 0; OSISnum0_1[1] <= 0; OSISnum0_1[2] <= 0; OSISnum0_1[3] <= 0;
    end else begin
        if(state0_1)begin
            if(PE_size/size==4)begin
                if(OS_counter0_1 == 4*0+0)begin
                    OSISnum0_1[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_1 == 4*0+1)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_1 == 4*0+2)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_1 == 4*0+3)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[2] + 1;                    OSISnum0_1[3] <= OSISnum0_1[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[2] + 1;                    OSISnum0_1[3] <= OSISnum0_1[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_1 == 4*1+0)begin
                    OSISnum0_1[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_1 == 4*1+1)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_1 == 4*1+2)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_1 == 4*1+3)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[2] + 1;                    OSISnum0_1[3] <= OSISnum0_1[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[2] + 1;                    OSISnum0_1[3] <= OSISnum0_1[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_1 == 4*1+0)begin
                    OSISnum0_1[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_1 == 4*1+1)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_1 == 4*1+2)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_1 == 4*1+3)begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[2] + 1;                    OSISnum0_1[3] <= OSISnum0_1[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_1[0] <= OSISnum0_1[0] + 1;                    OSISnum0_1[1] <= OSISnum0_1[1] + 1;                    OSISnum0_1[2] <= OSISnum0_1[2] + 1;                    OSISnum0_1[3] <= OSISnum0_1[3] + 1;                end
            end        end else begin
            OSISnum0_1[0] <= 0; OSISnum0_1[1] <= 0; OSISnum0_1[2] <= 0; OSISnum0_1[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第2個OS的input
    if(rst)begin
        OSISnum0_2[0] <= 0; OSISnum0_2[1] <= 0; OSISnum0_2[2] <= 0; OSISnum0_2[3] <= 0;
    end else begin
        if(state0_2)begin
            if(PE_size/size==4)begin
                if(OS_counter0_2 == 4*0+0)begin
                    OSISnum0_2[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_2 == 4*0+1)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_2 == 4*0+2)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_2 == 4*0+3)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[2] + 1;                    OSISnum0_2[3] <= OSISnum0_2[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[2] + 1;                    OSISnum0_2[3] <= OSISnum0_2[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_2 == 4*0+0)begin
                    OSISnum0_2[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_2 == 4*0+1)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_2 == 4*0+2)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_2 == 4*0+3)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[2] + 1;                    OSISnum0_2[3] <= OSISnum0_2[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[2] + 1;                    OSISnum0_2[3] <= OSISnum0_2[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_2 == 4*2+0)begin
                    OSISnum0_2[0] <= ((round-1)*layer_num*(kernelsize**4)) + 8*(kernelsize*kernelsize);

                end else if(OS_counter0_2 == 4*2+1)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_2 == 4*2+2)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_2 == 4*2+3)begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[2] + 1;                    OSISnum0_2[3] <= OSISnum0_2[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_2[0] <= OSISnum0_2[0] + 1;                    OSISnum0_2[1] <= OSISnum0_2[1] + 1;                    OSISnum0_2[2] <= OSISnum0_2[2] + 1;                    OSISnum0_2[3] <= OSISnum0_2[3] + 1;                end
            end        end else begin
            OSISnum0_2[0] <= 0; OSISnum0_2[1] <= 0; OSISnum0_2[2] <= 0; OSISnum0_2[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第3個OS的input
    if(rst)begin
        OSISnum0_3[0] <= 0; OSISnum0_3[1] <= 0; OSISnum0_3[2] <= 0; OSISnum0_3[3] <= 0;
    end else begin
        if(state0_3)begin
            if(PE_size/size==4)begin
                if(OS_counter0_3 == 4*0+0)begin
                    OSISnum0_3[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_3 == 4*0+1)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_3 == 4*0+2)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_3 == 4*0+3)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[2] + 1;                    OSISnum0_3[3] <= OSISnum0_3[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[2] + 1;                    OSISnum0_3[3] <= OSISnum0_3[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_3 == 4*1+0)begin
                    OSISnum0_3[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_3 == 4*1+1)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_3 == 4*1+2)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_3 == 4*1+3)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[2] + 1;                    OSISnum0_3[3] <= OSISnum0_3[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[2] + 1;                    OSISnum0_3[3] <= OSISnum0_3[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_3 == 4*3+0)begin
                    OSISnum0_3[0] <= ((round-1)*layer_num*(kernelsize**4)) + 12*(kernelsize*kernelsize);

                end else if(OS_counter0_3 == 4*3+1)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_3 == 4*3+2)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_3 == 4*3+3)begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[2] + 1;                    OSISnum0_3[3] <= OSISnum0_3[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_3[0] <= OSISnum0_3[0] + 1;                    OSISnum0_3[1] <= OSISnum0_3[1] + 1;                    OSISnum0_3[2] <= OSISnum0_3[2] + 1;                    OSISnum0_3[3] <= OSISnum0_3[3] + 1;                end
            end        end else begin
            OSISnum0_3[0] <= 0; OSISnum0_3[1] <= 0; OSISnum0_3[2] <= 0; OSISnum0_3[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第4個OS的input
    if(rst)begin
        OSISnum0_4[0] <= 0; OSISnum0_4[1] <= 0; OSISnum0_4[2] <= 0; OSISnum0_4[3] <= 0;
    end else begin
        if(state0_4)begin
            if(PE_size/size==4)begin
                if(OS_counter0_4 == 4*0+0)begin
                    OSISnum0_4[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_4 == 4*0+1)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_4 == 4*0+2)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_4 == 4*0+3)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[2] + 1;                    OSISnum0_4[3] <= OSISnum0_4[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[2] + 1;                    OSISnum0_4[3] <= OSISnum0_4[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_4 == 4*0+0)begin
                    OSISnum0_4[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_4 == 4*0+1)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_4 == 4*0+2)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_4 == 4*0+3)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[2] + 1;                    OSISnum0_4[3] <= OSISnum0_4[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[2] + 1;                    OSISnum0_4[3] <= OSISnum0_4[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_4 == 4*0+0)begin
                    OSISnum0_4[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_4 == 4*0+1)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_4 == 4*0+2)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_4 == 4*0+3)begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[2] + 1;                    OSISnum0_4[3] <= OSISnum0_4[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_4[0] <= OSISnum0_4[0] + 1;                    OSISnum0_4[1] <= OSISnum0_4[1] + 1;                    OSISnum0_4[2] <= OSISnum0_4[2] + 1;                    OSISnum0_4[3] <= OSISnum0_4[3] + 1;                end
            end        end else begin
            OSISnum0_4[0] <= 0; OSISnum0_4[1] <= 0; OSISnum0_4[2] <= 0; OSISnum0_4[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第5個OS的input
    if(rst)begin
        OSISnum0_5[0] <= 0; OSISnum0_5[1] <= 0; OSISnum0_5[2] <= 0; OSISnum0_5[3] <= 0;
    end else begin
        if(state0_5)begin
            if(PE_size/size==4)begin
                if(OS_counter0_5 == 4*0+0)begin
                    OSISnum0_5[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_5 == 4*0+1)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_5 == 4*0+2)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_5 == 4*0+3)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[2] + 1;                    OSISnum0_5[3] <= OSISnum0_5[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[2] + 1;                    OSISnum0_5[3] <= OSISnum0_5[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_5 == 4*1+0)begin
                    OSISnum0_5[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_5 == 4*1+1)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_5 == 4*1+2)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_5 == 4*1+3)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[2] + 1;                    OSISnum0_5[3] <= OSISnum0_5[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[2] + 1;                    OSISnum0_5[3] <= OSISnum0_5[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_5 == 4*1+0)begin
                    OSISnum0_5[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_5 == 4*1+1)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_5 == 4*1+2)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_5 == 4*1+3)begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[2] + 1;                    OSISnum0_5[3] <= OSISnum0_5[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_5[0] <= OSISnum0_5[0] + 1;                    OSISnum0_5[1] <= OSISnum0_5[1] + 1;                    OSISnum0_5[2] <= OSISnum0_5[2] + 1;                    OSISnum0_5[3] <= OSISnum0_5[3] + 1;                end
            end        end else begin
            OSISnum0_5[0] <= 0; OSISnum0_5[1] <= 0; OSISnum0_5[2] <= 0; OSISnum0_5[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第6個OS的input
    if(rst)begin
        OSISnum0_6[0] <= 0; OSISnum0_6[1] <= 0; OSISnum0_6[2] <= 0; OSISnum0_6[3] <= 0;
    end else begin
        if(state0_6)begin
            if(PE_size/size==4)begin
                if(OS_counter0_6 == 4*0+0)begin
                    OSISnum0_6[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_6 == 4*0+1)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_6 == 4*0+2)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_6 == 4*0+3)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[2] + 1;                    OSISnum0_6[3] <= OSISnum0_6[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[2] + 1;                    OSISnum0_6[3] <= OSISnum0_6[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_6 == 4*0+0)begin
                    OSISnum0_6[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_6 == 4*0+1)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_6 == 4*0+2)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_6 == 4*0+3)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[2] + 1;                    OSISnum0_6[3] <= OSISnum0_6[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[2] + 1;                    OSISnum0_6[3] <= OSISnum0_6[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_6 == 4*2+0)begin
                    OSISnum0_6[0] <= ((round-1)*layer_num*(kernelsize**4)) + 8*(kernelsize*kernelsize);

                end else if(OS_counter0_6 == 4*2+1)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_6 == 4*2+2)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_6 == 4*2+3)begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[2] + 1;                    OSISnum0_6[3] <= OSISnum0_6[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_6[0] <= OSISnum0_6[0] + 1;                    OSISnum0_6[1] <= OSISnum0_6[1] + 1;                    OSISnum0_6[2] <= OSISnum0_6[2] + 1;                    OSISnum0_6[3] <= OSISnum0_6[3] + 1;                end
            end        end else begin
            OSISnum0_6[0] <= 0; OSISnum0_6[1] <= 0; OSISnum0_6[2] <= 0; OSISnum0_6[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第7個OS的input
    if(rst)begin
        OSISnum0_7[0] <= 0; OSISnum0_7[1] <= 0; OSISnum0_7[2] <= 0; OSISnum0_7[3] <= 0;
    end else begin
        if(state0_7)begin
            if(PE_size/size==4)begin
                if(OS_counter0_7 == 4*0+0)begin
                    OSISnum0_7[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_7 == 4*0+1)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_7 == 4*0+2)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_7 == 4*0+3)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[2] + 1;                    OSISnum0_7[3] <= OSISnum0_7[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[2] + 1;                    OSISnum0_7[3] <= OSISnum0_7[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_7 == 4*1+0)begin
                    OSISnum0_7[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_7 == 4*1+1)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_7 == 4*1+2)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_7 == 4*1+3)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[2] + 1;                    OSISnum0_7[3] <= OSISnum0_7[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[2] + 1;                    OSISnum0_7[3] <= OSISnum0_7[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_7 == 4*3+0)begin
                    OSISnum0_7[0] <= ((round-1)*layer_num*(kernelsize**4)) + 12*(kernelsize*kernelsize);

                end else if(OS_counter0_7 == 4*3+1)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_7 == 4*3+2)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_7 == 4*3+3)begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[2] + 1;                    OSISnum0_7[3] <= OSISnum0_7[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_7[0] <= OSISnum0_7[0] + 1;                    OSISnum0_7[1] <= OSISnum0_7[1] + 1;                    OSISnum0_7[2] <= OSISnum0_7[2] + 1;                    OSISnum0_7[3] <= OSISnum0_7[3] + 1;                end
            end        end else begin
            OSISnum0_7[0] <= 0; OSISnum0_7[1] <= 0; OSISnum0_7[2] <= 0; OSISnum0_7[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第8個OS的input
    if(rst)begin
        OSISnum0_8[0] <= 0; OSISnum0_8[1] <= 0; OSISnum0_8[2] <= 0; OSISnum0_8[3] <= 0;
    end else begin
        if(state0_8)begin
            if(PE_size/size==4)begin
                if(OS_counter0_8 == 4*0+0)begin
                    OSISnum0_8[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_8 == 4*0+1)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_8 == 4*0+2)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_8 == 4*0+3)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[2] + 1;                    OSISnum0_8[3] <= OSISnum0_8[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[2] + 1;                    OSISnum0_8[3] <= OSISnum0_8[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_8 == 4*0+0)begin
                    OSISnum0_8[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_8 == 4*0+1)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_8 == 4*0+2)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_8 == 4*0+3)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[2] + 1;                    OSISnum0_8[3] <= OSISnum0_8[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[2] + 1;                    OSISnum0_8[3] <= OSISnum0_8[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_8 == 4*0+0)begin
                    OSISnum0_8[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_8 == 4*0+1)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_8 == 4*0+2)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_8 == 4*0+3)begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[2] + 1;                    OSISnum0_8[3] <= OSISnum0_8[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_8[0] <= OSISnum0_8[0] + 1;                    OSISnum0_8[1] <= OSISnum0_8[1] + 1;                    OSISnum0_8[2] <= OSISnum0_8[2] + 1;                    OSISnum0_8[3] <= OSISnum0_8[3] + 1;                end
            end        end else begin
            OSISnum0_8[0] <= 0; OSISnum0_8[1] <= 0; OSISnum0_8[2] <= 0; OSISnum0_8[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第9個OS的input
    if(rst)begin
        OSISnum0_9[0] <= 0; OSISnum0_9[1] <= 0; OSISnum0_9[2] <= 0; OSISnum0_9[3] <= 0;
    end else begin
        if(state0_9)begin
            if(PE_size/size==4)begin
                if(OS_counter0_9 == 4*0+0)begin
                    OSISnum0_9[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_9 == 4*0+1)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_9 == 4*0+2)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_9 == 4*0+3)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[2] + 1;                    OSISnum0_9[3] <= OSISnum0_9[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[2] + 1;                    OSISnum0_9[3] <= OSISnum0_9[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_9 == 4*1+0)begin
                    OSISnum0_9[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_9 == 4*1+1)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_9 == 4*1+2)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_9 == 4*1+3)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[2] + 1;                    OSISnum0_9[3] <= OSISnum0_9[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[2] + 1;                    OSISnum0_9[3] <= OSISnum0_9[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_9 == 4*1+0)begin
                    OSISnum0_9[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_9 == 4*1+1)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_9 == 4*1+2)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_9 == 4*1+3)begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[2] + 1;                    OSISnum0_9[3] <= OSISnum0_9[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_9[0] <= OSISnum0_9[0] + 1;                    OSISnum0_9[1] <= OSISnum0_9[1] + 1;                    OSISnum0_9[2] <= OSISnum0_9[2] + 1;                    OSISnum0_9[3] <= OSISnum0_9[3] + 1;                end
            end        end else begin
            OSISnum0_9[0] <= 0; OSISnum0_9[1] <= 0; OSISnum0_9[2] <= 0; OSISnum0_9[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第10個OS的input
    if(rst)begin
        OSISnum0_10[0] <= 0; OSISnum0_10[1] <= 0; OSISnum0_10[2] <= 0; OSISnum0_10[3] <= 0;
    end else begin
        if(state0_10)begin
            if(PE_size/size==4)begin
                if(OS_counter0_10 == 4*0+0)begin
                    OSISnum0_10[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_10 == 4*0+1)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_10 == 4*0+2)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_10 == 4*0+3)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[2] + 1;                    OSISnum0_10[3] <= OSISnum0_10[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[2] + 1;                    OSISnum0_10[3] <= OSISnum0_10[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_10 == 4*0+0)begin
                    OSISnum0_10[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_10 == 4*0+1)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_10 == 4*0+2)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_10 == 4*0+3)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[2] + 1;                    OSISnum0_10[3] <= OSISnum0_10[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[2] + 1;                    OSISnum0_10[3] <= OSISnum0_10[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_10 == 4*2+0)begin
                    OSISnum0_10[0] <= ((round-1)*layer_num*(kernelsize**4)) + 8*(kernelsize*kernelsize);

                end else if(OS_counter0_10 == 4*2+1)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_10 == 4*2+2)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_10 == 4*2+3)begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[2] + 1;                    OSISnum0_10[3] <= OSISnum0_10[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_10[0] <= OSISnum0_10[0] + 1;                    OSISnum0_10[1] <= OSISnum0_10[1] + 1;                    OSISnum0_10[2] <= OSISnum0_10[2] + 1;                    OSISnum0_10[3] <= OSISnum0_10[3] + 1;                end
            end        end else begin
            OSISnum0_10[0] <= 0; OSISnum0_10[1] <= 0; OSISnum0_10[2] <= 0; OSISnum0_10[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第11個OS的input
    if(rst)begin
        OSISnum0_11[0] <= 0; OSISnum0_11[1] <= 0; OSISnum0_11[2] <= 0; OSISnum0_11[3] <= 0;
    end else begin
        if(state0_11)begin
            if(PE_size/size==4)begin
                if(OS_counter0_11 == 4*0+0)begin
                    OSISnum0_11[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_11 == 4*0+1)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_11 == 4*0+2)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_11 == 4*0+3)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[2] + 1;                    OSISnum0_11[3] <= OSISnum0_11[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[2] + 1;                    OSISnum0_11[3] <= OSISnum0_11[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_11 == 4*1+0)begin
                    OSISnum0_11[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_11 == 4*1+1)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_11 == 4*1+2)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_11 == 4*1+3)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[2] + 1;                    OSISnum0_11[3] <= OSISnum0_11[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[2] + 1;                    OSISnum0_11[3] <= OSISnum0_11[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_11 == 4*3+0)begin
                    OSISnum0_11[0] <= ((round-1)*layer_num*(kernelsize**4)) + 12*(kernelsize*kernelsize);

                end else if(OS_counter0_11 == 4*3+1)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_11 == 4*3+2)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_11 == 4*3+3)begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[2] + 1;                    OSISnum0_11[3] <= OSISnum0_11[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_11[0] <= OSISnum0_11[0] + 1;                    OSISnum0_11[1] <= OSISnum0_11[1] + 1;                    OSISnum0_11[2] <= OSISnum0_11[2] + 1;                    OSISnum0_11[3] <= OSISnum0_11[3] + 1;                end
            end        end else begin
            OSISnum0_11[0] <= 0; OSISnum0_11[1] <= 0; OSISnum0_11[2] <= 0; OSISnum0_11[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第12個OS的input
    if(rst)begin
        OSISnum0_12[0] <= 0; OSISnum0_12[1] <= 0; OSISnum0_12[2] <= 0; OSISnum0_12[3] <= 0;
    end else begin
        if(state0_12)begin
            if(PE_size/size==4)begin
                if(OS_counter0_12 == 4*0+0)begin
                    OSISnum0_12[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_12 == 4*0+1)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_12 == 4*0+2)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_12 == 4*0+3)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[2] + 1;                    OSISnum0_12[3] <= OSISnum0_12[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[2] + 1;                    OSISnum0_12[3] <= OSISnum0_12[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_12 == 4*0+0)begin
                    OSISnum0_12[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_12 == 4*0+1)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_12 == 4*0+2)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_12 == 4*0+3)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[2] + 1;                    OSISnum0_12[3] <= OSISnum0_12[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[2] + 1;                    OSISnum0_12[3] <= OSISnum0_12[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_12 == 4*0+0)begin
                    OSISnum0_12[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_12 == 4*0+1)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_12 == 4*0+2)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_12 == 4*0+3)begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[2] + 1;                    OSISnum0_12[3] <= OSISnum0_12[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_12[0] <= OSISnum0_12[0] + 1;                    OSISnum0_12[1] <= OSISnum0_12[1] + 1;                    OSISnum0_12[2] <= OSISnum0_12[2] + 1;                    OSISnum0_12[3] <= OSISnum0_12[3] + 1;                end
            end        end else begin
            OSISnum0_12[0] <= 0; OSISnum0_12[1] <= 0; OSISnum0_12[2] <= 0; OSISnum0_12[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第13個OS的input
    if(rst)begin
        OSISnum0_13[0] <= 0; OSISnum0_13[1] <= 0; OSISnum0_13[2] <= 0; OSISnum0_13[3] <= 0;
    end else begin
        if(state0_13)begin
            if(PE_size/size==4)begin
                if(OS_counter0_13 == 4*0+0)begin
                    OSISnum0_13[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_13 == 4*0+1)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_13 == 4*0+2)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_13 == 4*0+3)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[2] + 1;                    OSISnum0_13[3] <= OSISnum0_13[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[2] + 1;                    OSISnum0_13[3] <= OSISnum0_13[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_13 == 4*1+0)begin
                    OSISnum0_13[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_13 == 4*1+1)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_13 == 4*1+2)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_13 == 4*1+3)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[2] + 1;                    OSISnum0_13[3] <= OSISnum0_13[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[2] + 1;                    OSISnum0_13[3] <= OSISnum0_13[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_13 == 4*1+0)begin
                    OSISnum0_13[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_13 == 4*1+1)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_13 == 4*1+2)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_13 == 4*1+3)begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[2] + 1;                    OSISnum0_13[3] <= OSISnum0_13[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_13[0] <= OSISnum0_13[0] + 1;                    OSISnum0_13[1] <= OSISnum0_13[1] + 1;                    OSISnum0_13[2] <= OSISnum0_13[2] + 1;                    OSISnum0_13[3] <= OSISnum0_13[3] + 1;                end
            end        end else begin
            OSISnum0_13[0] <= 0; OSISnum0_13[1] <= 0; OSISnum0_13[2] <= 0; OSISnum0_13[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第14個OS的input
    if(rst)begin
        OSISnum0_14[0] <= 0; OSISnum0_14[1] <= 0; OSISnum0_14[2] <= 0; OSISnum0_14[3] <= 0;
    end else begin
        if(state0_14)begin
            if(PE_size/size==4)begin
                if(OS_counter0_14 == 4*0+0)begin
                    OSISnum0_14[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_14 == 4*0+1)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_14 == 4*0+2)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_14 == 4*0+3)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[2] + 1;                    OSISnum0_14[3] <= OSISnum0_14[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[2] + 1;                    OSISnum0_14[3] <= OSISnum0_14[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_14 == 4*0+0)begin
                    OSISnum0_14[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_14 == 4*0+1)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_14 == 4*0+2)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_14 == 4*0+3)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[2] + 1;                    OSISnum0_14[3] <= OSISnum0_14[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[2] + 1;                    OSISnum0_14[3] <= OSISnum0_14[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_14 == 4*2+0)begin
                    OSISnum0_14[0] <= ((round-1)*layer_num*(kernelsize**4)) + 8*(kernelsize*kernelsize);

                end else if(OS_counter0_14 == 4*2+1)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_14 == 4*2+2)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_14 == 4*2+3)begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[2] + 1;                    OSISnum0_14[3] <= OSISnum0_14[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_14[0] <= OSISnum0_14[0] + 1;                    OSISnum0_14[1] <= OSISnum0_14[1] + 1;                    OSISnum0_14[2] <= OSISnum0_14[2] + 1;                    OSISnum0_14[3] <= OSISnum0_14[3] + 1;                end
            end        end else begin
            OSISnum0_14[0] <= 0; OSISnum0_14[1] <= 0; OSISnum0_14[2] <= 0; OSISnum0_14[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個layer中第15個OS的input
    if(rst)begin
        OSISnum0_15[0] <= 0; OSISnum0_15[1] <= 0; OSISnum0_15[2] <= 0; OSISnum0_15[3] <= 0;
    end else begin
        if(state0_15)begin
            if(PE_size/size==4)begin
                if(OS_counter0_15 == 4*0+0)begin
                    OSISnum0_15[0] <= ((round-1)*layer_num*(kernelsize**4)) + 0*(kernelsize*kernelsize);

                end else if(OS_counter0_15 == 4*0+1)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_15 == 4*0+2)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_15 == 4*0+3)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[2] + 1;                    OSISnum0_15[3] <= OSISnum0_15[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[2] + 1;                    OSISnum0_15[3] <= OSISnum0_15[3] + 1;                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_15 == 4*1+0)begin
                    OSISnum0_15[0] <= ((round-1)*layer_num*(kernelsize**4)) + 4*(kernelsize*kernelsize);

                end else if(OS_counter0_15 == 4*1+1)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_15 == 4*1+2)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_15 == 4*1+3)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[2] + 1;                    OSISnum0_15[3] <= OSISnum0_15[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[2] + 1;                    OSISnum0_15[3] <= OSISnum0_15[3] + 1;                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_15 == 4*3+0)begin
                    OSISnum0_15[0] <= ((round-1)*layer_num*(kernelsize**4)) + 12*(kernelsize*kernelsize);

                end else if(OS_counter0_15 == 4*3+1)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[0] + (kernelsize*kernelsize);
                end else if(OS_counter0_15 == 4*3+2)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[1] + (kernelsize*kernelsize);
                end else if(OS_counter0_15 == 4*3+3)begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[2] + 1;                    OSISnum0_15[3] <= OSISnum0_15[2] + (kernelsize*kernelsize);
                end else begin
                    OSISnum0_15[0] <= OSISnum0_15[0] + 1;                    OSISnum0_15[1] <= OSISnum0_15[1] + 1;                    OSISnum0_15[2] <= OSISnum0_15[2] + 1;                    OSISnum0_15[3] <= OSISnum0_15[3] + 1;                end
            end        end else begin
            OSISnum0_15[0] <= 0; OSISnum0_15[1] <= 0; OSISnum0_15[2] <= 0; OSISnum0_15[3] <= 0;

        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個OS的weight
    if(rst)begin

        OSWSnum0_0[0] <= 0; OSWSnum0_0[1] <= 0; OSWSnum0_0[2] <= 0; OSWSnum0_0[3] <= 0;
    end else begin
        if(state0_0)begin
            if(PE_size/size==4)begin
                if(OS_counter0_0 == 4*0+0)begin
                    OSWSnum0_0[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+1)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[0] + kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+2)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;                    OSWSnum0_0[2] <= OSWSnum0_0[1] + kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+3)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;                    OSWSnum0_0[2] <= OSWSnum0_0[2] + 1;                    OSWSnum0_0[3] <= OSWSnum0_0[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;
                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;
                    OSWSnum0_0[2] <= OSWSnum0_0[2] + 1;
                    OSWSnum0_0[3] <= OSWSnum0_0[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_0 == 4*0+0)begin
                    OSWSnum0_0[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+1)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[0] + kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+2)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;                    OSWSnum0_0[2] <= OSWSnum0_0[1] + kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+3)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;                    OSWSnum0_0[2] <= OSWSnum0_0[2] + 1;                    OSWSnum0_0[3] <= OSWSnum0_0[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;
                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;
                    OSWSnum0_0[2] <= OSWSnum0_0[2] + 1;
                    OSWSnum0_0[3] <= OSWSnum0_0[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_0 == 4*0+0)begin
                    OSWSnum0_0[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+1)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[0] + kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+2)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;                    OSWSnum0_0[2] <= OSWSnum0_0[1] + kernelsize*kernelsize;
                end else if(OS_counter0_0 == 4*0+3)begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;                    OSWSnum0_0[2] <= OSWSnum0_0[2] + 1;                    OSWSnum0_0[3] <= OSWSnum0_0[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_0[0] <= OSWSnum0_0[0] + 1;
                    OSWSnum0_0[1] <= OSWSnum0_0[1] + 1;
                    OSWSnum0_0[2] <= OSWSnum0_0[2] + 1;
                    OSWSnum0_0[3] <= OSWSnum0_0[3] + 1;
                end
            end        end else begin
            OSWSnum0_0[0] <= 0; OSWSnum0_0[1] <= 0; OSWSnum0_0[2] <= 0; OSWSnum0_0[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第1個OS的weight
    if(rst)begin

        OSWSnum0_1[0] <= 0; OSWSnum0_1[1] <= 0; OSWSnum0_1[2] <= 0; OSWSnum0_1[3] <= 0;
    end else begin
        if(state0_1)begin
            if(PE_size/size==4)begin
                if(OS_counter0_1 == 4*0+0)begin
                    OSWSnum0_1[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_1 == 4*0+1)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= OSWSnum0_1[0] + kernelsize*kernelsize;
                end else if(OS_counter0_1 == 4*0+2)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;                    OSWSnum0_1[2] <= OSWSnum0_1[1] + kernelsize*kernelsize;
                end else if(OS_counter0_1 == 4*0+3)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;                    OSWSnum0_1[2] <= OSWSnum0_1[2] + 1;                    OSWSnum0_1[3] <= OSWSnum0_1[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;
                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;
                    OSWSnum0_1[2] <= OSWSnum0_1[2] + 1;
                    OSWSnum0_1[3] <= OSWSnum0_1[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_1 == 4*0+0)begin
                    OSWSnum0_1[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_1 == 4*1+1)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= 0;
                end else if(OS_counter0_1 == 4*1+2)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;                    OSWSnum0_1[2] <= 0;
                end else if(OS_counter0_1 == 4*1+3)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;                    OSWSnum0_1[2] <= OSWSnum0_1[2] + 1;                    OSWSnum0_1[3] <= 0;
                end else begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;
                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;
                    OSWSnum0_1[2] <= OSWSnum0_1[2] + 1;
                    OSWSnum0_1[3] <= OSWSnum0_1[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_1 == 4*0+0)begin
                    OSWSnum0_1[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_1 == 4*1+1)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= 0;
                end else if(OS_counter0_1 == 4*1+2)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;                    OSWSnum0_1[2] <= 0;
                end else if(OS_counter0_1 == 4*1+3)begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;                    OSWSnum0_1[2] <= OSWSnum0_1[2] + 1;                    OSWSnum0_1[3] <= 0;
                end else begin
                    OSWSnum0_1[0] <= OSWSnum0_1[0] + 1;
                    OSWSnum0_1[1] <= OSWSnum0_1[1] + 1;
                    OSWSnum0_1[2] <= OSWSnum0_1[2] + 1;
                    OSWSnum0_1[3] <= OSWSnum0_1[3] + 1;
                end
            end        end else begin
            OSWSnum0_1[0] <= 0; OSWSnum0_1[1] <= 0; OSWSnum0_1[2] <= 0; OSWSnum0_1[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第2個OS的weight
    if(rst)begin

        OSWSnum0_2[0] <= 0; OSWSnum0_2[1] <= 0; OSWSnum0_2[2] <= 0; OSWSnum0_2[3] <= 0;
    end else begin
        if(state0_2)begin
            if(PE_size/size==4)begin
                if(OS_counter0_2 == 4*0+0)begin
                    OSWSnum0_2[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_2 == 4*0+1)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= OSWSnum0_2[0] + kernelsize*kernelsize;
                end else if(OS_counter0_2 == 4*0+2)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;                    OSWSnum0_2[2] <= OSWSnum0_2[1] + kernelsize*kernelsize;
                end else if(OS_counter0_2 == 4*0+3)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;                    OSWSnum0_2[2] <= OSWSnum0_2[2] + 1;                    OSWSnum0_2[3] <= OSWSnum0_2[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;
                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;
                    OSWSnum0_2[2] <= OSWSnum0_2[2] + 1;
                    OSWSnum0_2[3] <= OSWSnum0_2[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_2 == 4*0+0)begin
                    OSWSnum0_2[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_2 == 4*0+1)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= OSWSnum0_2[0] + kernelsize*kernelsize;
                end else if(OS_counter0_2 == 4*0+2)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;                    OSWSnum0_2[2] <= OSWSnum0_2[1] + kernelsize*kernelsize;
                end else if(OS_counter0_2 == 4*0+3)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;                    OSWSnum0_2[2] <= OSWSnum0_2[2] + 1;                    OSWSnum0_2[3] <= OSWSnum0_2[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;
                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;
                    OSWSnum0_2[2] <= OSWSnum0_2[2] + 1;
                    OSWSnum0_2[3] <= OSWSnum0_2[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_2 == 4*0+0)begin
                    OSWSnum0_2[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_2 == 4*2+1)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= 0;
                end else if(OS_counter0_2 == 4*2+2)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;                    OSWSnum0_2[2] <= 0;
                end else if(OS_counter0_2 == 4*2+3)begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;                    OSWSnum0_2[2] <= OSWSnum0_2[2] + 1;                    OSWSnum0_2[3] <= 0;
                end else begin
                    OSWSnum0_2[0] <= OSWSnum0_2[0] + 1;
                    OSWSnum0_2[1] <= OSWSnum0_2[1] + 1;
                    OSWSnum0_2[2] <= OSWSnum0_2[2] + 1;
                    OSWSnum0_2[3] <= OSWSnum0_2[3] + 1;
                end
            end        end else begin
            OSWSnum0_2[0] <= 0; OSWSnum0_2[1] <= 0; OSWSnum0_2[2] <= 0; OSWSnum0_2[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第3個OS的weight
    if(rst)begin

        OSWSnum0_3[0] <= 0; OSWSnum0_3[1] <= 0; OSWSnum0_3[2] <= 0; OSWSnum0_3[3] <= 0;
    end else begin
        if(state0_3)begin
            if(PE_size/size==4)begin
                if(OS_counter0_3 == 4*0+0)begin
                    OSWSnum0_3[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_3 == 4*0+1)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= OSWSnum0_3[0] + kernelsize*kernelsize;
                end else if(OS_counter0_3 == 4*0+2)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;                    OSWSnum0_3[2] <= OSWSnum0_3[1] + kernelsize*kernelsize;
                end else if(OS_counter0_3 == 4*0+3)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;                    OSWSnum0_3[2] <= OSWSnum0_3[2] + 1;                    OSWSnum0_3[3] <= OSWSnum0_3[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;
                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;
                    OSWSnum0_3[2] <= OSWSnum0_3[2] + 1;
                    OSWSnum0_3[3] <= OSWSnum0_3[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_3 == 4*0+0)begin
                    OSWSnum0_3[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_3 == 4*1+1)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= 0;
                end else if(OS_counter0_3 == 4*1+2)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;                    OSWSnum0_3[2] <= 0;
                end else if(OS_counter0_3 == 4*1+3)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;                    OSWSnum0_3[2] <= OSWSnum0_3[2] + 1;                    OSWSnum0_3[3] <= 0;
                end else begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;
                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;
                    OSWSnum0_3[2] <= OSWSnum0_3[2] + 1;
                    OSWSnum0_3[3] <= OSWSnum0_3[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_3 == 4*0+0)begin
                    OSWSnum0_3[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_3 == 4*3+1)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= 0;
                end else if(OS_counter0_3 == 4*3+2)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;                    OSWSnum0_3[2] <= 0;
                end else if(OS_counter0_3 == 4*3+3)begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;                    OSWSnum0_3[2] <= OSWSnum0_3[2] + 1;                    OSWSnum0_3[3] <= 0;
                end else begin
                    OSWSnum0_3[0] <= OSWSnum0_3[0] + 1;
                    OSWSnum0_3[1] <= OSWSnum0_3[1] + 1;
                    OSWSnum0_3[2] <= OSWSnum0_3[2] + 1;
                    OSWSnum0_3[3] <= OSWSnum0_3[3] + 1;
                end
            end        end else begin
            OSWSnum0_3[0] <= 0; OSWSnum0_3[1] <= 0; OSWSnum0_3[2] <= 0; OSWSnum0_3[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第4個OS的weight
    if(rst)begin

        OSWSnum0_4[0] <= 0; OSWSnum0_4[1] <= 0; OSWSnum0_4[2] <= 0; OSWSnum0_4[3] <= 0;
    end else begin
        if(state0_4)begin
            if(PE_size/size==4)begin
                if(OS_counter0_4 == 4*0+0)begin
                    OSWSnum0_4[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+1)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[0] + kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+2)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;                    OSWSnum0_4[2] <= OSWSnum0_4[1] + kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+3)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;                    OSWSnum0_4[2] <= OSWSnum0_4[2] + 1;                    OSWSnum0_4[3] <= OSWSnum0_4[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;
                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;
                    OSWSnum0_4[2] <= OSWSnum0_4[2] + 1;
                    OSWSnum0_4[3] <= OSWSnum0_4[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_4 == 4*1+0)begin
                    OSWSnum0_4[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+1)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[0] + kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+2)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;                    OSWSnum0_4[2] <= OSWSnum0_4[1] + kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+3)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;                    OSWSnum0_4[2] <= OSWSnum0_4[2] + 1;                    OSWSnum0_4[3] <= OSWSnum0_4[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;
                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;
                    OSWSnum0_4[2] <= OSWSnum0_4[2] + 1;
                    OSWSnum0_4[3] <= OSWSnum0_4[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_4 == 4*1+0)begin
                    OSWSnum0_4[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+1)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[0] + kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+2)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;                    OSWSnum0_4[2] <= OSWSnum0_4[1] + kernelsize*kernelsize;
                end else if(OS_counter0_4 == 4*0+3)begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;                    OSWSnum0_4[2] <= OSWSnum0_4[2] + 1;                    OSWSnum0_4[3] <= OSWSnum0_4[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_4[0] <= OSWSnum0_4[0] + 1;
                    OSWSnum0_4[1] <= OSWSnum0_4[1] + 1;
                    OSWSnum0_4[2] <= OSWSnum0_4[2] + 1;
                    OSWSnum0_4[3] <= OSWSnum0_4[3] + 1;
                end
            end        end else begin
            OSWSnum0_4[0] <= 0; OSWSnum0_4[1] <= 0; OSWSnum0_4[2] <= 0; OSWSnum0_4[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第5個OS的weight
    if(rst)begin

        OSWSnum0_5[0] <= 0; OSWSnum0_5[1] <= 0; OSWSnum0_5[2] <= 0; OSWSnum0_5[3] <= 0;
    end else begin
        if(state0_5)begin
            if(PE_size/size==4)begin
                if(OS_counter0_5 == 4*0+0)begin
                    OSWSnum0_5[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_5 == 4*0+1)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= OSWSnum0_5[0] + kernelsize*kernelsize;
                end else if(OS_counter0_5 == 4*0+2)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;                    OSWSnum0_5[2] <= OSWSnum0_5[1] + kernelsize*kernelsize;
                end else if(OS_counter0_5 == 4*0+3)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;                    OSWSnum0_5[2] <= OSWSnum0_5[2] + 1;                    OSWSnum0_5[3] <= OSWSnum0_5[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;
                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;
                    OSWSnum0_5[2] <= OSWSnum0_5[2] + 1;
                    OSWSnum0_5[3] <= OSWSnum0_5[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_5 == 4*1+0)begin
                    OSWSnum0_5[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_5 == 4*1+1)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= 0;
                end else if(OS_counter0_5 == 4*1+2)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;                    OSWSnum0_5[2] <= 0;
                end else if(OS_counter0_5 == 4*1+3)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;                    OSWSnum0_5[2] <= OSWSnum0_5[2] + 1;                    OSWSnum0_5[3] <= 0;
                end else begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;
                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;
                    OSWSnum0_5[2] <= OSWSnum0_5[2] + 1;
                    OSWSnum0_5[3] <= OSWSnum0_5[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_5 == 4*1+0)begin
                    OSWSnum0_5[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_5 == 4*1+1)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= 0;
                end else if(OS_counter0_5 == 4*1+2)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;                    OSWSnum0_5[2] <= 0;
                end else if(OS_counter0_5 == 4*1+3)begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;                    OSWSnum0_5[2] <= OSWSnum0_5[2] + 1;                    OSWSnum0_5[3] <= 0;
                end else begin
                    OSWSnum0_5[0] <= OSWSnum0_5[0] + 1;
                    OSWSnum0_5[1] <= OSWSnum0_5[1] + 1;
                    OSWSnum0_5[2] <= OSWSnum0_5[2] + 1;
                    OSWSnum0_5[3] <= OSWSnum0_5[3] + 1;
                end
            end        end else begin
            OSWSnum0_5[0] <= 0; OSWSnum0_5[1] <= 0; OSWSnum0_5[2] <= 0; OSWSnum0_5[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第6個OS的weight
    if(rst)begin

        OSWSnum0_6[0] <= 0; OSWSnum0_6[1] <= 0; OSWSnum0_6[2] <= 0; OSWSnum0_6[3] <= 0;
    end else begin
        if(state0_6)begin
            if(PE_size/size==4)begin
                if(OS_counter0_6 == 4*0+0)begin
                    OSWSnum0_6[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_6 == 4*0+1)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= OSWSnum0_6[0] + kernelsize*kernelsize;
                end else if(OS_counter0_6 == 4*0+2)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;                    OSWSnum0_6[2] <= OSWSnum0_6[1] + kernelsize*kernelsize;
                end else if(OS_counter0_6 == 4*0+3)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;                    OSWSnum0_6[2] <= OSWSnum0_6[2] + 1;                    OSWSnum0_6[3] <= OSWSnum0_6[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;
                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;
                    OSWSnum0_6[2] <= OSWSnum0_6[2] + 1;
                    OSWSnum0_6[3] <= OSWSnum0_6[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_6 == 4*1+0)begin
                    OSWSnum0_6[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_6 == 4*0+1)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= OSWSnum0_6[0] + kernelsize*kernelsize;
                end else if(OS_counter0_6 == 4*0+2)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;                    OSWSnum0_6[2] <= OSWSnum0_6[1] + kernelsize*kernelsize;
                end else if(OS_counter0_6 == 4*0+3)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;                    OSWSnum0_6[2] <= OSWSnum0_6[2] + 1;                    OSWSnum0_6[3] <= OSWSnum0_6[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;
                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;
                    OSWSnum0_6[2] <= OSWSnum0_6[2] + 1;
                    OSWSnum0_6[3] <= OSWSnum0_6[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_6 == 4*1+0)begin
                    OSWSnum0_6[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_6 == 4*2+1)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= 0;
                end else if(OS_counter0_6 == 4*2+2)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;                    OSWSnum0_6[2] <= 0;
                end else if(OS_counter0_6 == 4*2+3)begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;                    OSWSnum0_6[2] <= OSWSnum0_6[2] + 1;                    OSWSnum0_6[3] <= 0;
                end else begin
                    OSWSnum0_6[0] <= OSWSnum0_6[0] + 1;
                    OSWSnum0_6[1] <= OSWSnum0_6[1] + 1;
                    OSWSnum0_6[2] <= OSWSnum0_6[2] + 1;
                    OSWSnum0_6[3] <= OSWSnum0_6[3] + 1;
                end
            end        end else begin
            OSWSnum0_6[0] <= 0; OSWSnum0_6[1] <= 0; OSWSnum0_6[2] <= 0; OSWSnum0_6[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第7個OS的weight
    if(rst)begin

        OSWSnum0_7[0] <= 0; OSWSnum0_7[1] <= 0; OSWSnum0_7[2] <= 0; OSWSnum0_7[3] <= 0;
    end else begin
        if(state0_7)begin
            if(PE_size/size==4)begin
                if(OS_counter0_7 == 4*0+0)begin
                    OSWSnum0_7[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_7 == 4*0+1)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= OSWSnum0_7[0] + kernelsize*kernelsize;
                end else if(OS_counter0_7 == 4*0+2)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;                    OSWSnum0_7[2] <= OSWSnum0_7[1] + kernelsize*kernelsize;
                end else if(OS_counter0_7 == 4*0+3)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;                    OSWSnum0_7[2] <= OSWSnum0_7[2] + 1;                    OSWSnum0_7[3] <= OSWSnum0_7[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;
                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;
                    OSWSnum0_7[2] <= OSWSnum0_7[2] + 1;
                    OSWSnum0_7[3] <= OSWSnum0_7[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_7 == 4*1+0)begin
                    OSWSnum0_7[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_7 == 4*1+1)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= 0;
                end else if(OS_counter0_7 == 4*1+2)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;                    OSWSnum0_7[2] <= 0;
                end else if(OS_counter0_7 == 4*1+3)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;                    OSWSnum0_7[2] <= OSWSnum0_7[2] + 1;                    OSWSnum0_7[3] <= 0;
                end else begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;
                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;
                    OSWSnum0_7[2] <= OSWSnum0_7[2] + 1;
                    OSWSnum0_7[3] <= OSWSnum0_7[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_7 == 4*1+0)begin
                    OSWSnum0_7[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_7 == 4*3+1)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= 0;
                end else if(OS_counter0_7 == 4*3+2)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;                    OSWSnum0_7[2] <= 0;
                end else if(OS_counter0_7 == 4*3+3)begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;                    OSWSnum0_7[2] <= OSWSnum0_7[2] + 1;                    OSWSnum0_7[3] <= 0;
                end else begin
                    OSWSnum0_7[0] <= OSWSnum0_7[0] + 1;
                    OSWSnum0_7[1] <= OSWSnum0_7[1] + 1;
                    OSWSnum0_7[2] <= OSWSnum0_7[2] + 1;
                    OSWSnum0_7[3] <= OSWSnum0_7[3] + 1;
                end
            end        end else begin
            OSWSnum0_7[0] <= 0; OSWSnum0_7[1] <= 0; OSWSnum0_7[2] <= 0; OSWSnum0_7[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第8個OS的weight
    if(rst)begin

        OSWSnum0_8[0] <= 0; OSWSnum0_8[1] <= 0; OSWSnum0_8[2] <= 0; OSWSnum0_8[3] <= 0;
    end else begin
        if(state0_8)begin
            if(PE_size/size==4)begin
                if(OS_counter0_8 == 4*0+0)begin
                    OSWSnum0_8[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+1)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[0] + kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+2)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;                    OSWSnum0_8[2] <= OSWSnum0_8[1] + kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+3)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;                    OSWSnum0_8[2] <= OSWSnum0_8[2] + 1;                    OSWSnum0_8[3] <= OSWSnum0_8[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;
                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;
                    OSWSnum0_8[2] <= OSWSnum0_8[2] + 1;
                    OSWSnum0_8[3] <= OSWSnum0_8[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_8 == 4*0+0)begin
                    OSWSnum0_8[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+1)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[0] + kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+2)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;                    OSWSnum0_8[2] <= OSWSnum0_8[1] + kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+3)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;                    OSWSnum0_8[2] <= OSWSnum0_8[2] + 1;                    OSWSnum0_8[3] <= OSWSnum0_8[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;
                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;
                    OSWSnum0_8[2] <= OSWSnum0_8[2] + 1;
                    OSWSnum0_8[3] <= OSWSnum0_8[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_8 == 4*2+0)begin
                    OSWSnum0_8[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (2)*4*kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+1)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[0] + kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+2)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;                    OSWSnum0_8[2] <= OSWSnum0_8[1] + kernelsize*kernelsize;
                end else if(OS_counter0_8 == 4*0+3)begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;                    OSWSnum0_8[2] <= OSWSnum0_8[2] + 1;                    OSWSnum0_8[3] <= OSWSnum0_8[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_8[0] <= OSWSnum0_8[0] + 1;
                    OSWSnum0_8[1] <= OSWSnum0_8[1] + 1;
                    OSWSnum0_8[2] <= OSWSnum0_8[2] + 1;
                    OSWSnum0_8[3] <= OSWSnum0_8[3] + 1;
                end
            end        end else begin
            OSWSnum0_8[0] <= 0; OSWSnum0_8[1] <= 0; OSWSnum0_8[2] <= 0; OSWSnum0_8[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第9個OS的weight
    if(rst)begin

        OSWSnum0_9[0] <= 0; OSWSnum0_9[1] <= 0; OSWSnum0_9[2] <= 0; OSWSnum0_9[3] <= 0;
    end else begin
        if(state0_9)begin
            if(PE_size/size==4)begin
                if(OS_counter0_9 == 4*0+0)begin
                    OSWSnum0_9[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_9 == 4*0+1)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= OSWSnum0_9[0] + kernelsize*kernelsize;
                end else if(OS_counter0_9 == 4*0+2)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;                    OSWSnum0_9[2] <= OSWSnum0_9[1] + kernelsize*kernelsize;
                end else if(OS_counter0_9 == 4*0+3)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;                    OSWSnum0_9[2] <= OSWSnum0_9[2] + 1;                    OSWSnum0_9[3] <= OSWSnum0_9[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;
                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;
                    OSWSnum0_9[2] <= OSWSnum0_9[2] + 1;
                    OSWSnum0_9[3] <= OSWSnum0_9[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_9 == 4*0+0)begin
                    OSWSnum0_9[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_9 == 4*1+1)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= 0;
                end else if(OS_counter0_9 == 4*1+2)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;                    OSWSnum0_9[2] <= 0;
                end else if(OS_counter0_9 == 4*1+3)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;                    OSWSnum0_9[2] <= OSWSnum0_9[2] + 1;                    OSWSnum0_9[3] <= 0;
                end else begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;
                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;
                    OSWSnum0_9[2] <= OSWSnum0_9[2] + 1;
                    OSWSnum0_9[3] <= OSWSnum0_9[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_9 == 4*2+0)begin
                    OSWSnum0_9[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (2)*4*kernelsize*kernelsize;
                end else if(OS_counter0_9 == 4*1+1)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= 0;
                end else if(OS_counter0_9 == 4*1+2)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;                    OSWSnum0_9[2] <= 0;
                end else if(OS_counter0_9 == 4*1+3)begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;                    OSWSnum0_9[2] <= OSWSnum0_9[2] + 1;                    OSWSnum0_9[3] <= 0;
                end else begin
                    OSWSnum0_9[0] <= OSWSnum0_9[0] + 1;
                    OSWSnum0_9[1] <= OSWSnum0_9[1] + 1;
                    OSWSnum0_9[2] <= OSWSnum0_9[2] + 1;
                    OSWSnum0_9[3] <= OSWSnum0_9[3] + 1;
                end
            end        end else begin
            OSWSnum0_9[0] <= 0; OSWSnum0_9[1] <= 0; OSWSnum0_9[2] <= 0; OSWSnum0_9[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第10個OS的weight
    if(rst)begin

        OSWSnum0_10[0] <= 0; OSWSnum0_10[1] <= 0; OSWSnum0_10[2] <= 0; OSWSnum0_10[3] <= 0;
    end else begin
        if(state0_10)begin
            if(PE_size/size==4)begin
                if(OS_counter0_10 == 4*0+0)begin
                    OSWSnum0_10[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_10 == 4*0+1)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= OSWSnum0_10[0] + kernelsize*kernelsize;
                end else if(OS_counter0_10 == 4*0+2)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;                    OSWSnum0_10[2] <= OSWSnum0_10[1] + kernelsize*kernelsize;
                end else if(OS_counter0_10 == 4*0+3)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;                    OSWSnum0_10[2] <= OSWSnum0_10[2] + 1;                    OSWSnum0_10[3] <= OSWSnum0_10[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;
                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;
                    OSWSnum0_10[2] <= OSWSnum0_10[2] + 1;
                    OSWSnum0_10[3] <= OSWSnum0_10[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_10 == 4*0+0)begin
                    OSWSnum0_10[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_10 == 4*0+1)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= OSWSnum0_10[0] + kernelsize*kernelsize;
                end else if(OS_counter0_10 == 4*0+2)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;                    OSWSnum0_10[2] <= OSWSnum0_10[1] + kernelsize*kernelsize;
                end else if(OS_counter0_10 == 4*0+3)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;                    OSWSnum0_10[2] <= OSWSnum0_10[2] + 1;                    OSWSnum0_10[3] <= OSWSnum0_10[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;
                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;
                    OSWSnum0_10[2] <= OSWSnum0_10[2] + 1;
                    OSWSnum0_10[3] <= OSWSnum0_10[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_10 == 4*2+0)begin
                    OSWSnum0_10[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (2)*4*kernelsize*kernelsize;
                end else if(OS_counter0_10 == 4*2+1)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= 0;
                end else if(OS_counter0_10 == 4*2+2)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;                    OSWSnum0_10[2] <= 0;
                end else if(OS_counter0_10 == 4*2+3)begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;                    OSWSnum0_10[2] <= OSWSnum0_10[2] + 1;                    OSWSnum0_10[3] <= 0;
                end else begin
                    OSWSnum0_10[0] <= OSWSnum0_10[0] + 1;
                    OSWSnum0_10[1] <= OSWSnum0_10[1] + 1;
                    OSWSnum0_10[2] <= OSWSnum0_10[2] + 1;
                    OSWSnum0_10[3] <= OSWSnum0_10[3] + 1;
                end
            end        end else begin
            OSWSnum0_10[0] <= 0; OSWSnum0_10[1] <= 0; OSWSnum0_10[2] <= 0; OSWSnum0_10[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第11個OS的weight
    if(rst)begin

        OSWSnum0_11[0] <= 0; OSWSnum0_11[1] <= 0; OSWSnum0_11[2] <= 0; OSWSnum0_11[3] <= 0;
    end else begin
        if(state0_11)begin
            if(PE_size/size==4)begin
                if(OS_counter0_11 == 4*0+0)begin
                    OSWSnum0_11[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_11 == 4*0+1)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= OSWSnum0_11[0] + kernelsize*kernelsize;
                end else if(OS_counter0_11 == 4*0+2)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;                    OSWSnum0_11[2] <= OSWSnum0_11[1] + kernelsize*kernelsize;
                end else if(OS_counter0_11 == 4*0+3)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;                    OSWSnum0_11[2] <= OSWSnum0_11[2] + 1;                    OSWSnum0_11[3] <= OSWSnum0_11[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;
                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;
                    OSWSnum0_11[2] <= OSWSnum0_11[2] + 1;
                    OSWSnum0_11[3] <= OSWSnum0_11[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_11 == 4*0+0)begin
                    OSWSnum0_11[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_11 == 4*1+1)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= 0;
                end else if(OS_counter0_11 == 4*1+2)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;                    OSWSnum0_11[2] <= 0;
                end else if(OS_counter0_11 == 4*1+3)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;                    OSWSnum0_11[2] <= OSWSnum0_11[2] + 1;                    OSWSnum0_11[3] <= 0;
                end else begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;
                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;
                    OSWSnum0_11[2] <= OSWSnum0_11[2] + 1;
                    OSWSnum0_11[3] <= OSWSnum0_11[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_11 == 4*2+0)begin
                    OSWSnum0_11[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (2)*4*kernelsize*kernelsize;
                end else if(OS_counter0_11 == 4*3+1)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= 0;
                end else if(OS_counter0_11 == 4*3+2)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;                    OSWSnum0_11[2] <= 0;
                end else if(OS_counter0_11 == 4*3+3)begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;                    OSWSnum0_11[2] <= OSWSnum0_11[2] + 1;                    OSWSnum0_11[3] <= 0;
                end else begin
                    OSWSnum0_11[0] <= OSWSnum0_11[0] + 1;
                    OSWSnum0_11[1] <= OSWSnum0_11[1] + 1;
                    OSWSnum0_11[2] <= OSWSnum0_11[2] + 1;
                    OSWSnum0_11[3] <= OSWSnum0_11[3] + 1;
                end
            end        end else begin
            OSWSnum0_11[0] <= 0; OSWSnum0_11[1] <= 0; OSWSnum0_11[2] <= 0; OSWSnum0_11[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第12個OS的weight
    if(rst)begin

        OSWSnum0_12[0] <= 0; OSWSnum0_12[1] <= 0; OSWSnum0_12[2] <= 0; OSWSnum0_12[3] <= 0;
    end else begin
        if(state0_12)begin
            if(PE_size/size==4)begin
                if(OS_counter0_12 == 4*0+0)begin
                    OSWSnum0_12[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+1)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[0] + kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+2)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;                    OSWSnum0_12[2] <= OSWSnum0_12[1] + kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+3)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;                    OSWSnum0_12[2] <= OSWSnum0_12[2] + 1;                    OSWSnum0_12[3] <= OSWSnum0_12[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;
                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;
                    OSWSnum0_12[2] <= OSWSnum0_12[2] + 1;
                    OSWSnum0_12[3] <= OSWSnum0_12[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_12 == 4*1+0)begin
                    OSWSnum0_12[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+1)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[0] + kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+2)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;                    OSWSnum0_12[2] <= OSWSnum0_12[1] + kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+3)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;                    OSWSnum0_12[2] <= OSWSnum0_12[2] + 1;                    OSWSnum0_12[3] <= OSWSnum0_12[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;
                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;
                    OSWSnum0_12[2] <= OSWSnum0_12[2] + 1;
                    OSWSnum0_12[3] <= OSWSnum0_12[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_12 == 4*3+0)begin
                    OSWSnum0_12[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (3)*4*kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+1)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[0] + kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+2)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;                    OSWSnum0_12[2] <= OSWSnum0_12[1] + kernelsize*kernelsize;
                end else if(OS_counter0_12 == 4*0+3)begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;                    OSWSnum0_12[2] <= OSWSnum0_12[2] + 1;                    OSWSnum0_12[3] <= OSWSnum0_12[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_12[0] <= OSWSnum0_12[0] + 1;
                    OSWSnum0_12[1] <= OSWSnum0_12[1] + 1;
                    OSWSnum0_12[2] <= OSWSnum0_12[2] + 1;
                    OSWSnum0_12[3] <= OSWSnum0_12[3] + 1;
                end
            end        end else begin
            OSWSnum0_12[0] <= 0; OSWSnum0_12[1] <= 0; OSWSnum0_12[2] <= 0; OSWSnum0_12[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第13個OS的weight
    if(rst)begin

        OSWSnum0_13[0] <= 0; OSWSnum0_13[1] <= 0; OSWSnum0_13[2] <= 0; OSWSnum0_13[3] <= 0;
    end else begin
        if(state0_13)begin
            if(PE_size/size==4)begin
                if(OS_counter0_13 == 4*0+0)begin
                    OSWSnum0_13[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_13 == 4*0+1)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= OSWSnum0_13[0] + kernelsize*kernelsize;
                end else if(OS_counter0_13 == 4*0+2)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;                    OSWSnum0_13[2] <= OSWSnum0_13[1] + kernelsize*kernelsize;
                end else if(OS_counter0_13 == 4*0+3)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;                    OSWSnum0_13[2] <= OSWSnum0_13[2] + 1;                    OSWSnum0_13[3] <= OSWSnum0_13[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;
                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;
                    OSWSnum0_13[2] <= OSWSnum0_13[2] + 1;
                    OSWSnum0_13[3] <= OSWSnum0_13[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_13 == 4*1+0)begin
                    OSWSnum0_13[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_13 == 4*1+1)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= 0;
                end else if(OS_counter0_13 == 4*1+2)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;                    OSWSnum0_13[2] <= 0;
                end else if(OS_counter0_13 == 4*1+3)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;                    OSWSnum0_13[2] <= OSWSnum0_13[2] + 1;                    OSWSnum0_13[3] <= 0;
                end else begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;
                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;
                    OSWSnum0_13[2] <= OSWSnum0_13[2] + 1;
                    OSWSnum0_13[3] <= OSWSnum0_13[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_13 == 4*3+0)begin
                    OSWSnum0_13[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (3)*4*kernelsize*kernelsize;
                end else if(OS_counter0_13 == 4*1+1)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= 0;
                end else if(OS_counter0_13 == 4*1+2)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;                    OSWSnum0_13[2] <= 0;
                end else if(OS_counter0_13 == 4*1+3)begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;                    OSWSnum0_13[2] <= OSWSnum0_13[2] + 1;                    OSWSnum0_13[3] <= 0;
                end else begin
                    OSWSnum0_13[0] <= OSWSnum0_13[0] + 1;
                    OSWSnum0_13[1] <= OSWSnum0_13[1] + 1;
                    OSWSnum0_13[2] <= OSWSnum0_13[2] + 1;
                    OSWSnum0_13[3] <= OSWSnum0_13[3] + 1;
                end
            end        end else begin
            OSWSnum0_13[0] <= 0; OSWSnum0_13[1] <= 0; OSWSnum0_13[2] <= 0; OSWSnum0_13[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第14個OS的weight
    if(rst)begin

        OSWSnum0_14[0] <= 0; OSWSnum0_14[1] <= 0; OSWSnum0_14[2] <= 0; OSWSnum0_14[3] <= 0;
    end else begin
        if(state0_14)begin
            if(PE_size/size==4)begin
                if(OS_counter0_14 == 4*0+0)begin
                    OSWSnum0_14[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_14 == 4*0+1)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= OSWSnum0_14[0] + kernelsize*kernelsize;
                end else if(OS_counter0_14 == 4*0+2)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;                    OSWSnum0_14[2] <= OSWSnum0_14[1] + kernelsize*kernelsize;
                end else if(OS_counter0_14 == 4*0+3)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;                    OSWSnum0_14[2] <= OSWSnum0_14[2] + 1;                    OSWSnum0_14[3] <= OSWSnum0_14[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;
                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;
                    OSWSnum0_14[2] <= OSWSnum0_14[2] + 1;
                    OSWSnum0_14[3] <= OSWSnum0_14[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_14 == 4*1+0)begin
                    OSWSnum0_14[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_14 == 4*0+1)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= OSWSnum0_14[0] + kernelsize*kernelsize;
                end else if(OS_counter0_14 == 4*0+2)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;                    OSWSnum0_14[2] <= OSWSnum0_14[1] + kernelsize*kernelsize;
                end else if(OS_counter0_14 == 4*0+3)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;                    OSWSnum0_14[2] <= OSWSnum0_14[2] + 1;                    OSWSnum0_14[3] <= OSWSnum0_14[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;
                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;
                    OSWSnum0_14[2] <= OSWSnum0_14[2] + 1;
                    OSWSnum0_14[3] <= OSWSnum0_14[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_14 == 4*3+0)begin
                    OSWSnum0_14[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (3)*4*kernelsize*kernelsize;
                end else if(OS_counter0_14 == 4*2+1)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= 0;
                end else if(OS_counter0_14 == 4*2+2)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;                    OSWSnum0_14[2] <= 0;
                end else if(OS_counter0_14 == 4*2+3)begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;                    OSWSnum0_14[2] <= OSWSnum0_14[2] + 1;                    OSWSnum0_14[3] <= 0;
                end else begin
                    OSWSnum0_14[0] <= OSWSnum0_14[0] + 1;
                    OSWSnum0_14[1] <= OSWSnum0_14[1] + 1;
                    OSWSnum0_14[2] <= OSWSnum0_14[2] + 1;
                    OSWSnum0_14[3] <= OSWSnum0_14[3] + 1;
                end
            end        end else begin
            OSWSnum0_14[0] <= 0; OSWSnum0_14[1] <= 0; OSWSnum0_14[2] <= 0; OSWSnum0_14[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第15個OS的weight
    if(rst)begin

        OSWSnum0_15[0] <= 0; OSWSnum0_15[1] <= 0; OSWSnum0_15[2] <= 0; OSWSnum0_15[3] <= 0;
    end else begin
        if(state0_15)begin
            if(PE_size/size==4)begin
                if(OS_counter0_15 == 4*0+0)begin
                    OSWSnum0_15[0] <= (((round-1)*kernelsize*kernelsize*16)/total_inputmapnum)*(kernelsize**4) + (0)*4*kernelsize*kernelsize;
                end else if(OS_counter0_15 == 4*0+1)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= OSWSnum0_15[0] + kernelsize*kernelsize;
                end else if(OS_counter0_15 == 4*0+2)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;                    OSWSnum0_15[2] <= OSWSnum0_15[1] + kernelsize*kernelsize;
                end else if(OS_counter0_15 == 4*0+3)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;                    OSWSnum0_15[2] <= OSWSnum0_15[2] + 1;                    OSWSnum0_15[3] <= OSWSnum0_15[2] + kernelsize*kernelsize;
                end else begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;
                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;
                    OSWSnum0_15[2] <= OSWSnum0_15[2] + 1;
                    OSWSnum0_15[3] <= OSWSnum0_15[3] + 1;
                end
            end else if(PE_size/size==2)begin
                if(OS_counter0_15 == 4*1+0)begin
                    OSWSnum0_15[0] <= (((round-1)*kernelsize*kernelsize*4)/total_inputmapnum)*(kernelsize**4) + (1)*4*kernelsize*kernelsize;
                end else if(OS_counter0_15 == 4*1+1)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= 0;
                end else if(OS_counter0_15 == 4*1+2)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;                    OSWSnum0_15[2] <= 0;
                end else if(OS_counter0_15 == 4*1+3)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;                    OSWSnum0_15[2] <= OSWSnum0_15[2] + 1;                    OSWSnum0_15[3] <= 0;
                end else begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;
                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;
                    OSWSnum0_15[2] <= OSWSnum0_15[2] + 1;
                    OSWSnum0_15[3] <= OSWSnum0_15[3] + 1;
                end
            end else if(PE_size/size==1)begin
                if(OS_counter0_15 == 4*3+0)begin
                    OSWSnum0_15[0] <= (((round-1)*kernelsize*kernelsize*1)/total_inputmapnum)*(kernelsize**4) + (3)*4*kernelsize*kernelsize;
                end else if(OS_counter0_15 == 4*3+1)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= 0;
                end else if(OS_counter0_15 == 4*3+2)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;                    OSWSnum0_15[2] <= 0;
                end else if(OS_counter0_15 == 4*3+3)begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;                    OSWSnum0_15[2] <= OSWSnum0_15[2] + 1;                    OSWSnum0_15[3] <= 0;
                end else begin
                    OSWSnum0_15[0] <= OSWSnum0_15[0] + 1;
                    OSWSnum0_15[1] <= OSWSnum0_15[1] + 1;
                    OSWSnum0_15[2] <= OSWSnum0_15[2] + 1;
                    OSWSnum0_15[3] <= OSWSnum0_15[3] + 1;
                end
            end        end else begin
            OSWSnum0_15[0] <= 0; OSWSnum0_15[1] <= 0; OSWSnum0_15[2] <= 0; OSWSnum0_15[3] <= 0;
        end
    end
end



logic [15:0]WSISnum0_0[3:0],WSISnum0_1[3:0],WSISnum0_2[3:0],WSISnum0_3[3:0],WSISnum0_4[3:0],WSISnum0_5[3:0],WSISnum0_6[3:0],WSISnum0_7[3:0],WSISnum0_8[3:0],WSISnum0_9[3:0],WSISnum0_10[3:0],WSISnum0_11[3:0],WSISnum0_12[3:0],WSISnum0_13[3:0],WSISnum0_14[3:0],WSISnum0_15[3:0];
always_ff@( posedge clk or posedge rst ) begin // WS 第0個開始的state
    if(rst)begin
        WSISnum0_0[0] <= 0;        WSISnum0_0[1] <= 0;        WSISnum0_0[2] <= 0;        WSISnum0_0[3] <= 0;
    end else if(state0_0) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_0[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_0[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[2] <= WSISnum0_0[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[0] <= WSISnum0_0[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                        WSISnum0_0[2] <= WSISnum0_0[2] + 1; 
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                        WSISnum0_0[0] <= WSISnum0_0[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[0] <= WSISnum0_0[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                        WSISnum0_0[0] <= WSISnum0_0[0] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize;
                    WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                    WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                    WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_0[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_0[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 7*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[2] <= WSISnum0_0[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[0] <= WSISnum0_0[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                        WSISnum0_0[2] <= WSISnum0_0[2] + 1; 
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                        WSISnum0_0[0] <= WSISnum0_0[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[2] <= WSISnum0_0[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[2] <= WSISnum0_0[2] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[0] <= WSISnum0_0[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[0] <= WSISnum0_0[0] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                    WSISnum0_0[3] <= WSISnum0_1[0] + 3;
                    WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                    WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                    WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 12*kernelsize*kernelsize;
                        WSISnum0_0[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 13*kernelsize*kernelsize;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 14*kernelsize*kernelsize;
                        WSISnum0_0[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 15*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[2] <= WSISnum0_0[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[0] <= WSISnum0_0[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                        WSISnum0_0[2] <= WSISnum0_0[2] + 1; 
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                        WSISnum0_0[0] <= WSISnum0_0[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 7*kernelsize*kernelsize;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_0[0] <= WSISnum0_0[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                        WSISnum0_0[0] <= WSISnum0_0[0] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                end
            end
            4:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[0] <= WSISnum0_0[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[0] <= WSISnum0_0[0] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                end
            end
            6:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            8:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            9:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            10:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            11:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            12:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[3] <= WSISnum0_0[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[3] <= WSISnum0_0[3] + 1; 
                    end
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            13:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[2] <= WSISnum0_0[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[2] <= WSISnum0_0[2] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            14:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[1] <= WSISnum0_0[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[1] <= WSISnum0_0[1] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            15:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                        WSISnum0_0[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_0-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_0 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_0[0] <= WSISnum0_0[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_0[0] <= WSISnum0_0[0] + 1; 
                    end
                        WSISnum0_0[3] <= WSISnum0_0[0] + 3;
                        WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                        WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_0 < WS_width*kernelsize + kernelsize -1 && OS_counter0_0 >= WS_width*kernelsize-1)begin
                    WSISnum0_0[3] <= WSISnum0_1[0] + 3;
                    WSISnum0_0[2] <= WSISnum0_0[3] + 3;
                    WSISnum0_0[1] <= WSISnum0_0[2] + 3;
                    WSISnum0_0[0] <= WSISnum0_0[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第1個開始的state
    if(rst)begin
        WSISnum0_1[0] <= 0;        WSISnum0_1[1] <= 0;        WSISnum0_1[2] <= 0;        WSISnum0_1[3] <= 0;
    end else if(state0_1) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_1[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_1[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_1[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[2] <= WSISnum0_1[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[1] <= WSISnum0_1[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[0] <= WSISnum0_1[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                        WSISnum0_1[2] <= WSISnum0_1[2] + 1; 
                        WSISnum0_1[1] <= WSISnum0_1[1] + 1; 
                        WSISnum0_1[0] <= WSISnum0_1[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[1] <= WSISnum0_1[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                        WSISnum0_1[1] <= WSISnum0_1[1] + 1; 
                    end
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[0] <= WSISnum0_1[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                        WSISnum0_1[0] <= WSISnum0_1[0] + 1; 
                    end
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 1*kernelsize*kernelsize;
                    WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                    WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                    WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_1[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_1[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_1[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[2] <= WSISnum0_1[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[1] <= WSISnum0_1[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[0] <= WSISnum0_1[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                        WSISnum0_1[2] <= WSISnum0_1[2] + 1; 
                        WSISnum0_1[1] <= WSISnum0_1[1] + 1; 
                        WSISnum0_1[0] <= WSISnum0_1[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[1] <= WSISnum0_1[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                        WSISnum0_1[1] <= WSISnum0_1[1] + 1; 
                    end
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[0] <= WSISnum0_1[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                        WSISnum0_1[0] <= WSISnum0_1[0] + 1; 
                    end
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize;
                    WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                    WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                    WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_1[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_1[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 10*kernelsize*kernelsize;
                        WSISnum0_1[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 11*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[2] <= WSISnum0_1[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[1] <= WSISnum0_1[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[0] <= WSISnum0_1[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                        WSISnum0_1[2] <= WSISnum0_1[2] + 1; 
                        WSISnum0_1[1] <= WSISnum0_1[1] + 1; 
                        WSISnum0_1[0] <= WSISnum0_1[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_1[1] <= WSISnum0_1[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                        WSISnum0_1[1] <= WSISnum0_1[1] + 1; 
                    end
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[2] <= WSISnum0_1[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[2] <= WSISnum0_1[2] + 1; 
                    end
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                    end
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[1] <= WSISnum0_1[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[1] <= WSISnum0_1[1] + 1; 
                    end
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            8:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[3] <= WSISnum0_1[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[3] <= WSISnum0_1[3] + 1; 
                    end
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            9:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[2] <= WSISnum0_1[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[2] <= WSISnum0_1[2] + 1; 
                    end
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            10:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[1] <= WSISnum0_1[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[1] <= WSISnum0_1[1] + 1; 
                    end
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            11:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                        WSISnum0_1[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_1[0] <= WSISnum0_1[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_1[0] <= WSISnum0_1[0] + 1; 
                    end
                        WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                        WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                        WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                    WSISnum0_1[3] <= WSISnum0_2[0] + 3;
                    WSISnum0_1[2] <= WSISnum0_1[3] + 3;
                    WSISnum0_1[1] <= WSISnum0_1[2] + 3;
                    WSISnum0_1[0] <= WSISnum0_1[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第2個開始的state
    if(rst)begin
        WSISnum0_2[0] <= 0;        WSISnum0_2[1] <= 0;        WSISnum0_2[2] <= 0;        WSISnum0_2[3] <= 0;
    end else if(state0_2) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_2[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_2[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[2] <= WSISnum0_2[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[0] <= WSISnum0_2[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                        WSISnum0_2[2] <= WSISnum0_2[2] + 1; 
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                        WSISnum0_2[0] <= WSISnum0_2[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                    end
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[0] <= WSISnum0_2[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                        WSISnum0_2[0] <= WSISnum0_2[0] + 1; 
                    end
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 2*kernelsize*kernelsize;
                    WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                    WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                    WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_2[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_2[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 7*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[2] <= WSISnum0_2[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[0] <= WSISnum0_2[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                        WSISnum0_2[2] <= WSISnum0_2[2] + 1; 
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                        WSISnum0_2[0] <= WSISnum0_2[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                    end
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                    end
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                    end
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[2] <= WSISnum0_2[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[2] <= WSISnum0_2[2] + 1; 
                    end
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                    end
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[0] <= WSISnum0_2[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[0] <= WSISnum0_2[0] + 1; 
                    end
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                    WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                    WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                    WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                    WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_2[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_2[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 7*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[2] <= WSISnum0_2[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[0] <= WSISnum0_2[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                        WSISnum0_2[2] <= WSISnum0_2[2] + 1; 
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                        WSISnum0_2[0] <= WSISnum0_2[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                    end
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                    end
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[3] <= WSISnum0_2[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[3] <= WSISnum0_2[3] + 1; 
                    end
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[2] <= WSISnum0_2[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[2] <= WSISnum0_2[2] + 1; 
                    end
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[1] <= WSISnum0_2[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[1] <= WSISnum0_2[1] + 1; 
                    end
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                        WSISnum0_2[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_2-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_2[0] <= WSISnum0_2[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_2[0] <= WSISnum0_2[0] + 1; 
                    end
                        WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                        WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                        WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                    WSISnum0_2[3] <= WSISnum0_3[0] + 3;
                    WSISnum0_2[2] <= WSISnum0_2[3] + 3;
                    WSISnum0_2[1] <= WSISnum0_2[2] + 3;
                    WSISnum0_2[0] <= WSISnum0_2[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第3個開始的state
    if(rst)begin
        WSISnum0_3[0] <= 0;        WSISnum0_3[1] <= 0;        WSISnum0_3[2] <= 0;        WSISnum0_3[3] <= 0;
    end else if(state0_3) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_3[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_3[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[2] <= WSISnum0_3[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[1] <= WSISnum0_3[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[0] <= WSISnum0_3[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[2] <= WSISnum0_3[2] + 1; 
                        WSISnum0_3[1] <= WSISnum0_3[1] + 1; 
                        WSISnum0_3[0] <= WSISnum0_3[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_3[0] <= WSISnum0_3[1] + 3;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[1] <= WSISnum0_3[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[1] <= WSISnum0_3[1] + 1; 
                    end
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[0] <= WSISnum0_3[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                        WSISnum0_3[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[0] <= WSISnum0_3[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[0] <= WSISnum0_3[0] + 1; 
                    end
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 3*kernelsize*kernelsize;
                    WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                    WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                    WSISnum0_3[0] <= WSISnum0_3[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_3[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_3[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[2] <= WSISnum0_3[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[1] <= WSISnum0_3[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[0] <= WSISnum0_3[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[2] <= WSISnum0_3[2] + 1; 
                        WSISnum0_3[1] <= WSISnum0_3[1] + 1; 
                        WSISnum0_3[0] <= WSISnum0_3[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_3[0] <= WSISnum0_3[1] + 3;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[1] <= WSISnum0_3[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[1] <= WSISnum0_3[1] + 1; 
                    end
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[0] <= WSISnum0_3[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                        WSISnum0_3[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[0] <= WSISnum0_3[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[0] <= WSISnum0_3[0] + 1; 
                    end
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize;
                    WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                    WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                    WSISnum0_3[0] <= WSISnum0_3[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_3[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_3[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[2] <= WSISnum0_3[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[1] <= WSISnum0_3[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[0] <= WSISnum0_3[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[2] <= WSISnum0_3[2] + 1; 
                        WSISnum0_3[1] <= WSISnum0_3[1] + 1; 
                        WSISnum0_3[0] <= WSISnum0_3[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_3[0] <= WSISnum0_3[1] + 3;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[1] <= WSISnum0_3[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[1] <= WSISnum0_3[1] + 1; 
                    end
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[0] <= WSISnum0_3[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                        WSISnum0_3[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_3[3] <= WSISnum0_3[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_3[0] <= WSISnum0_3[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_3[3] <= WSISnum0_3[3] + 1; 
                        WSISnum0_3[0] <= WSISnum0_3[0] + 1; 
                    end
                        WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                        WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_3[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize;
                    WSISnum0_3[2] <= WSISnum0_3[3] + 3;
                    WSISnum0_3[1] <= WSISnum0_3[2] + 3;
                    WSISnum0_3[0] <= WSISnum0_3[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第4個開始的state
    if(rst)begin
        WSISnum0_4[0] <= 0;        WSISnum0_4[1] <= 0;        WSISnum0_4[2] <= 0;        WSISnum0_4[3] <= 0;
    end else if(state0_4) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_4 < WS_width*kernelsize + kernelsize -1 && OS_counter0_4 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_4[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_4[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_4[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_4 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[2] <= WSISnum0_4[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[1] <= WSISnum0_4[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[0] <= WSISnum0_4[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                        WSISnum0_4[2] <= WSISnum0_4[2] + 1; 
                        WSISnum0_4[1] <= WSISnum0_4[1] + 1; 
                        WSISnum0_4[0] <= WSISnum0_4[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_4 < WS_width*kernelsize + kernelsize -1 && OS_counter0_4 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_4 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[1] <= WSISnum0_4[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                        WSISnum0_4[1] <= WSISnum0_4[1] + 1; 
                    end
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_4 < WS_width*kernelsize + kernelsize -1 && OS_counter0_4 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_4 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[0] <= WSISnum0_4[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                        WSISnum0_4[0] <= WSISnum0_4[0] + 1; 
                    end
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_4 < WS_width*kernelsize + kernelsize -1 && OS_counter0_4 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 4*kernelsize*kernelsize;
                    WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                    WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                    WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 7*kernelsize*kernelsize;
                        WSISnum0_4[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_4[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_4[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 10*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[2] <= WSISnum0_4[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[1] <= WSISnum0_4[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[0] <= WSISnum0_4[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                        WSISnum0_4[2] <= WSISnum0_4[2] + 1; 
                        WSISnum0_4[1] <= WSISnum0_4[1] + 1; 
                        WSISnum0_4[0] <= WSISnum0_4[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[1] <= WSISnum0_4[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                        WSISnum0_4[1] <= WSISnum0_4[1] + 1; 
                    end
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[0] <= WSISnum0_4[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                        WSISnum0_4[0] <= WSISnum0_4[0] + 1; 
                    end
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_4 < WS_width*kernelsize + kernelsize -1 && OS_counter0_4 >= WS_width*kernelsize-1)begin
                    WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_1-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                    WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                    WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                    WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 23*kernelsize*kernelsize;
                        WSISnum0_4[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 24*kernelsize*kernelsize;
                        WSISnum0_4[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 25*kernelsize*kernelsize;
                        WSISnum0_4[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 26*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[2] <= WSISnum0_4[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[1] <= WSISnum0_4[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[0] <= WSISnum0_4[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                        WSISnum0_4[2] <= WSISnum0_4[2] + 1; 
                        WSISnum0_4[1] <= WSISnum0_4[1] + 1; 
                        WSISnum0_4[0] <= WSISnum0_4[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 10*kernelsize*kernelsize;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 11*kernelsize*kernelsize;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_4[1] <= WSISnum0_4[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                        WSISnum0_4[1] <= WSISnum0_4[1] + 1; 
                    end
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[2] <= WSISnum0_4[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[2] <= WSISnum0_4[2] + 1; 
                    end
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                    end
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[1] <= WSISnum0_4[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[1] <= WSISnum0_4[1] + 1; 
                    end
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            8:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[3] <= WSISnum0_4[3] + 1; 
                    end
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            9:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[2] <= WSISnum0_4[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[2] <= WSISnum0_4[2] + 1; 
                    end
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            10:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[1] <= WSISnum0_4[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[1] <= WSISnum0_4[1] + 1; 
                    end
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            11:begin
                if(OS_counter0_1 < WS_width*kernelsize + kernelsize -1 && OS_counter0_1 >= WS_width*kernelsize-1)begin
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                        WSISnum0_4[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_4-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_1 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_4[0] <= WSISnum0_4[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_4[0] <= WSISnum0_4[0] + 1; 
                    end
                        WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                        WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                        WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_4 < WS_width*kernelsize + kernelsize -1 && OS_counter0_4 >= WS_width*kernelsize-1)begin
                    WSISnum0_4[3] <= WSISnum0_8[0] + 3;
                    WSISnum0_4[2] <= WSISnum0_4[3] + 3;
                    WSISnum0_4[1] <= WSISnum0_4[2] + 3;
                    WSISnum0_4[0] <= WSISnum0_4[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第5個開始的state
    if(rst)begin
        WSISnum0_5[0] <= 0;        WSISnum0_5[1] <= 0;        WSISnum0_5[2] <= 0;        WSISnum0_5[3] <= 0;
    end else if(state0_5) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_5[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_5[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_5[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[2] <= WSISnum0_5[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[1] <= WSISnum0_5[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[0] <= WSISnum0_5[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                        WSISnum0_5[2] <= WSISnum0_5[2] + 1; 
                        WSISnum0_5[1] <= WSISnum0_5[1] + 1; 
                        WSISnum0_5[0] <= WSISnum0_5[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[1] <= WSISnum0_5[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                        WSISnum0_5[1] <= WSISnum0_5[1] + 1; 
                    end
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[0] <= WSISnum0_5[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                        WSISnum0_5[0] <= WSISnum0_5[0] + 1; 
                    end
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 5*kernelsize*kernelsize;
                    WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                    WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                    WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_5[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_5[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_5[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[2] <= WSISnum0_5[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[1] <= WSISnum0_5[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[0] <= WSISnum0_5[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                        WSISnum0_5[2] <= WSISnum0_5[2] + 1; 
                        WSISnum0_5[1] <= WSISnum0_5[1] + 1; 
                        WSISnum0_5[0] <= WSISnum0_5[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[1] <= WSISnum0_5[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                        WSISnum0_5[1] <= WSISnum0_5[1] + 1; 
                    end
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[0] <= WSISnum0_5[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                        WSISnum0_5[0] <= WSISnum0_5[0] + 1; 
                    end
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize;
                    WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                    WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                    WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_5[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_5[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 10*kernelsize*kernelsize;
                        WSISnum0_5[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 11*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[2] <= WSISnum0_5[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[1] <= WSISnum0_5[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[0] <= WSISnum0_5[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                        WSISnum0_5[2] <= WSISnum0_5[2] + 1; 
                        WSISnum0_5[1] <= WSISnum0_5[1] + 1; 
                        WSISnum0_5[0] <= WSISnum0_5[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_5[1] <= WSISnum0_5[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                        WSISnum0_5[1] <= WSISnum0_5[1] + 1; 
                    end
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[2] <= WSISnum0_5[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[2] <= WSISnum0_5[2] + 1; 
                    end
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                    end
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[1] <= WSISnum0_5[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[1] <= WSISnum0_5[1] + 1; 
                    end
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            8:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[3] <= WSISnum0_5[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[3] <= WSISnum0_5[3] + 1; 
                    end
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            9:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[2] <= WSISnum0_5[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[2] <= WSISnum0_5[2] + 1; 
                    end
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            10:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[1] <= WSISnum0_5[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[1] <= WSISnum0_5[1] + 1; 
                    end
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            11:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                        WSISnum0_5[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_5-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_5 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_5[0] <= WSISnum0_5[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_5[0] <= WSISnum0_5[0] + 1; 
                    end
                        WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                        WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                        WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_5 < WS_width*kernelsize + kernelsize -1 && OS_counter0_5 >= WS_width*kernelsize-1)begin
                    WSISnum0_5[3] <= WSISnum0_6[0] + 3;
                    WSISnum0_5[2] <= WSISnum0_5[3] + 3;
                    WSISnum0_5[1] <= WSISnum0_5[2] + 3;
                    WSISnum0_5[0] <= WSISnum0_5[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第6個開始的state
    if(rst)begin
        WSISnum0_6[0] <= 0;        WSISnum0_6[1] <= 0;        WSISnum0_6[2] <= 0;        WSISnum0_6[3] <= 0;
    end else if(state0_6) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_6[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_6[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_6[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[2] <= WSISnum0_6[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[1] <= WSISnum0_6[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[0] <= WSISnum0_6[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                        WSISnum0_6[2] <= WSISnum0_6[2] + 1; 
                        WSISnum0_6[1] <= WSISnum0_6[1] + 1; 
                        WSISnum0_6[0] <= WSISnum0_6[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[1] <= WSISnum0_6[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                        WSISnum0_6[1] <= WSISnum0_6[1] + 1; 
                    end
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                        WSISnum0_6[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[0] <= WSISnum0_6[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                        WSISnum0_6[0] <= WSISnum0_6[0] + 1; 
                    end
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 6*kernelsize*kernelsize;
                    WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                    WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                    WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 7*kernelsize*kernelsize;
                        WSISnum0_6[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_6[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_6[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 10*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[2] <= WSISnum0_6[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[1] <= WSISnum0_6[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[0] <= WSISnum0_6[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                        WSISnum0_6[2] <= WSISnum0_6[2] + 1; 
                        WSISnum0_6[1] <= WSISnum0_6[1] + 1; 
                        WSISnum0_6[0] <= WSISnum0_6[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[1] <= WSISnum0_6[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                        WSISnum0_6[1] <= WSISnum0_6[1] + 1; 
                    end
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                        WSISnum0_6[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[0] <= WSISnum0_6[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                        WSISnum0_6[0] <= WSISnum0_6[0] + 1; 
                    end
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                    WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                    WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                    WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                    WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_6[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_6[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_6[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 7*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[2] <= WSISnum0_6[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[1] <= WSISnum0_6[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[0] <= WSISnum0_6[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                        WSISnum0_6[2] <= WSISnum0_6[2] + 1; 
                        WSISnum0_6[1] <= WSISnum0_6[1] + 1; 
                        WSISnum0_6[0] <= WSISnum0_6[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_6[1] <= WSISnum0_6[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                        WSISnum0_6[1] <= WSISnum0_6[1] + 1; 
                    end
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[1] <= WSISnum0_6[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[1] <= WSISnum0_6[1] + 1; 
                    end
                        WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[3] <= WSISnum0_6[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[3] <= WSISnum0_6[3] + 1; 
                    end
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                        WSISnum0_6[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[2] <= WSISnum0_6[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[2] <= WSISnum0_6[2] + 1; 
                    end
                        WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[1] <= WSISnum0_6[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[1] <= WSISnum0_6[1] + 1; 
                    end
                        WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                        WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                        WSISnum0_6[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_6-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_6 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_6[0] <= WSISnum0_6[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_6[0] <= WSISnum0_6[0] + 1; 
                    end
                        WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                        WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                        WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_6 < WS_width*kernelsize + kernelsize -1 && OS_counter0_6 >= WS_width*kernelsize-1)begin
                    WSISnum0_6[3] <= WSISnum0_7[0] + 3;
                    WSISnum0_6[2] <= WSISnum0_6[3] + 3;
                    WSISnum0_6[1] <= WSISnum0_6[2] + 3;
                    WSISnum0_6[0] <= WSISnum0_6[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第7個開始的state
    if(rst)begin
        WSISnum0_7[0] <= 0;        WSISnum0_7[1] <= 0;        WSISnum0_7[2] <= 0;        WSISnum0_7[3] <= 0;
    end else if(state0_7) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_7[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_7[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[2] <= WSISnum0_7[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[1] <= WSISnum0_7[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[0] <= WSISnum0_7[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[2] <= WSISnum0_7[2] + 1; 
                        WSISnum0_7[1] <= WSISnum0_7[1] + 1; 
                        WSISnum0_7[0] <= WSISnum0_7[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_7[0] <= WSISnum0_7[1] + 3;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[1] <= WSISnum0_7[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[1] <= WSISnum0_7[1] + 1; 
                    end
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[0] <= WSISnum0_7[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                        WSISnum0_7[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[0] <= WSISnum0_7[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[0] <= WSISnum0_7[0] + 1; 
                    end
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 7*kernelsize*kernelsize;
                    WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                    WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                    WSISnum0_7[0] <= WSISnum0_7[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_7[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_7[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[2] <= WSISnum0_7[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[1] <= WSISnum0_7[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[0] <= WSISnum0_7[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[2] <= WSISnum0_7[2] + 1; 
                        WSISnum0_7[1] <= WSISnum0_7[1] + 1; 
                        WSISnum0_7[0] <= WSISnum0_7[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_7[0] <= WSISnum0_7[1] + 3;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[1] <= WSISnum0_7[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[1] <= WSISnum0_7[1] + 1; 
                    end
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[0] <= WSISnum0_7[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                        WSISnum0_7[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[0] <= WSISnum0_7[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[0] <= WSISnum0_7[0] + 1; 
                    end
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 1*kernelsize*kernelsize;
                    WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                    WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                    WSISnum0_7[0] <= WSISnum0_7[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_7[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_7[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[2] <= WSISnum0_7[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[1] <= WSISnum0_7[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[0] <= WSISnum0_7[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[2] <= WSISnum0_7[2] + 1; 
                        WSISnum0_7[1] <= WSISnum0_7[1] + 1; 
                        WSISnum0_7[0] <= WSISnum0_7[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_7[0] <= WSISnum0_7[1] + 3;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[1] <= WSISnum0_7[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[1] <= WSISnum0_7[1] + 1; 
                    end
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[0] <= WSISnum0_7[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                        WSISnum0_7[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_7 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_7[3] <= WSISnum0_7[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_7[0] <= WSISnum0_7[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_7[3] <= WSISnum0_7[3] + 1; 
                        WSISnum0_7[0] <= WSISnum0_7[0] + 1; 
                    end
                        WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                        WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_7 < WS_width*kernelsize + kernelsize -1 && OS_counter0_7 >= WS_width*kernelsize-1)begin
                        WSISnum0_7[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_7-WS_width*kernelsize+1 + 0*kernelsize*kernelsize;
                    WSISnum0_7[2] <= WSISnum0_7[3] + 3;
                    WSISnum0_7[1] <= WSISnum0_7[2] + 3;
                    WSISnum0_7[0] <= WSISnum0_7[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第8個開始的state
    if(rst)begin
        WSISnum0_8[0] <= 0;        WSISnum0_8[1] <= 0;        WSISnum0_8[2] <= 0;        WSISnum0_8[3] <= 0;
    end else if(state0_8) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_8[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_8[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[2] <= WSISnum0_8[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[1] <= WSISnum0_8[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[0] <= WSISnum0_8[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                        WSISnum0_8[2] <= WSISnum0_8[2] + 1; 
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                        WSISnum0_8[0] <= WSISnum0_8[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[1] <= WSISnum0_8[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                    end
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[0] <= WSISnum0_8[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                        WSISnum0_8[0] <= WSISnum0_8[0] + 1; 
                    end
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 8*kernelsize*kernelsize;
                    WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                    WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                    WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_8[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_8[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 7*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[2] <= WSISnum0_8[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[1] <= WSISnum0_8[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[0] <= WSISnum0_8[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                        WSISnum0_8[2] <= WSISnum0_8[2] + 1; 
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                        WSISnum0_8[0] <= WSISnum0_8[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[1] <= WSISnum0_8[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                    end
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[1] <= WSISnum0_8[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                    end
                        WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                    end
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                        WSISnum0_8[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[2] <= WSISnum0_8[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[2] <= WSISnum0_8[2] + 1; 
                    end
                        WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[1] <= WSISnum0_8[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                    end
                        WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_8 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[0] <= WSISnum0_8[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[0] <= WSISnum0_8[0] + 1; 
                    end
                        WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                    WSISnum0_8[3] <= WSISnum0_9[0] + 3;
                    WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                    WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                    WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 19*kernelsize*kernelsize;
                        WSISnum0_8[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 20*kernelsize*kernelsize;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 21*kernelsize*kernelsize;
                        WSISnum0_8[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 22*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[2] <= WSISnum0_8[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[1] <= WSISnum0_8[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[0] <= WSISnum0_8[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                        WSISnum0_8[2] <= WSISnum0_8[2] + 1; 
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                        WSISnum0_8[0] <= WSISnum0_8[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_8[1] <= WSISnum0_8[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                    end
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[1] <= WSISnum0_8[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                    end
                        WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[3] <= WSISnum0_8[3] + 1; 
                    end
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                        WSISnum0_8[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[2] <= WSISnum0_8[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[2] <= WSISnum0_8[2] + 1; 
                    end
                        WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[1] <= WSISnum0_8[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[1] <= WSISnum0_8[1] + 1; 
                    end
                        WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_2 < WS_width*kernelsize + kernelsize -1 && OS_counter0_2 >= WS_width*kernelsize-1)begin
                        WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                        WSISnum0_8[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_8-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_2 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_8[0] <= WSISnum0_8[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_8[0] <= WSISnum0_8[0] + 1; 
                    end
                        WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                        WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                        WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_8 < WS_width*kernelsize + kernelsize -1 && OS_counter0_8 >= WS_width*kernelsize-1)begin
                    WSISnum0_8[3] <= WSISnum0_12[0] + 3;
                    WSISnum0_8[2] <= WSISnum0_8[3] + 3;
                    WSISnum0_8[1] <= WSISnum0_8[2] + 3;
                    WSISnum0_8[0] <= WSISnum0_8[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第9個開始的state
    if(rst)begin
        WSISnum0_9[0] <= 0;        WSISnum0_9[1] <= 0;        WSISnum0_9[2] <= 0;        WSISnum0_9[3] <= 0;
    end else if(state0_9) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_9[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_9[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_9[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[2] <= WSISnum0_9[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[1] <= WSISnum0_9[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[0] <= WSISnum0_9[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                        WSISnum0_9[2] <= WSISnum0_9[2] + 1; 
                        WSISnum0_9[1] <= WSISnum0_9[1] + 1; 
                        WSISnum0_9[0] <= WSISnum0_9[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[1] <= WSISnum0_9[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                        WSISnum0_9[1] <= WSISnum0_9[1] + 1; 
                    end
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[0] <= WSISnum0_9[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                        WSISnum0_9[0] <= WSISnum0_9[0] + 1; 
                    end
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 9*kernelsize*kernelsize;
                    WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                    WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                    WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_9[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_9[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_9[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[2] <= WSISnum0_9[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[1] <= WSISnum0_9[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[0] <= WSISnum0_9[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                        WSISnum0_9[2] <= WSISnum0_9[2] + 1; 
                        WSISnum0_9[1] <= WSISnum0_9[1] + 1; 
                        WSISnum0_9[0] <= WSISnum0_9[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[1] <= WSISnum0_9[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                        WSISnum0_9[1] <= WSISnum0_9[1] + 1; 
                    end
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[0] <= WSISnum0_9[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                        WSISnum0_9[0] <= WSISnum0_9[0] + 1; 
                    end
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize;
                    WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                    WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                    WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_9[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_9[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 10*kernelsize*kernelsize;
                        WSISnum0_9[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 11*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[2] <= WSISnum0_9[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[1] <= WSISnum0_9[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[0] <= WSISnum0_9[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                        WSISnum0_9[2] <= WSISnum0_9[2] + 1; 
                        WSISnum0_9[1] <= WSISnum0_9[1] + 1; 
                        WSISnum0_9[0] <= WSISnum0_9[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_9[1] <= WSISnum0_9[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                        WSISnum0_9[1] <= WSISnum0_9[1] + 1; 
                    end
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[2] <= WSISnum0_9[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[2] <= WSISnum0_9[2] + 1; 
                    end
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                    end
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[1] <= WSISnum0_9[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[1] <= WSISnum0_9[1] + 1; 
                    end
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            8:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[3] <= WSISnum0_9[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[3] <= WSISnum0_9[3] + 1; 
                    end
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            9:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[2] <= WSISnum0_9[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[2] <= WSISnum0_9[2] + 1; 
                    end
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            10:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[1] <= WSISnum0_9[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[1] <= WSISnum0_9[1] + 1; 
                    end
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            11:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                        WSISnum0_9[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_9[0] <= WSISnum0_9[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_9[0] <= WSISnum0_9[0] + 1; 
                    end
                        WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                        WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                        WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                    WSISnum0_9[3] <= WSISnum0_10[0] + 3;
                    WSISnum0_9[2] <= WSISnum0_9[3] + 3;
                    WSISnum0_9[1] <= WSISnum0_9[2] + 3;
                    WSISnum0_9[0] <= WSISnum0_9[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第10個開始的state
    if(rst)begin
        WSISnum0_10[0] <= 0;        WSISnum0_10[1] <= 0;        WSISnum0_10[2] <= 0;        WSISnum0_10[3] <= 0;
    end else if(state0_10) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_10[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_10[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[2] <= WSISnum0_10[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[0] <= WSISnum0_10[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                        WSISnum0_10[2] <= WSISnum0_10[2] + 1; 
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                        WSISnum0_10[0] <= WSISnum0_10[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                    end
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[0] <= WSISnum0_10[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                        WSISnum0_10[0] <= WSISnum0_10[0] + 1; 
                    end
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 10*kernelsize*kernelsize;
                    WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                    WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                    WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_10[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_10[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 7*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[2] <= WSISnum0_10[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[0] <= WSISnum0_10[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                        WSISnum0_10[2] <= WSISnum0_10[2] + 1; 
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                        WSISnum0_10[0] <= WSISnum0_10[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                    end
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                    end
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                    end
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[2] <= WSISnum0_10[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[2] <= WSISnum0_10[2] + 1; 
                    end
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                    end
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[0] <= WSISnum0_10[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[0] <= WSISnum0_10[0] + 1; 
                    end
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                    WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                    WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                    WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                    WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_10[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_10[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 7*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[2] <= WSISnum0_10[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[0] <= WSISnum0_10[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                        WSISnum0_10[2] <= WSISnum0_10[2] + 1; 
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                        WSISnum0_10[0] <= WSISnum0_10[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                    end
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                    end
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[3] <= WSISnum0_10[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[3] <= WSISnum0_10[3] + 1; 
                    end
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[2] <= WSISnum0_10[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[2] <= WSISnum0_10[2] + 1; 
                    end
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[1] <= WSISnum0_10[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[1] <= WSISnum0_10[1] + 1; 
                    end
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                        WSISnum0_10[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_10-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_10 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_10[0] <= WSISnum0_10[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_10[0] <= WSISnum0_10[0] + 1; 
                    end
                        WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                        WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                        WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_10 < WS_width*kernelsize + kernelsize -1 && OS_counter0_10 >= WS_width*kernelsize-1)begin
                    WSISnum0_10[3] <= WSISnum0_11[0] + 3;
                    WSISnum0_10[2] <= WSISnum0_10[3] + 3;
                    WSISnum0_10[1] <= WSISnum0_10[2] + 3;
                    WSISnum0_10[0] <= WSISnum0_10[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第11個開始的state
    if(rst)begin
        WSISnum0_11[0] <= 0;        WSISnum0_11[1] <= 0;        WSISnum0_11[2] <= 0;        WSISnum0_11[3] <= 0;
    end else if(state0_11) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_11[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_11[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[2] <= WSISnum0_11[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[1] <= WSISnum0_11[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[0] <= WSISnum0_11[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[2] <= WSISnum0_11[2] + 1; 
                        WSISnum0_11[1] <= WSISnum0_11[1] + 1; 
                        WSISnum0_11[0] <= WSISnum0_11[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_11[0] <= WSISnum0_11[1] + 3;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[1] <= WSISnum0_11[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[1] <= WSISnum0_11[1] + 1; 
                    end
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[0] <= WSISnum0_11[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                        WSISnum0_11[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[0] <= WSISnum0_11[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[0] <= WSISnum0_11[0] + 1; 
                    end
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 11*kernelsize*kernelsize;
                    WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                    WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                    WSISnum0_11[0] <= WSISnum0_11[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_11[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_11[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[2] <= WSISnum0_11[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[1] <= WSISnum0_11[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[0] <= WSISnum0_11[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[2] <= WSISnum0_11[2] + 1; 
                        WSISnum0_11[1] <= WSISnum0_11[1] + 1; 
                        WSISnum0_11[0] <= WSISnum0_11[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_11[0] <= WSISnum0_11[1] + 3;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[1] <= WSISnum0_11[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[1] <= WSISnum0_11[1] + 1; 
                    end
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[0] <= WSISnum0_11[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                        WSISnum0_11[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[0] <= WSISnum0_11[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[0] <= WSISnum0_11[0] + 1; 
                    end
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize;
                    WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                    WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                    WSISnum0_11[0] <= WSISnum0_11[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_11[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_11[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[2] <= WSISnum0_11[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[1] <= WSISnum0_11[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[0] <= WSISnum0_11[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[2] <= WSISnum0_11[2] + 1; 
                        WSISnum0_11[1] <= WSISnum0_11[1] + 1; 
                        WSISnum0_11[0] <= WSISnum0_11[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_11[0] <= WSISnum0_11[1] + 3;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[1] <= WSISnum0_11[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[1] <= WSISnum0_11[1] + 1; 
                    end
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[0] <= WSISnum0_11[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                        WSISnum0_11[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_11[3] <= WSISnum0_11[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_11[0] <= WSISnum0_11[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_11[3] <= WSISnum0_11[3] + 1; 
                        WSISnum0_11[0] <= WSISnum0_11[0] + 1; 
                    end
                        WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                        WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_11[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 0*kernelsize*kernelsize;
                    WSISnum0_11[2] <= WSISnum0_11[3] + 3;
                    WSISnum0_11[1] <= WSISnum0_11[2] + 3;
                    WSISnum0_11[0] <= WSISnum0_11[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第12個開始的state
    if(rst)begin
        WSISnum0_12[0] <= 0;        WSISnum0_12[1] <= 0;        WSISnum0_12[2] <= 0;        WSISnum0_12[3] <= 0;
    end else if(state0_12) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_12 < WS_width*kernelsize + kernelsize -1 && OS_counter0_12 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_12[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_12[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_12[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_12 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[2] <= WSISnum0_12[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[1] <= WSISnum0_12[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[0] <= WSISnum0_12[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[2] <= WSISnum0_12[2] + 1; 
                        WSISnum0_12[1] <= WSISnum0_12[1] + 1; 
                        WSISnum0_12[0] <= WSISnum0_12[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_12 < WS_width*kernelsize + kernelsize -1 && OS_counter0_12 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_12[0] <= WSISnum0_12[1] + 3;

                end else begin
                    if((OS_counter0_12 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[1] <= WSISnum0_12[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[1] <= WSISnum0_12[1] + 1; 
                    end
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[0] <= WSISnum0_12[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_12 < WS_width*kernelsize + kernelsize -1 && OS_counter0_12 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                        WSISnum0_12[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_12 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[0] <= WSISnum0_12[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[0] <= WSISnum0_12[0] + 1; 
                    end
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_12 < WS_width*kernelsize + kernelsize -1 && OS_counter0_12 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 12*kernelsize*kernelsize;
                    WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                    WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                    WSISnum0_12[0] <= WSISnum0_12[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 7*kernelsize*kernelsize;
                        WSISnum0_12[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_12[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_12[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 10*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[2] <= WSISnum0_12[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[1] <= WSISnum0_12[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[0] <= WSISnum0_12[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[2] <= WSISnum0_12[2] + 1; 
                        WSISnum0_12[1] <= WSISnum0_12[1] + 1; 
                        WSISnum0_12[0] <= WSISnum0_12[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_12[0] <= WSISnum0_12[1] + 3;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[1] <= WSISnum0_12[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[1] <= WSISnum0_12[1] + 1; 
                    end
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[0] <= WSISnum0_12[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_9 < WS_width*kernelsize + kernelsize -1 && OS_counter0_9 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                        WSISnum0_12[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_9 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[0] <= WSISnum0_12[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[0] <= WSISnum0_12[0] + 1; 
                    end
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_12 < WS_width*kernelsize + kernelsize -1 && OS_counter0_12 >= WS_width*kernelsize-1)begin
                    WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_9-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                    WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                    WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                    WSISnum0_12[0] <= WSISnum0_12[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 15*kernelsize*kernelsize;
                        WSISnum0_12[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 16*kernelsize*kernelsize;
                        WSISnum0_12[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 17*kernelsize*kernelsize;
                        WSISnum0_12[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 18*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[2] <= WSISnum0_12[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[1] <= WSISnum0_12[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[0] <= WSISnum0_12[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[2] <= WSISnum0_12[2] + 1; 
                        WSISnum0_12[1] <= WSISnum0_12[1] + 1; 
                        WSISnum0_12[0] <= WSISnum0_12[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 7*kernelsize*kernelsize;
                        WSISnum0_12[0] <= WSISnum0_12[1] + 3;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[1] <= WSISnum0_12[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[1] <= WSISnum0_12[1] + 1; 
                    end
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[0] <= WSISnum0_12[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_3 < WS_width*kernelsize + kernelsize -1 && OS_counter0_3 >= WS_width*kernelsize-1)begin
                        WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                        WSISnum0_12[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_12-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_3 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_12[0] <= WSISnum0_12[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_12[3] <= WSISnum0_12[3] + 1; 
                        WSISnum0_12[0] <= WSISnum0_12[0] + 1; 
                    end
                        WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                        WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_12 < WS_width*kernelsize + kernelsize -1 && OS_counter0_12 >= WS_width*kernelsize-1)begin
                    WSISnum0_12[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_3-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                    WSISnum0_12[2] <= WSISnum0_12[3] + 3;
                    WSISnum0_12[1] <= WSISnum0_12[2] + 3;
                    WSISnum0_12[0] <= WSISnum0_12[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第13個開始的state
    if(rst)begin
        WSISnum0_13[0] <= 0;        WSISnum0_13[1] <= 0;        WSISnum0_13[2] <= 0;        WSISnum0_13[3] <= 0;
    end else if(state0_13) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_13[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_13[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_13[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[2] <= WSISnum0_13[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[1] <= WSISnum0_13[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[0] <= WSISnum0_13[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                        WSISnum0_13[2] <= WSISnum0_13[2] + 1; 
                        WSISnum0_13[1] <= WSISnum0_13[1] + 1; 
                        WSISnum0_13[0] <= WSISnum0_13[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[1] <= WSISnum0_13[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                        WSISnum0_13[1] <= WSISnum0_13[1] + 1; 
                    end
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[0] <= WSISnum0_13[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                        WSISnum0_13[0] <= WSISnum0_13[0] + 1; 
                    end
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 13*kernelsize*kernelsize;
                    WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                    WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                    WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_13[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_13[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_13[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[2] <= WSISnum0_13[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[1] <= WSISnum0_13[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[0] <= WSISnum0_13[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                        WSISnum0_13[2] <= WSISnum0_13[2] + 1; 
                        WSISnum0_13[1] <= WSISnum0_13[1] + 1; 
                        WSISnum0_13[0] <= WSISnum0_13[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[1] <= WSISnum0_13[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                        WSISnum0_13[1] <= WSISnum0_13[1] + 1; 
                    end
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[0] <= WSISnum0_13[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                        WSISnum0_13[0] <= WSISnum0_13[0] + 1; 
                    end
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 2*kernelsize*kernelsize;
                    WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                    WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                    WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_13[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_13[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 10*kernelsize*kernelsize;
                        WSISnum0_13[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 11*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[2] <= WSISnum0_13[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[1] <= WSISnum0_13[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[0] <= WSISnum0_13[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                        WSISnum0_13[2] <= WSISnum0_13[2] + 1; 
                        WSISnum0_13[1] <= WSISnum0_13[1] + 1; 
                        WSISnum0_13[0] <= WSISnum0_13[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_13[1] <= WSISnum0_13[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                        WSISnum0_13[1] <= WSISnum0_13[1] + 1; 
                    end
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[2] <= WSISnum0_13[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[2] <= WSISnum0_13[2] + 1; 
                    end
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                    end
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[1] <= WSISnum0_13[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[1] <= WSISnum0_13[1] + 1; 
                    end
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                    end else begin
                    end
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            8:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[3] <= WSISnum0_13[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[3] <= WSISnum0_13[3] + 1; 
                    end
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            9:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[2] <= WSISnum0_13[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[2] <= WSISnum0_13[2] + 1; 
                    end
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            10:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[1] <= WSISnum0_13[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[1] <= WSISnum0_13[1] + 1; 
                    end
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            11:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                        WSISnum0_13[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_13-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_13 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_13[0] <= WSISnum0_13[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_13[0] <= WSISnum0_13[0] + 1; 
                    end
                        WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                        WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                        WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_13 < WS_width*kernelsize + kernelsize -1 && OS_counter0_13 >= WS_width*kernelsize-1)begin
                    WSISnum0_13[3] <= WSISnum0_14[0] + 3;
                    WSISnum0_13[2] <= WSISnum0_13[3] + 3;
                    WSISnum0_13[1] <= WSISnum0_13[2] + 3;
                    WSISnum0_13[0] <= WSISnum0_13[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第14個開始的state
    if(rst)begin
        WSISnum0_14[0] <= 0;        WSISnum0_14[1] <= 0;        WSISnum0_14[2] <= 0;        WSISnum0_14[3] <= 0;
    end else if(state0_14) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_14[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_14[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_14[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[2] <= WSISnum0_14[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[1] <= WSISnum0_14[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[0] <= WSISnum0_14[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                        WSISnum0_14[2] <= WSISnum0_14[2] + 1; 
                        WSISnum0_14[1] <= WSISnum0_14[1] + 1; 
                        WSISnum0_14[0] <= WSISnum0_14[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[1] <= WSISnum0_14[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                        WSISnum0_14[1] <= WSISnum0_14[1] + 1; 
                    end
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                        WSISnum0_14[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[0] <= WSISnum0_14[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                        WSISnum0_14[0] <= WSISnum0_14[0] + 1; 
                    end
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 14*kernelsize*kernelsize;
                    WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                    WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                    WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 7*kernelsize*kernelsize;
                        WSISnum0_14[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 8*kernelsize*kernelsize;
                        WSISnum0_14[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 9*kernelsize*kernelsize;
                        WSISnum0_14[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 10*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[2] <= WSISnum0_14[2] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[1] <= WSISnum0_14[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[0] <= WSISnum0_14[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                        WSISnum0_14[2] <= WSISnum0_14[2] + 1; 
                        WSISnum0_14[1] <= WSISnum0_14[1] + 1; 
                        WSISnum0_14[0] <= WSISnum0_14[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[1] <= WSISnum0_14[1] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                        WSISnum0_14[1] <= WSISnum0_14[1] + 1; 
                    end
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_11 < WS_width*kernelsize + kernelsize -1 && OS_counter0_11 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                        WSISnum0_14[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_11 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[0] <= WSISnum0_14[0] + (WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                        WSISnum0_14[0] <= WSISnum0_14[0] + 1; 
                    end
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                    WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_11-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                    WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                    WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                    WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 4*kernelsize*kernelsize;
                        WSISnum0_14[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 5*kernelsize*kernelsize;
                        WSISnum0_14[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 6*kernelsize*kernelsize;
                        WSISnum0_14[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 7*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[2] <= WSISnum0_14[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[1] <= WSISnum0_14[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[0] <= WSISnum0_14[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                        WSISnum0_14[2] <= WSISnum0_14[2] + 1; 
                        WSISnum0_14[1] <= WSISnum0_14[1] + 1; 
                        WSISnum0_14[0] <= WSISnum0_14[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_14[1] <= WSISnum0_14[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                        WSISnum0_14[1] <= WSISnum0_14[1] + 1; 
                    end
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[1] <= WSISnum0_14[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[1] <= WSISnum0_14[1] + 1; 
                    end
                        WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            4:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[3] <= WSISnum0_14[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[3] <= WSISnum0_14[3] + 1; 
                    end
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            5:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                        WSISnum0_14[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[2] <= WSISnum0_14[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[2] <= WSISnum0_14[2] + 1; 
                    end
                        WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            6:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[1] <= WSISnum0_14[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[1] <= WSISnum0_14[1] + 1; 
                    end
                        WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            7:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                        WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                        WSISnum0_14[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_14-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_14 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_14[0] <= WSISnum0_14[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_14[0] <= WSISnum0_14[0] + 1; 
                    end
                        WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                        WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                        WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_14 < WS_width*kernelsize + kernelsize -1 && OS_counter0_14 >= WS_width*kernelsize-1)begin
                    WSISnum0_14[3] <= WSISnum0_15[0] + 3;
                    WSISnum0_14[2] <= WSISnum0_14[3] + 3;
                    WSISnum0_14[1] <= WSISnum0_14[2] + 3;
                    WSISnum0_14[0] <= WSISnum0_14[1] + 3;
                end
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第15個開始的state
    if(rst)begin
        WSISnum0_15[0] <= 0;        WSISnum0_15[1] <= 0;        WSISnum0_15[2] <= 0;        WSISnum0_15[3] <= 0;
    end else if(state0_15) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_15[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_15[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[2] <= WSISnum0_15[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[1] <= WSISnum0_15[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[0] <= WSISnum0_15[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[2] <= WSISnum0_15[2] + 1; 
                        WSISnum0_15[1] <= WSISnum0_15[1] + 1; 
                        WSISnum0_15[0] <= WSISnum0_15[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_15[0] <= WSISnum0_15[1] + 3;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[1] <= WSISnum0_15[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[1] <= WSISnum0_15[1] + 1; 
                    end
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[0] <= WSISnum0_15[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                        WSISnum0_15[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[0] <= WSISnum0_15[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[0] <= WSISnum0_15[0] + 1; 
                    end
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 15*kernelsize*kernelsize;
                    WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                    WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                    WSISnum0_15[0] <= WSISnum0_15[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_15[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_15[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[2] <= WSISnum0_15[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[1] <= WSISnum0_15[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[0] <= WSISnum0_15[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[2] <= WSISnum0_15[2] + 1; 
                        WSISnum0_15[1] <= WSISnum0_15[1] + 1; 
                        WSISnum0_15[0] <= WSISnum0_15[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_15[0] <= WSISnum0_15[1] + 3;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[1] <= WSISnum0_15[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[1] <= WSISnum0_15[1] + 1; 
                    end
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[0] <= WSISnum0_15[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                        WSISnum0_15[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[0] <= WSISnum0_15[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[0] <= WSISnum0_15[0] + 1; 
                    end
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 3*kernelsize*kernelsize;
                    WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                    WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                    WSISnum0_15[0] <= WSISnum0_15[1] + 3;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_15[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 2*kernelsize*kernelsize;
                        WSISnum0_15[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 3*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[2] <= WSISnum0_15[2] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[1] <= WSISnum0_15[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[0] <= WSISnum0_15[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[2] <= WSISnum0_15[2] + 1; 
                        WSISnum0_15[1] <= WSISnum0_15[1] + 1; 
                        WSISnum0_15[0] <= WSISnum0_15[0] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;
                        WSISnum0_15[0] <= WSISnum0_15[1] + 3;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[1] <= WSISnum0_15[1] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[1] <= WSISnum0_15[1] + 1; 
                    end
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[0] <= WSISnum0_15[1] + 3;
                end
            end
            3:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 0*kernelsize*kernelsize;
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                        WSISnum0_15[0] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize + 1*kernelsize*kernelsize;

                end else begin
                    if((OS_counter0_15 - WS_width*kernelsize - kernelsize + 1)%kernelsize == 0)begin
                        WSISnum0_15[3] <= WSISnum0_15[3] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                        WSISnum0_15[0] <= WSISnum0_15[0] +(WS_width*2)*kernelsize*kernelsize - (kernelsize-1);
                    end else begin
                        WSISnum0_15[3] <= WSISnum0_15[3] + 1; 
                        WSISnum0_15[0] <= WSISnum0_15[0] + 1; 
                    end
                        WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                        WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                end
            end
            default:begin
                if(OS_counter0_15 < WS_width*kernelsize + kernelsize -1 && OS_counter0_15 >= WS_width*kernelsize-1)begin
                        WSISnum0_15[3] <= ((round-1)*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + OS_counter0_15-WS_width*kernelsize+1 + 0*kernelsize*kernelsize;
                    WSISnum0_15[2] <= WSISnum0_15[3] + 3;
                    WSISnum0_15[1] <= WSISnum0_15[2] + 3;
                    WSISnum0_15[0] <= WSISnum0_15[1] + 3;
                end
            end
            endcase
        end
    end
end

logic [10:0]WSWSnum0_0[7:0],WSWSnum0_1[7:0],WSWSnum0_2[7:0],WSWSnum0_3[7:0],WSWSnum0_4[7:0],WSWSnum0_5[7:0],WSWSnum0_6[7:0],WSWSnum0_7[7:0],WSWSnum0_8[7:0],WSWSnum0_9[7:0],WSWSnum0_10[7:0],WSWSnum0_11[7:0],WSWSnum0_12[7:0],WSWSnum0_13[7:0],WSWSnum0_14[7:0],WSWSnum0_15[7:0];

always_ff@( posedge clk or posedge rst ) begin // 第15個Weight的輸入值
    if(rst)begin
        WSWSnum0_15[0] <= 0; WSWSnum0_15[1] <= 0; WSWSnum0_15[2] <= 0; WSWSnum0_15[3] <= 0; WSWSnum0_15[4] <= 0; WSWSnum0_15[5] <= 0; WSWSnum0_15[6] <= 0; WSWSnum0_15[7] <= 0;
    end else if(state0_15 && OS_counter0_15 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_15[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 0 + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length*WS_width-WS_width*WS_width);
            WSWSnum0_15[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 3 + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 6 + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 9 + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 12 + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 15 + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 18 + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 21 + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_15[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize + 0  + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 0+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize + 3  + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 3+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize + 6  + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 6+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize + 9  + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 9+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_15[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize + 0  + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 0+16*kernelsize-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize + 3  + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 3+16*kernelsize-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize + 6  + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 6+16*kernelsize-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize + 9  + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_15[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_15)%kernelsize  + 9+16*kernelsize-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_15)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end
    end else begin
        WSWSnum0_15[0] <= 0; WSWSnum0_15[1] <= 0; WSWSnum0_15[2] <= 0; WSWSnum0_15[3] <= 0; WSWSnum0_15[4] <= 0; WSWSnum0_15[5] <= 0; WSWSnum0_15[6] <= 0; WSWSnum0_15[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第14個Weight的輸入值
    if(rst)begin
        WSWSnum0_14[0] <= 0; WSWSnum0_14[1] <= 0; WSWSnum0_14[2] <= 0; WSWSnum0_14[3] <= 0; WSWSnum0_14[4] <= 0; WSWSnum0_14[5] <= 0; WSWSnum0_14[6] <= 0; WSWSnum0_14[7] <= 0;
    end else if(state0_14 && OS_counter0_14 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_14[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 0 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 3 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 6 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 9 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 12 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 15 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 18 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 21 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_14[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 12 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 15 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 18 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 21 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_14[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 12 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 15 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 18 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_14[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_14)%kernelsize  + 21 + ((OS_counter0_14)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end
    end else begin
        WSWSnum0_14[0] <= 0; WSWSnum0_14[1] <= 0; WSWSnum0_14[2] <= 0; WSWSnum0_14[3] <= 0; WSWSnum0_14[4] <= 0; WSWSnum0_14[5] <= 0; WSWSnum0_14[6] <= 0; WSWSnum0_14[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第13個Weight的輸入值
    if(rst)begin
        WSWSnum0_13[0] <= 0; WSWSnum0_13[1] <= 0; WSWSnum0_13[2] <= 0; WSWSnum0_13[3] <= 0; WSWSnum0_13[4] <= 0; WSWSnum0_13[5] <= 0; WSWSnum0_13[6] <= 0; WSWSnum0_13[7] <= 0;
    end else if(state0_13 && OS_counter0_13 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_13[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 0 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 3 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 6 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 9 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 12 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 15 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 18 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 21 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_13[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize + 24  + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 24+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize + 27  + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 27+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize + 30  + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 30+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize + 33  + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 33+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_13[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 24 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 27 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 30 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_13[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_13)%kernelsize  + 33 + ((OS_counter0_13)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end
    end else begin
        WSWSnum0_13[0] <= 0; WSWSnum0_13[1] <= 0; WSWSnum0_13[2] <= 0; WSWSnum0_13[3] <= 0; WSWSnum0_13[4] <= 0; WSWSnum0_13[5] <= 0; WSWSnum0_13[6] <= 0; WSWSnum0_13[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第12個Weight的輸入值
    if(rst)begin
        WSWSnum0_12[0] <= 0; WSWSnum0_12[1] <= 0; WSWSnum0_12[2] <= 0; WSWSnum0_12[3] <= 0; WSWSnum0_12[4] <= 0; WSWSnum0_12[5] <= 0; WSWSnum0_12[6] <= 0; WSWSnum0_12[7] <= 0;
    end else if(state0_12 && OS_counter0_12 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_12[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 0 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 3 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 6 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 9 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 12 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 15 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 18 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 21 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_12[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 0 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 3 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 6 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 9 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_12[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 36 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 39 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 42 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_12[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_12)%kernelsize  + 45 + ((OS_counter0_12)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end
    end else begin
        WSWSnum0_12[0] <= 0; WSWSnum0_12[1] <= 0; WSWSnum0_12[2] <= 0; WSWSnum0_12[3] <= 0; WSWSnum0_12[4] <= 0; WSWSnum0_12[5] <= 0; WSWSnum0_12[6] <= 0; WSWSnum0_12[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第11個Weight的輸入值
    if(rst)begin
        WSWSnum0_11[0] <= 0; WSWSnum0_11[1] <= 0; WSWSnum0_11[2] <= 0; WSWSnum0_11[3] <= 0; WSWSnum0_11[4] <= 0; WSWSnum0_11[5] <= 0; WSWSnum0_11[6] <= 0; WSWSnum0_11[7] <= 0;
    end else if(state0_11 && OS_counter0_11 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_11[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 0 + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 3 + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 6 + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 9 + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 12 + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 15 + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 18 + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 21 + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_11[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 12-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 15-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 18-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 21-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_11[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 48-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 51-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 54-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_11[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_11)%kernelsize  + 57-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_11)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end
    end else begin
        WSWSnum0_11[0] <= 0; WSWSnum0_11[1] <= 0; WSWSnum0_11[2] <= 0; WSWSnum0_11[3] <= 0; WSWSnum0_11[4] <= 0; WSWSnum0_11[5] <= 0; WSWSnum0_11[6] <= 0; WSWSnum0_11[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第10個Weight的輸入值
    if(rst)begin
        WSWSnum0_10[0] <= 0; WSWSnum0_10[1] <= 0; WSWSnum0_10[2] <= 0; WSWSnum0_10[3] <= 0; WSWSnum0_10[4] <= 0; WSWSnum0_10[5] <= 0; WSWSnum0_10[6] <= 0; WSWSnum0_10[7] <= 0;
    end else if(state0_10 && OS_counter0_10 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_10[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_10)%kernelsize  + 0 + ((OS_counter0_10)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_10[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_10)%kernelsize  + 3 + ((OS_counter0_10)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_10[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_10)%kernelsize  + 6 + ((OS_counter0_10)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_10[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_10)%kernelsize  + 9 + ((OS_counter0_10)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_10[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_10)%kernelsize  + 12 + ((OS_counter0_10)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_10[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_10)%kernelsize  + 15 + ((OS_counter0_10)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_10[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_10)%kernelsize  + 18 + ((OS_counter0_10)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_10[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_10)%kernelsize  + 21 + ((OS_counter0_10)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_10[3] <=  0;
            WSWSnum0_10[2] <=  0;
            WSWSnum0_10[1] <=  0;
            WSWSnum0_10[0] <=  0;
        end else if(PE_size/size==1)begin
            WSWSnum0_10[3] <=  0;
            WSWSnum0_10[2] <=  0;
            WSWSnum0_10[1] <=  0;
            WSWSnum0_10[0] <=  0;
        end
    end else begin
        WSWSnum0_10[0] <= 0; WSWSnum0_10[1] <= 0; WSWSnum0_10[2] <= 0; WSWSnum0_10[3] <= 0; WSWSnum0_10[4] <= 0; WSWSnum0_10[5] <= 0; WSWSnum0_10[6] <= 0; WSWSnum0_10[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第9個Weight的輸入值
    if(rst)begin
        WSWSnum0_9[0] <= 0; WSWSnum0_9[1] <= 0; WSWSnum0_9[2] <= 0; WSWSnum0_9[3] <= 0; WSWSnum0_9[4] <= 0; WSWSnum0_9[5] <= 0; WSWSnum0_9[6] <= 0; WSWSnum0_9[7] <= 0;
    end else if(state0_9 && OS_counter0_9 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_9[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 0 + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 3 + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 6 + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 9 + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 12 + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 15 + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 18 + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 21 + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_9[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 24-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 27-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 30-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_9[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_9)%kernelsize  + 33-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_9)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_9[3] <=  0;
            WSWSnum0_9[2] <=  0;
            WSWSnum0_9[1] <=  0;
            WSWSnum0_9[0] <=  0;
        end
    end else begin
        WSWSnum0_9[0] <= 0; WSWSnum0_9[1] <= 0; WSWSnum0_9[2] <= 0; WSWSnum0_9[3] <= 0; WSWSnum0_9[4] <= 0; WSWSnum0_9[5] <= 0; WSWSnum0_9[6] <= 0; WSWSnum0_9[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第8個Weight的輸入值
    if(rst)begin
        WSWSnum0_8[0] <= 0; WSWSnum0_8[1] <= 0; WSWSnum0_8[2] <= 0; WSWSnum0_8[3] <= 0; WSWSnum0_8[4] <= 0; WSWSnum0_8[5] <= 0; WSWSnum0_8[6] <= 0; WSWSnum0_8[7] <= 0;
    end else if(state0_8 && OS_counter0_8 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_8[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_8)%kernelsize  + 0 + ((OS_counter0_8)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_8[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_8)%kernelsize  + 3 + ((OS_counter0_8)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_8[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_8)%kernelsize  + 6 + ((OS_counter0_8)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_8[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_8)%kernelsize  + 9 + ((OS_counter0_8)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_8[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_8)%kernelsize  + 12 + ((OS_counter0_8)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_8[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_8)%kernelsize  + 15 + ((OS_counter0_8)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_8[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_8)%kernelsize  + 18 + ((OS_counter0_8)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_8[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_8)%kernelsize  + 21 + ((OS_counter0_8)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_8[3] <=  0;
            WSWSnum0_8[2] <=  0;
            WSWSnum0_8[1] <=  0;
            WSWSnum0_8[0] <=  0;
        end else if(PE_size/size==1)begin
            WSWSnum0_8[3] <=  0;
            WSWSnum0_8[2] <=  0;
            WSWSnum0_8[1] <=  0;
            WSWSnum0_8[0] <=  0;
        end
    end else begin
        WSWSnum0_8[0] <= 0; WSWSnum0_8[1] <= 0; WSWSnum0_8[2] <= 0; WSWSnum0_8[3] <= 0; WSWSnum0_8[4] <= 0; WSWSnum0_8[5] <= 0; WSWSnum0_8[6] <= 0; WSWSnum0_8[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第7個Weight的輸入值
    if(rst)begin
        WSWSnum0_7[0] <= 0; WSWSnum0_7[1] <= 0; WSWSnum0_7[2] <= 0; WSWSnum0_7[3] <= 0; WSWSnum0_7[4] <= 0; WSWSnum0_7[5] <= 0; WSWSnum0_7[6] <= 0; WSWSnum0_7[7] <= 0;
    end else if(state0_7 && OS_counter0_7 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_7[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 0 + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 3 + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 6 + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 9 + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 12 + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 15 + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 18 + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 21 + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_7[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize + 0  + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 0+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize + 3  + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 3+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize + 6  + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 6+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize + 9  + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 9+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_7[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 60-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 63-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 66-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_7[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_7)%kernelsize  + 69-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_7)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end
    end else begin
        WSWSnum0_7[0] <= 0; WSWSnum0_7[1] <= 0; WSWSnum0_7[2] <= 0; WSWSnum0_7[3] <= 0; WSWSnum0_7[4] <= 0; WSWSnum0_7[5] <= 0; WSWSnum0_7[6] <= 0; WSWSnum0_7[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第6個Weight的輸入值
    if(rst)begin
        WSWSnum0_6[0] <= 0; WSWSnum0_6[1] <= 0; WSWSnum0_6[2] <= 0; WSWSnum0_6[3] <= 0; WSWSnum0_6[4] <= 0; WSWSnum0_6[5] <= 0; WSWSnum0_6[6] <= 0; WSWSnum0_6[7] <= 0;
    end else if(state0_6 && OS_counter0_6 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_6[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 0 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 3 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 6 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 9 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 12 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 15 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 18 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 21 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_6[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 12 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 15 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 18 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_6[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_6)%kernelsize  + 21 + ((OS_counter0_6)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_6[3] <=  0;
            WSWSnum0_6[2] <=  0;
            WSWSnum0_6[1] <=  0;
            WSWSnum0_6[0] <=  0;
        end
    end else begin
        WSWSnum0_6[0] <= 0; WSWSnum0_6[1] <= 0; WSWSnum0_6[2] <= 0; WSWSnum0_6[3] <= 0; WSWSnum0_6[4] <= 0; WSWSnum0_6[5] <= 0; WSWSnum0_6[6] <= 0; WSWSnum0_6[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第5個Weight的輸入值
    if(rst)begin
        WSWSnum0_5[0] <= 0; WSWSnum0_5[1] <= 0; WSWSnum0_5[2] <= 0; WSWSnum0_5[3] <= 0; WSWSnum0_5[4] <= 0; WSWSnum0_5[5] <= 0; WSWSnum0_5[6] <= 0; WSWSnum0_5[7] <= 0;
    end else if(state0_5 && OS_counter0_5 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_5[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 0 + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 3 + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 6 + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 9 + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 12 + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 15 + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 18 + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 21 + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_5[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize + 24  + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 24+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize + 27  + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 27+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize + 30  + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 30+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize + 33  + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_5[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_5)%kernelsize  + 33+8*kernelsize-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize + ((OS_counter0_5)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_5[3] <=  0;
            WSWSnum0_5[2] <=  0;
            WSWSnum0_5[1] <=  0;
            WSWSnum0_5[0] <=  0;
        end
    end else begin
        WSWSnum0_5[0] <= 0; WSWSnum0_5[1] <= 0; WSWSnum0_5[2] <= 0; WSWSnum0_5[3] <= 0; WSWSnum0_5[4] <= 0; WSWSnum0_5[5] <= 0; WSWSnum0_5[6] <= 0; WSWSnum0_5[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第4個Weight的輸入值
    if(rst)begin
        WSWSnum0_4[0] <= 0; WSWSnum0_4[1] <= 0; WSWSnum0_4[2] <= 0; WSWSnum0_4[3] <= 0; WSWSnum0_4[4] <= 0; WSWSnum0_4[5] <= 0; WSWSnum0_4[6] <= 0; WSWSnum0_4[7] <= 0;
    end else if(state0_4 && OS_counter0_4 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_4[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 0 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 3 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 6 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 9 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 12 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 15 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 18 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 21 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_4[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 0 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 3 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 6 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_4[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_4)%kernelsize  + 9 + ((OS_counter0_4)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_4[3] <=  0;
            WSWSnum0_4[2] <=  0;
            WSWSnum0_4[1] <=  0;
            WSWSnum0_4[0] <=  0;
        end
    end else begin
        WSWSnum0_4[0] <= 0; WSWSnum0_4[1] <= 0; WSWSnum0_4[2] <= 0; WSWSnum0_4[3] <= 0; WSWSnum0_4[4] <= 0; WSWSnum0_4[5] <= 0; WSWSnum0_4[6] <= 0; WSWSnum0_4[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第3個Weight的輸入值
    if(rst)begin
        WSWSnum0_3[0] <= 0; WSWSnum0_3[1] <= 0; WSWSnum0_3[2] <= 0; WSWSnum0_3[3] <= 0; WSWSnum0_3[4] <= 0; WSWSnum0_3[5] <= 0; WSWSnum0_3[6] <= 0; WSWSnum0_3[7] <= 0;
    end else if(state0_3 && OS_counter0_3 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_3[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 0 + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 3 + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 6 + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 9 + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 12 + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 15 + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 18 + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 21 + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_3[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 12-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 15-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 18-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 21-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_3[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 72-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 75-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 78-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_3[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_3)%kernelsize  + 81-(16-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_3)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end
    end else begin
        WSWSnum0_3[0] <= 0; WSWSnum0_3[1] <= 0; WSWSnum0_3[2] <= 0; WSWSnum0_3[3] <= 0; WSWSnum0_3[4] <= 0; WSWSnum0_3[5] <= 0; WSWSnum0_3[6] <= 0; WSWSnum0_3[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第2個Weight的輸入值
    if(rst)begin
        WSWSnum0_2[0] <= 0; WSWSnum0_2[1] <= 0; WSWSnum0_2[2] <= 0; WSWSnum0_2[3] <= 0; WSWSnum0_2[4] <= 0; WSWSnum0_2[5] <= 0; WSWSnum0_2[6] <= 0; WSWSnum0_2[7] <= 0;
    end else if(state0_2 && OS_counter0_2 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_2[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_2)%kernelsize  + 0 + ((OS_counter0_2)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_2[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_2)%kernelsize  + 3 + ((OS_counter0_2)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_2[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_2)%kernelsize  + 6 + ((OS_counter0_2)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_2[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_2)%kernelsize  + 9 + ((OS_counter0_2)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_2[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_2)%kernelsize  + 12 + ((OS_counter0_2)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_2[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_2)%kernelsize  + 15 + ((OS_counter0_2)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_2[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_2)%kernelsize  + 18 + ((OS_counter0_2)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_2[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_2)%kernelsize  + 21 + ((OS_counter0_2)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_2[3] <=  0;
            WSWSnum0_2[2] <=  0;
            WSWSnum0_2[1] <=  0;
            WSWSnum0_2[0] <=  0;
        end else if(PE_size/size==1)begin
            WSWSnum0_2[3] <=  0;
            WSWSnum0_2[2] <=  0;
            WSWSnum0_2[1] <=  0;
            WSWSnum0_2[0] <=  0;
        end
    end else begin
        WSWSnum0_2[0] <= 0; WSWSnum0_2[1] <= 0; WSWSnum0_2[2] <= 0; WSWSnum0_2[3] <= 0; WSWSnum0_2[4] <= 0; WSWSnum0_2[5] <= 0; WSWSnum0_2[6] <= 0; WSWSnum0_2[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第1個Weight的輸入值
    if(rst)begin
        WSWSnum0_1[0] <= 0; WSWSnum0_1[1] <= 0; WSWSnum0_1[2] <= 0; WSWSnum0_1[3] <= 0; WSWSnum0_1[4] <= 0; WSWSnum0_1[5] <= 0; WSWSnum0_1[6] <= 0; WSWSnum0_1[7] <= 0;
    end else if(state0_1 && OS_counter0_1 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_1[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 0 + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 3 + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 6 + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 9 + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 12 + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 15 + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 18 + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 21 + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_1[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 24-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 27-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 30-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_1[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_1)%kernelsize  + 33-(8-WS_length*kernelsize)*kernelsize-(WS_width*kernelsize)*kernelsize+(PE_size/partition)*kernelsize + ((OS_counter0_1)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==1)begin
            WSWSnum0_1[3] <=  0;
            WSWSnum0_1[2] <=  0;
            WSWSnum0_1[1] <=  0;
            WSWSnum0_1[0] <=  0;
        end
    end else begin
        WSWSnum0_1[0] <= 0; WSWSnum0_1[1] <= 0; WSWSnum0_1[2] <= 0; WSWSnum0_1[3] <= 0; WSWSnum0_1[4] <= 0; WSWSnum0_1[5] <= 0; WSWSnum0_1[6] <= 0; WSWSnum0_1[7] <= 0;
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第0個Weight的輸入值
    if(rst)begin
        WSWSnum0_0[0] <= 0; WSWSnum0_0[1] <= 0; WSWSnum0_0[2] <= 0; WSWSnum0_0[3] <= 0; WSWSnum0_0[4] <= 0; WSWSnum0_0[5] <= 0; WSWSnum0_0[6] <= 0; WSWSnum0_0[7] <= 0;
    end else if(state0_0 && OS_counter0_0 < WS_width*kernelsize) begin
        if(PE_size/size==4)begin
            WSWSnum0_0[7] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_0)%kernelsize  + 0 + ((OS_counter0_0)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_0[6] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_0)%kernelsize  + 3 + ((OS_counter0_0)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_0[5] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_0)%kernelsize  + 6 + ((OS_counter0_0)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_0[4] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_0)%kernelsize  + 9 + ((OS_counter0_0)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_0[3] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_0)%kernelsize  + 12 + ((OS_counter0_0)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_0[2] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_0)%kernelsize  + 15 + ((OS_counter0_0)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_0[1] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_0)%kernelsize  + 18 + ((OS_counter0_0)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
            WSWSnum0_0[0] <=  (((round-1)*(computation_num-kernelsize*kernelsize))/total_inputmapnum )*(kernelsize**2)*(WS_width*WS_length*2-WS_width*WS_width) + (OS_counter0_0)%kernelsize  + 21 + ((OS_counter0_0)/kernelsize)*(kernelsize**2)*(2*WS_length-WS_width);
        end else if(PE_size/size==2)begin
            WSWSnum0_0[3] <=  0;
            WSWSnum0_0[2] <=  0;
            WSWSnum0_0[1] <=  0;
            WSWSnum0_0[0] <=  0;
        end else if(PE_size/size==1)begin
            WSWSnum0_0[3] <=  0;
            WSWSnum0_0[2] <=  0;
            WSWSnum0_0[1] <=  0;
            WSWSnum0_0[0] <=  0;
        end
    end else begin
        WSWSnum0_0[0] <= 0; WSWSnum0_0[1] <= 0; WSWSnum0_0[2] <= 0; WSWSnum0_0[3] <= 0; WSWSnum0_0[4] <= 0; WSWSnum0_0[5] <= 0; WSWSnum0_0[6] <= 0; WSWSnum0_0[7] <= 0;
    end
end

logic [3:0]WSsignal0_0,WSsignal0_1,WSsignal0_2,WSsignal0_3,WSsignal0_4,WSsignal0_5,WSsignal0_6,WSsignal0_7,WSsignal0_8,WSsignal0_9,WSsignal0_10,WSsignal0_11,WSsignal0_12,WSsignal0_13,WSsignal0_14,WSsignal0_15;
always_comb begin // WS 第0個signal
    if(rst)begin
        WSsignal0_0[0] <= 0;        WSsignal0_0[1] <= 0;        WSsignal0_0[2] <= 0;        WSsignal0_0[3] <= 0;
    end else if(state0_0) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 1;
                    WSsignal0_0[2] = 1;
                    WSsignal0_0[1] = 1;
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 1;
                    WSsignal0_0[2] = 1;
                    WSsignal0_0[1] = 1;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_0 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 1;
                    WSsignal0_0[2] = 1;
                    WSsignal0_0[1] = 1;
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 1;
                    WSsignal0_0[2] = 1;
                    WSsignal0_0[1] = 1;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_0 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 1;
                    WSsignal0_0[2] = 1;
                    WSsignal0_0[1] = 1;
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 1;
                    WSsignal0_0[2] = 1;
                    WSsignal0_0[1] = 1;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            8:begin
                if(OS_counter0_0 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 7 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            9:begin
                if(OS_counter0_0 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            10:begin
                if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            11:begin
                if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            12:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            13:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            14:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end else if(OS_counter0_0 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 13 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end

            15:begin
                if(OS_counter0_0 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_0[0] = 0;
                end else if(OS_counter0_0 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                end else if(OS_counter0_0 == 13 + (WS_width*kernelsize))begin
                    WSsignal0_0[2] = 0;
                end else if(OS_counter0_0 == 14 + (WS_width*kernelsize))begin
                    WSsignal0_0[1] = 0;
                end
                else if (OS_counter0_0 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_0 == 12+0 + (WS_width*kernelsize))begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end else begin
                    WSsignal0_0[3] = 0;
                    WSsignal0_0[2] = 0;
                    WSsignal0_0[1] = 0;
                    WSsignal0_0[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_0[0] = 0;            WSsignal0_0[1] = 0;            WSsignal0_0[2] = 0;            WSsignal0_0[3] = 0;
        end
    end else begin
        WSsignal0_0[0] = 0;        WSsignal0_0[1] = 0;        WSsignal0_0[2] = 0;        WSsignal0_0[3] = 0;
    end
end

always_comb begin // WS 第1個signal
    if(rst)begin
        WSsignal0_1[0] <= 0;        WSsignal0_1[1] <= 0;        WSsignal0_1[2] <= 0;        WSsignal0_1[3] <= 0;
    end else if(state0_1) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[1] = 1;
                    WSsignal0_1[0] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[1] = 1;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[0] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[0] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_1 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[1] = 1;
                    WSsignal0_1[0] = 1;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[1] = 1;
                    WSsignal0_1[0] = 1;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[1] = 1;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[0] = 1;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[1] = 1;
                    WSsignal0_1[0] = 1;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[0] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_1 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[1] = 1;
                    WSsignal0_1[0] = 1;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[1] = 1;
                    WSsignal0_1[0] = 1;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[1] = 1;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[0] = 1;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 1;
                    WSsignal0_1[2] = 1;
                    WSsignal0_1[1] = 1;
                    WSsignal0_1[0] = 1;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[0] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_1[0] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[0] = 0;
                end else if(OS_counter0_1 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                end else if(OS_counter0_1 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_1 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                end else if(OS_counter0_1 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_1[0] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                end else if(OS_counter0_1 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_1[0] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            8:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_1[0] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            9:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_1[0] = 0;
                end else if(OS_counter0_1 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            10:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end else if(OS_counter0_1 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_1[0] = 0;
                end else if(OS_counter0_1 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                end else if(OS_counter0_1 == 9 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end

            11:begin
                if(OS_counter0_1 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_1[0] = 0;
                end else if(OS_counter0_1 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                end else if(OS_counter0_1 == 9 + (WS_width*kernelsize))begin
                    WSsignal0_1[2] = 0;
                end else if(OS_counter0_1 == 10 + (WS_width*kernelsize))begin
                    WSsignal0_1[1] = 0;
                end
                else if (OS_counter0_1 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_1 == 8+0 + (WS_width*kernelsize))begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end else begin
                    WSsignal0_1[3] = 0;
                    WSsignal0_1[2] = 0;
                    WSsignal0_1[1] = 0;
                    WSsignal0_1[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_1[0] = 0;            WSsignal0_1[1] = 0;            WSsignal0_1[2] = 0;            WSsignal0_1[3] = 0;
        end
    end else begin
        WSsignal0_1[0] = 0;        WSsignal0_1[1] = 0;        WSsignal0_1[2] = 0;        WSsignal0_1[3] = 0;
    end
end

always_comb begin // WS 第2個signal
    if(rst)begin
        WSsignal0_2[0] <= 0;        WSsignal0_2[1] <= 0;        WSsignal0_2[2] <= 0;        WSsignal0_2[3] <= 0;
    end else if(state0_2) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[1] = 1;
                    WSsignal0_2[0] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[1] = 1;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[0] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end else if(OS_counter0_2 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_2 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[1] = 1;
                    WSsignal0_2[0] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[1] = 1;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[0] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end else if(OS_counter0_2 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_2[0] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                end else if(OS_counter0_2 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                end else if(OS_counter0_2 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end else if(OS_counter0_2 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_2 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[1] = 1;
                    WSsignal0_2[0] = 1;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[1] = 1;
                    WSsignal0_2[0] = 1;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[1] = 1;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[0] = 1;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[1] = 1;
                    WSsignal0_2[0] = 1;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 1;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 1;
                    WSsignal0_2[2] = 1;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end else if(OS_counter0_2 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_2[0] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end else if(OS_counter0_2 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                end else if(OS_counter0_2 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_2 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_2[0] = 0;
                end else if(OS_counter0_2 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                end else if(OS_counter0_2 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_2[2] = 0;
                end else if(OS_counter0_2 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_2[1] = 0;
                end
                else if (OS_counter0_2 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_2 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end else begin
                    WSsignal0_2[3] = 0;
                    WSsignal0_2[2] = 0;
                    WSsignal0_2[1] = 0;
                    WSsignal0_2[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_2[0] = 0;            WSsignal0_2[1] = 0;            WSsignal0_2[2] = 0;            WSsignal0_2[3] = 0;
        end
    end else begin
        WSsignal0_2[0] = 0;        WSsignal0_2[1] = 0;        WSsignal0_2[2] = 0;        WSsignal0_2[3] = 0;
    end
end

always_comb begin // WS 第3個signal
    if(rst)begin
        WSsignal0_3[0] <= 0;        WSsignal0_3[1] <= 0;        WSsignal0_3[2] <= 0;        WSsignal0_3[3] <= 0;
    end else if(state0_3) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 0;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 0;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[1] = 0;
                end else if(OS_counter0_3 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[0] = 0;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[0] = 0;
                end else if(OS_counter0_3 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_3[2] = 0;
                end else if(OS_counter0_3 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_3[1] = 0;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_3 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 1;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 1;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[1] = 1;
                end else if(OS_counter0_3 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[0] = 1;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 1;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[0] = 0;
                end else if(OS_counter0_3 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_3[2] = 0;
                end else if(OS_counter0_3 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_3[1] = 0;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_3 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 1;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 1;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[1] = 1;
                end else if(OS_counter0_3 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[0] = 1;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 1;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_3 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[0] = 1;
                end else if(OS_counter0_3 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_3[2] = 1;
                end else if(OS_counter0_3 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_3[1] = 1;
                end
                else if (OS_counter0_3 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 1;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_3 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_3[3] = 1;
                    WSsignal0_3[2] = 1;
                    WSsignal0_3[1] = 1;
                    WSsignal0_3[0] = 1;
                end else begin
                    WSsignal0_3[3] = 0;
                    WSsignal0_3[2] = 0;
                    WSsignal0_3[1] = 0;
                    WSsignal0_3[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_3[0] = 0;            WSsignal0_3[1] = 0;            WSsignal0_3[2] = 0;            WSsignal0_3[3] = 0;
        end
    end else begin
        WSsignal0_3[0] = 0;        WSsignal0_3[1] = 0;        WSsignal0_3[2] = 0;        WSsignal0_3[3] = 0;
    end
end

always_comb begin // WS 第4個signal
    if(rst)begin
        WSsignal0_4[0] <= 0;        WSsignal0_4[1] <= 0;        WSsignal0_4[2] <= 0;        WSsignal0_4[3] <= 0;
    end else if(state0_4) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 1;
                    WSsignal0_4[2] = 1;
                    WSsignal0_4[1] = 1;
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 1;
                    WSsignal0_4[2] = 1;
                    WSsignal0_4[1] = 1;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_4 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 1;
                    WSsignal0_4[2] = 1;
                    WSsignal0_4[1] = 1;
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 1;
                    WSsignal0_4[2] = 1;
                    WSsignal0_4[1] = 1;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_4 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 1;
                    WSsignal0_4[2] = 1;
                    WSsignal0_4[1] = 1;
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 1;
                    WSsignal0_4[2] = 1;
                    WSsignal0_4[1] = 1;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            8:begin
                if(OS_counter0_4 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 7 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            9:begin
                if(OS_counter0_4 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            10:begin
                if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            11:begin
                if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            12:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            13:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            14:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end else if(OS_counter0_4 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 13 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end

            15:begin
                if(OS_counter0_4 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_4[0] = 0;
                end else if(OS_counter0_4 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                end else if(OS_counter0_4 == 13 + (WS_width*kernelsize))begin
                    WSsignal0_4[2] = 0;
                end else if(OS_counter0_4 == 14 + (WS_width*kernelsize))begin
                    WSsignal0_4[1] = 0;
                end
                else if (OS_counter0_4 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_4 == 12+0 + (WS_width*kernelsize))begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end else begin
                    WSsignal0_4[3] = 0;
                    WSsignal0_4[2] = 0;
                    WSsignal0_4[1] = 0;
                    WSsignal0_4[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_4[0] = 0;            WSsignal0_4[1] = 0;            WSsignal0_4[2] = 0;            WSsignal0_4[3] = 0;
        end
    end else begin
        WSsignal0_4[0] = 0;        WSsignal0_4[1] = 0;        WSsignal0_4[2] = 0;        WSsignal0_4[3] = 0;
    end
end

always_comb begin // WS 第5個signal
    if(rst)begin
        WSsignal0_5[0] <= 0;        WSsignal0_5[1] <= 0;        WSsignal0_5[2] <= 0;        WSsignal0_5[3] <= 0;
    end else if(state0_5) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[1] = 1;
                    WSsignal0_5[0] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[1] = 1;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[0] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[0] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_5 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[1] = 1;
                    WSsignal0_5[0] = 1;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[1] = 1;
                    WSsignal0_5[0] = 1;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[1] = 1;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[0] = 1;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[1] = 1;
                    WSsignal0_5[0] = 1;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[0] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_5 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[1] = 1;
                    WSsignal0_5[0] = 1;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[1] = 1;
                    WSsignal0_5[0] = 1;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[1] = 1;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[0] = 1;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 1;
                    WSsignal0_5[2] = 1;
                    WSsignal0_5[1] = 1;
                    WSsignal0_5[0] = 1;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[0] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_5[0] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[0] = 0;
                end else if(OS_counter0_5 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                end else if(OS_counter0_5 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_5 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                end else if(OS_counter0_5 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_5[0] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                end else if(OS_counter0_5 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_5[0] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            8:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_5[0] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            9:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_5[0] = 0;
                end else if(OS_counter0_5 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            10:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end else if(OS_counter0_5 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_5[0] = 0;
                end else if(OS_counter0_5 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                end else if(OS_counter0_5 == 9 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end

            11:begin
                if(OS_counter0_5 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_5[0] = 0;
                end else if(OS_counter0_5 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                end else if(OS_counter0_5 == 9 + (WS_width*kernelsize))begin
                    WSsignal0_5[2] = 0;
                end else if(OS_counter0_5 == 10 + (WS_width*kernelsize))begin
                    WSsignal0_5[1] = 0;
                end
                else if (OS_counter0_5 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_5 == 8+0 + (WS_width*kernelsize))begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end else begin
                    WSsignal0_5[3] = 0;
                    WSsignal0_5[2] = 0;
                    WSsignal0_5[1] = 0;
                    WSsignal0_5[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_5[0] = 0;            WSsignal0_5[1] = 0;            WSsignal0_5[2] = 0;            WSsignal0_5[3] = 0;
        end
    end else begin
        WSsignal0_5[0] = 0;        WSsignal0_5[1] = 0;        WSsignal0_5[2] = 0;        WSsignal0_5[3] = 0;
    end
end

always_comb begin // WS 第6個signal
    if(rst)begin
        WSsignal0_6[0] <= 0;        WSsignal0_6[1] <= 0;        WSsignal0_6[2] <= 0;        WSsignal0_6[3] <= 0;
    end else if(state0_6) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[1] = 1;
                    WSsignal0_6[0] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[1] = 1;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[0] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end else if(OS_counter0_6 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_6 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[1] = 1;
                    WSsignal0_6[0] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[1] = 1;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[0] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end else if(OS_counter0_6 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_6[0] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                end else if(OS_counter0_6 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                end else if(OS_counter0_6 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end else if(OS_counter0_6 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_6 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[1] = 1;
                    WSsignal0_6[0] = 1;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[1] = 1;
                    WSsignal0_6[0] = 1;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[1] = 1;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[0] = 1;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[1] = 1;
                    WSsignal0_6[0] = 1;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 1;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 1;
                    WSsignal0_6[2] = 1;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end else if(OS_counter0_6 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_6[0] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end else if(OS_counter0_6 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                end else if(OS_counter0_6 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_6 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_6[0] = 0;
                end else if(OS_counter0_6 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                end else if(OS_counter0_6 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_6[2] = 0;
                end else if(OS_counter0_6 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_6[1] = 0;
                end
                else if (OS_counter0_6 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_6 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end else begin
                    WSsignal0_6[3] = 0;
                    WSsignal0_6[2] = 0;
                    WSsignal0_6[1] = 0;
                    WSsignal0_6[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_6[0] = 0;            WSsignal0_6[1] = 0;            WSsignal0_6[2] = 0;            WSsignal0_6[3] = 0;
        end
    end else begin
        WSsignal0_6[0] = 0;        WSsignal0_6[1] = 0;        WSsignal0_6[2] = 0;        WSsignal0_6[3] = 0;
    end
end

always_comb begin // WS 第7個signal
    if(rst)begin
        WSsignal0_7[0] <= 0;        WSsignal0_7[1] <= 0;        WSsignal0_7[2] <= 0;        WSsignal0_7[3] <= 0;
    end else if(state0_7) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 0;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 0;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[1] = 0;
                end else if(OS_counter0_7 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[0] = 0;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[0] = 0;
                end else if(OS_counter0_7 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_7[2] = 0;
                end else if(OS_counter0_7 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_7[1] = 0;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_7 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 1;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 1;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[1] = 1;
                end else if(OS_counter0_7 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[0] = 1;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 1;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[0] = 0;
                end else if(OS_counter0_7 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_7[2] = 0;
                end else if(OS_counter0_7 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_7[1] = 0;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_7 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 1;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 1;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[1] = 1;
                end else if(OS_counter0_7 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[0] = 1;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 1;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_7 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[0] = 1;
                end else if(OS_counter0_7 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_7[2] = 1;
                end else if(OS_counter0_7 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_7[1] = 1;
                end
                else if (OS_counter0_7 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 1;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_7 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_7[3] = 1;
                    WSsignal0_7[2] = 1;
                    WSsignal0_7[1] = 1;
                    WSsignal0_7[0] = 1;
                end else begin
                    WSsignal0_7[3] = 0;
                    WSsignal0_7[2] = 0;
                    WSsignal0_7[1] = 0;
                    WSsignal0_7[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_7[0] = 0;            WSsignal0_7[1] = 0;            WSsignal0_7[2] = 0;            WSsignal0_7[3] = 0;
        end
    end else begin
        WSsignal0_7[0] = 0;        WSsignal0_7[1] = 0;        WSsignal0_7[2] = 0;        WSsignal0_7[3] = 0;
    end
end

always_comb begin // WS 第8個signal
    if(rst)begin
        WSsignal0_8[0] <= 0;        WSsignal0_8[1] <= 0;        WSsignal0_8[2] <= 0;        WSsignal0_8[3] <= 0;
    end else if(state0_8) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 1;
                    WSsignal0_8[2] = 1;
                    WSsignal0_8[1] = 1;
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 1;
                    WSsignal0_8[2] = 1;
                    WSsignal0_8[1] = 1;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_8 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 1;
                    WSsignal0_8[2] = 1;
                    WSsignal0_8[1] = 1;
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 1;
                    WSsignal0_8[2] = 1;
                    WSsignal0_8[1] = 1;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_8 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 1;
                    WSsignal0_8[2] = 1;
                    WSsignal0_8[1] = 1;
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 1;
                    WSsignal0_8[2] = 1;
                    WSsignal0_8[1] = 1;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            8:begin
                if(OS_counter0_8 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 7 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            9:begin
                if(OS_counter0_8 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            10:begin
                if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            11:begin
                if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            12:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            13:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            14:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end else if(OS_counter0_8 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 13 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end

            15:begin
                if(OS_counter0_8 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_8[0] = 0;
                end else if(OS_counter0_8 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                end else if(OS_counter0_8 == 13 + (WS_width*kernelsize))begin
                    WSsignal0_8[2] = 0;
                end else if(OS_counter0_8 == 14 + (WS_width*kernelsize))begin
                    WSsignal0_8[1] = 0;
                end
                else if (OS_counter0_8 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_8 == 12+0 + (WS_width*kernelsize))begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end else begin
                    WSsignal0_8[3] = 0;
                    WSsignal0_8[2] = 0;
                    WSsignal0_8[1] = 0;
                    WSsignal0_8[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_8[0] = 0;            WSsignal0_8[1] = 0;            WSsignal0_8[2] = 0;            WSsignal0_8[3] = 0;
        end
    end else begin
        WSsignal0_8[0] = 0;        WSsignal0_8[1] = 0;        WSsignal0_8[2] = 0;        WSsignal0_8[3] = 0;
    end
end

always_comb begin // WS 第9個signal
    if(rst)begin
        WSsignal0_9[0] <= 0;        WSsignal0_9[1] <= 0;        WSsignal0_9[2] <= 0;        WSsignal0_9[3] <= 0;
    end else if(state0_9) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[1] = 1;
                    WSsignal0_9[0] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[1] = 1;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[0] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[0] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_9 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[1] = 1;
                    WSsignal0_9[0] = 1;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[1] = 1;
                    WSsignal0_9[0] = 1;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[1] = 1;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[0] = 1;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[1] = 1;
                    WSsignal0_9[0] = 1;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[0] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_9 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[1] = 1;
                    WSsignal0_9[0] = 1;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[1] = 1;
                    WSsignal0_9[0] = 1;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[1] = 1;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[0] = 1;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 1;
                    WSsignal0_9[2] = 1;
                    WSsignal0_9[1] = 1;
                    WSsignal0_9[0] = 1;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[0] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_9[0] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[0] = 0;
                end else if(OS_counter0_9 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                end else if(OS_counter0_9 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_9 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                end else if(OS_counter0_9 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_9[0] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                end else if(OS_counter0_9 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_9[0] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            8:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_9[0] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            9:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_9[0] = 0;
                end else if(OS_counter0_9 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            10:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end else if(OS_counter0_9 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_9[0] = 0;
                end else if(OS_counter0_9 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                end else if(OS_counter0_9 == 9 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end

            11:begin
                if(OS_counter0_9 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_9[0] = 0;
                end else if(OS_counter0_9 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                end else if(OS_counter0_9 == 9 + (WS_width*kernelsize))begin
                    WSsignal0_9[2] = 0;
                end else if(OS_counter0_9 == 10 + (WS_width*kernelsize))begin
                    WSsignal0_9[1] = 0;
                end
                else if (OS_counter0_9 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_9 == 8+0 + (WS_width*kernelsize))begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end else begin
                    WSsignal0_9[3] = 0;
                    WSsignal0_9[2] = 0;
                    WSsignal0_9[1] = 0;
                    WSsignal0_9[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_9[0] = 0;            WSsignal0_9[1] = 0;            WSsignal0_9[2] = 0;            WSsignal0_9[3] = 0;
        end
    end else begin
        WSsignal0_9[0] = 0;        WSsignal0_9[1] = 0;        WSsignal0_9[2] = 0;        WSsignal0_9[3] = 0;
    end
end

always_comb begin // WS 第10個signal
    if(rst)begin
        WSsignal0_10[0] <= 0;        WSsignal0_10[1] <= 0;        WSsignal0_10[2] <= 0;        WSsignal0_10[3] <= 0;
    end else if(state0_10) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[1] = 1;
                    WSsignal0_10[0] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[1] = 1;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[0] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end else if(OS_counter0_10 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_10 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[1] = 1;
                    WSsignal0_10[0] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[1] = 1;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[0] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end else if(OS_counter0_10 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_10[0] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                end else if(OS_counter0_10 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                end else if(OS_counter0_10 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end else if(OS_counter0_10 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_10 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[1] = 1;
                    WSsignal0_10[0] = 1;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[1] = 1;
                    WSsignal0_10[0] = 1;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[1] = 1;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[0] = 1;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[1] = 1;
                    WSsignal0_10[0] = 1;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 1;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 1;
                    WSsignal0_10[2] = 1;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end else if(OS_counter0_10 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_10[0] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end else if(OS_counter0_10 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                end else if(OS_counter0_10 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_10 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_10[0] = 0;
                end else if(OS_counter0_10 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                end else if(OS_counter0_10 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_10[2] = 0;
                end else if(OS_counter0_10 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_10[1] = 0;
                end
                else if (OS_counter0_10 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_10 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end else begin
                    WSsignal0_10[3] = 0;
                    WSsignal0_10[2] = 0;
                    WSsignal0_10[1] = 0;
                    WSsignal0_10[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_10[0] = 0;            WSsignal0_10[1] = 0;            WSsignal0_10[2] = 0;            WSsignal0_10[3] = 0;
        end
    end else begin
        WSsignal0_10[0] = 0;        WSsignal0_10[1] = 0;        WSsignal0_10[2] = 0;        WSsignal0_10[3] = 0;
    end
end

always_comb begin // WS 第11個signal
    if(rst)begin
        WSsignal0_11[0] <= 0;        WSsignal0_11[1] <= 0;        WSsignal0_11[2] <= 0;        WSsignal0_11[3] <= 0;
    end else if(state0_11) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 0;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 0;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[1] = 0;
                end else if(OS_counter0_11 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[0] = 0;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[0] = 0;
                end else if(OS_counter0_11 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_11[2] = 0;
                end else if(OS_counter0_11 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_11[1] = 0;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_11 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 1;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 1;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[1] = 1;
                end else if(OS_counter0_11 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[0] = 1;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 1;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[0] = 0;
                end else if(OS_counter0_11 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_11[2] = 0;
                end else if(OS_counter0_11 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_11[1] = 0;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_11 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 1;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 1;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[1] = 1;
                end else if(OS_counter0_11 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[0] = 1;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 1;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_11 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[0] = 1;
                end else if(OS_counter0_11 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_11[2] = 1;
                end else if(OS_counter0_11 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_11[1] = 1;
                end
                else if (OS_counter0_11 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 1;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_11 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_11[3] = 1;
                    WSsignal0_11[2] = 1;
                    WSsignal0_11[1] = 1;
                    WSsignal0_11[0] = 1;
                end else begin
                    WSsignal0_11[3] = 0;
                    WSsignal0_11[2] = 0;
                    WSsignal0_11[1] = 0;
                    WSsignal0_11[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_11[0] = 0;            WSsignal0_11[1] = 0;            WSsignal0_11[2] = 0;            WSsignal0_11[3] = 0;
        end
    end else begin
        WSsignal0_11[0] = 0;        WSsignal0_11[1] = 0;        WSsignal0_11[2] = 0;        WSsignal0_11[3] = 0;
    end
end

always_comb begin // WS 第12個signal
    if(rst)begin
        WSsignal0_12[0] <= 0;        WSsignal0_12[1] <= 0;        WSsignal0_12[2] <= 0;        WSsignal0_12[3] <= 0;
    end else if(state0_12) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 1;
                    WSsignal0_12[2] = 1;
                    WSsignal0_12[1] = 1;
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 1;
                    WSsignal0_12[2] = 1;
                    WSsignal0_12[1] = 1;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_12 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 1;
                    WSsignal0_12[2] = 1;
                    WSsignal0_12[1] = 1;
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 1;
                    WSsignal0_12[2] = 1;
                    WSsignal0_12[1] = 1;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_12 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 1;
                    WSsignal0_12[2] = 1;
                    WSsignal0_12[1] = 1;
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 1;
                    WSsignal0_12[2] = 1;
                    WSsignal0_12[1] = 1;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            8:begin
                if(OS_counter0_12 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 7 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            9:begin
                if(OS_counter0_12 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            10:begin
                if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            11:begin
                if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            12:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            13:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            14:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end else if(OS_counter0_12 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 13 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end

            15:begin
                if(OS_counter0_12 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_12[0] = 0;
                end else if(OS_counter0_12 == 12 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                end else if(OS_counter0_12 == 13 + (WS_width*kernelsize))begin
                    WSsignal0_12[2] = 0;
                end else if(OS_counter0_12 == 14 + (WS_width*kernelsize))begin
                    WSsignal0_12[1] = 0;
                end
                else if (OS_counter0_12 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_12 == 12+0 + (WS_width*kernelsize))begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end else begin
                    WSsignal0_12[3] = 0;
                    WSsignal0_12[2] = 0;
                    WSsignal0_12[1] = 0;
                    WSsignal0_12[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_12[0] = 0;            WSsignal0_12[1] = 0;            WSsignal0_12[2] = 0;            WSsignal0_12[3] = 0;
        end
    end else begin
        WSsignal0_12[0] = 0;        WSsignal0_12[1] = 0;        WSsignal0_12[2] = 0;        WSsignal0_12[3] = 0;
    end
end

always_comb begin // WS 第13個signal
    if(rst)begin
        WSsignal0_13[0] <= 0;        WSsignal0_13[1] <= 0;        WSsignal0_13[2] <= 0;        WSsignal0_13[3] <= 0;
    end else if(state0_13) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[1] = 1;
                    WSsignal0_13[0] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[1] = 1;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[0] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[0] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_13 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[1] = 1;
                    WSsignal0_13[0] = 1;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[1] = 1;
                    WSsignal0_13[0] = 1;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[1] = 1;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[0] = 1;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[1] = 1;
                    WSsignal0_13[0] = 1;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[0] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_13 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[1] = 1;
                    WSsignal0_13[0] = 1;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[1] = 1;
                    WSsignal0_13[0] = 1;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[1] = 1;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[0] = 1;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 1;
                    WSsignal0_13[2] = 1;
                    WSsignal0_13[1] = 1;
                    WSsignal0_13[0] = 1;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[0] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_13[0] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[0] = 0;
                end else if(OS_counter0_13 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                end else if(OS_counter0_13 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_13 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                end else if(OS_counter0_13 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_13[0] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                end else if(OS_counter0_13 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_13[0] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            8:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_13[0] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            9:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_13[0] = 0;
                end else if(OS_counter0_13 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            10:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end else if(OS_counter0_13 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_13[0] = 0;
                end else if(OS_counter0_13 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                end else if(OS_counter0_13 == 9 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end

            11:begin
                if(OS_counter0_13 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_13[0] = 0;
                end else if(OS_counter0_13 == 8 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                end else if(OS_counter0_13 == 9 + (WS_width*kernelsize))begin
                    WSsignal0_13[2] = 0;
                end else if(OS_counter0_13 == 10 + (WS_width*kernelsize))begin
                    WSsignal0_13[1] = 0;
                end
                else if (OS_counter0_13 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_13 == 8+0 + (WS_width*kernelsize))begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end else begin
                    WSsignal0_13[3] = 0;
                    WSsignal0_13[2] = 0;
                    WSsignal0_13[1] = 0;
                    WSsignal0_13[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_13[0] = 0;            WSsignal0_13[1] = 0;            WSsignal0_13[2] = 0;            WSsignal0_13[3] = 0;
        end
    end else begin
        WSsignal0_13[0] = 0;        WSsignal0_13[1] = 0;        WSsignal0_13[2] = 0;        WSsignal0_13[3] = 0;
    end
end

always_comb begin // WS 第14個signal
    if(rst)begin
        WSsignal0_14[0] <= 0;        WSsignal0_14[1] <= 0;        WSsignal0_14[2] <= 0;        WSsignal0_14[3] <= 0;
    end else if(state0_14) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[1] = 1;
                    WSsignal0_14[0] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[1] = 1;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[0] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end else if(OS_counter0_14 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_14 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[1] = 1;
                    WSsignal0_14[0] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[1] = 1;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[0] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end else if(OS_counter0_14 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_14[0] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                end else if(OS_counter0_14 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                end else if(OS_counter0_14 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end else if(OS_counter0_14 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_14 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[1] = 1;
                    WSsignal0_14[0] = 1;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[1] = 1;
                    WSsignal0_14[0] = 1;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[1] = 1;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[0] = 1;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[1] = 1;
                    WSsignal0_14[0] = 1;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 1;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 1;
                    WSsignal0_14[2] = 1;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            4:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end else if(OS_counter0_14 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 3 + (WS_width*kernelsize))begin
                    WSsignal0_14[0] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            5:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            6:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end else if(OS_counter0_14 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                end else if(OS_counter0_14 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end

            7:begin
                if(OS_counter0_14 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_14[0] = 0;
                end else if(OS_counter0_14 == 4 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                end else if(OS_counter0_14 == 5 + (WS_width*kernelsize))begin
                    WSsignal0_14[2] = 0;
                end else if(OS_counter0_14 == 6 + (WS_width*kernelsize))begin
                    WSsignal0_14[1] = 0;
                end
                else if (OS_counter0_14 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_14 == 4+0 + (WS_width*kernelsize))begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end else begin
                    WSsignal0_14[3] = 0;
                    WSsignal0_14[2] = 0;
                    WSsignal0_14[1] = 0;
                    WSsignal0_14[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_14[0] = 0;            WSsignal0_14[1] = 0;            WSsignal0_14[2] = 0;            WSsignal0_14[3] = 0;
        end
    end else begin
        WSsignal0_14[0] = 0;        WSsignal0_14[1] = 0;        WSsignal0_14[2] = 0;        WSsignal0_14[3] = 0;
    end
end

always_comb begin // WS 第15個signal
    if(rst)begin
        WSsignal0_15[0] <= 0;        WSsignal0_15[1] <= 0;        WSsignal0_15[2] <= 0;        WSsignal0_15[3] <= 0;
    end else if(state0_15) begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 0;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 0;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[1] = 0;
                end else if(OS_counter0_15 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[0] = 0;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[0] = 0;
                end else if(OS_counter0_15 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_15[2] = 0;
                end else if(OS_counter0_15 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_15[1] = 0;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_15 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 1;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 1;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[1] = 1;
                end else if(OS_counter0_15 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[0] = 1;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 1;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[0] = 0;
                end else if(OS_counter0_15 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_15[2] = 0;
                end else if(OS_counter0_15 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_15[1] = 0;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_15 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end
            endcase
        end else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 1;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 1;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end

            2:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[1] = 1;
                end else if(OS_counter0_15 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[0] = 1;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 1;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end

            3:begin
                if(OS_counter0_15 == 0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[0] = 1;
                end else if(OS_counter0_15 == 1 + (WS_width*kernelsize))begin
                    WSsignal0_15[2] = 1;
                end else if(OS_counter0_15 == 2 + (WS_width*kernelsize))begin
                    WSsignal0_15[1] = 1;
                end
                else if (OS_counter0_15 >= kernelsize + (WS_width*kernelsize)) begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 1;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end
            default:begin
                if(OS_counter0_15 == 0+0 + (WS_width*kernelsize))begin
                    WSsignal0_15[3] = 1;
                    WSsignal0_15[2] = 1;
                    WSsignal0_15[1] = 1;
                    WSsignal0_15[0] = 1;
                end else begin
                    WSsignal0_15[3] = 0;
                    WSsignal0_15[2] = 0;
                    WSsignal0_15[1] = 0;
                    WSsignal0_15[0] = 0;
                end
            end
            endcase
        end else begin
            WSsignal0_15[0] = 0;            WSsignal0_15[1] = 0;            WSsignal0_15[2] = 0;            WSsignal0_15[3] = 0;
        end
    end else begin
        WSsignal0_15[0] = 0;        WSsignal0_15[1] = 0;        WSsignal0_15[2] = 0;        WSsignal0_15[3] = 0;
    end
end



endmodule

`timescale 1ns / 1ns

module tb();
reg clk,rst;

//input_totalnum指的是組共有多少運算需要被執行
//total_inputmapnum指的是一條input map有多少運算
//例如這邊input_totalnum有1000代表總共有五輪的weight可以運算
integer input_totalnum,total_inputmapnum;
logic [5:0] kernelsize;
logic same;
logic [18:0] OSIS[15:0][15:0];
logic [18:0] OSWS[15:0][15:0];
logic [18:0] WSIS[15:0][15:0];
logic [18:0] WSWS[15:0][15:0];

Controller1 inst(.clk(clk), .rst(rst), .kernelsize(kernelsize), .same(same), .OSIS(OSIS), .OSWS(OSWS), .WSIS(WSIS), .WSWS(WSWS), .input_totalnum(input_totalnum), .total_inputmapnum(total_inputmapnum));

initial begin 
    for(int a=0; a<=15 ; a=a+1)begin
        for(int b=0 ; b<=15 ; b=b+1)begin
            OSIS[a][b] = 1;
            OSWS[a][b] = 1;
            WSIS[a][b] = 1;
            WSWS[a][b] = 1;
        end
    end
    clk=1;
    rst=1;
    same=1;
    kernelsize = 2;
    input_totalnum = 1000;
    total_inputmapnum = 200;
    #10 rst=0;
    #1500 $finish;
end
always begin
    #1 clk=~clk;
end
endmodule

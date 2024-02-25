`timescale 1ns / 1ps

module tb();
// input clk,reset;
// input[1:0]  workstate;//開始給資料就變成1 運算結束變0
// input[24:0] penumx,penumy,sizex,sizey,kernelsize;
// output[24:0] tsv_out;
integer input_totalnum;
reg clk,rst;
integer kernelsize[1:0];
//reg [24:0] penumx,penumy,sizex,sizey,kernelsize;
logic[41:0]tsv_out[8:0][8:0];
Controller inst(.clk(clk), .rst(rst), .kernelsize(kernelsize), .tsv_out(tsv_out), .input_totalnum(input_totalnum));
//, .penumx(penumx), .penumy(penumy), .sizex(sizex), .sizey(sizey), .kernelsize(kernelsize)

initial begin 
    clk=1;
    rst=1;
    kernelsize[0] = 2;
    kernelsize[1] = 2;
    input_totalnum = 200;
    #10 rst=0;
    #1500 $finish;
end
always begin
    #1 clk=~clk;
end
endmodule

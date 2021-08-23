`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 16:31:55
// Design Name: 
// Module Name: BRAM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BRAM_tb(

    );
reg clk;
reg rst;
reg [31:0] addr;
//wire [31:0] r_addr;
//wire [31:0] r_data;
//wire hit;
//wire [10:1] cout;   
BRAM BRAM_test(
    .clk(clk),
    .rst(rst),
    .addr(addr)
    );

initial begin
rst = 1'b1;
clk = 1'b0;
#100 rst = 1'b0;
#100 rst = 1'b1;
//hit = 1'b0;
//cout = 1'b0;
addr = 0;
//#200
//addr = 8;
//#200
//addr = 12;

//#200
//addr = 0;
//#200
//addr = 4;
//forever
//begin
//#100 
//clk =~clk;
//addr=addr+4;
//end

end 

always #200 addr =addr+1;
always #100 clk =~clk;
 
endmodule

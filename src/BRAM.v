`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 15:23:55
// Design Name: 
// Module Name: BRAM
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


module BRAM(
input clk,               //时钟
input rst,                //复位信号，低电平有效
input [31:0] addr
    );    

reg[31:0]     w_addr;      //RAM PORT A 写地址
reg[31:0]    w_data;     //RAM PORT  A 写数据
reg          wea;        //RAM PORT  A 写使能，高电平有效
reg          enb;        //RAM PORT  B 读使能，高电平有效
reg[31:0]     r_addr;     //RAM PORT  B 读地址
wire[31:0]   r_data;    //RAM PORT   B 读数据
reg [8:0] cout;
reg hit;

always@(negedge rst) begin
    cout<=0;
    end 
    
always@(addr) begin     //posedge hit or negedge clk or negedge rst
    if(!rst)
        begin
        cout<=0;
        end
    else
        begin
        if(hit)
            begin
            cout<=cout+1;
            end
        end
    end

always@(posedge clk or negedge rst) begin
      if(!rst)begin
        hit<=0;
	     wea<=0;
	     enb<=1;
	     w_data<=0;
	     end

end 

////////////////////////////
/////////直接相连///////////
////////////////////////////

//  always @(*)  begin
//    if(!rst || (addr[3:0]!=0&&addr[3:0]!=4&&addr[3:0]!=8&&addr[3:0]!=12))begin
//        w_addr<=0;
//        r_addr<=0;
//        hit<=0; 
//    end
//    else begin
//        w_addr<=addr[10:4]*4+addr[3:0]/4;
//        r_addr=w_addr;
//        hit<=1;
//    end
//  end

////////////////////////////
/////////四路组相连/////////
////////////////////////////
  always @(*)  begin
    if(!rst || addr[31:11]>=4||(addr[3:0]!=0&&addr[3:0]!=4&&addr[3:0]!=8&&addr[3:0]!=12))begin
        w_addr<=0;
        r_addr<=0;
        hit<=0;
    end
    else begin
        w_addr<=addr[10:4]*16+addr[31:11]*4+addr[3:0]/4;
        r_addr=w_addr;
        hit<=1;
        
    end
  end

blk_mem_gen_0 ram_ip_test ( 
  .clka      (clk          ),            // input clka 
  .wea       (wea          ),            // input [0 : 0] wea 
  .addra     (w_addr       ),            // input [8 : 0] addra 
  .dina      (w_data       ),            // input [15 : 0] dina 
   .clkb     (clk          ),            // input clkb 
   .enb      (enb          ),
   .addrb    (r_addr       ),            // input [8 : 0] addrb 
   .doutb    (r_data       )             // output [15 : 0] doutb 
  ); 

endmodule

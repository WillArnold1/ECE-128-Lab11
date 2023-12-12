`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 05:19:26 PM
// Design Name: 
// Module Name: Multiplier_Top_TB
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


module Multiplier_Top_TB;

  reg clk, rst;
  reg [2:0] adr1_r, adr2_r, adr_ram;
  wire [7:0] result;
  wire [3:0] st_out;

  Multiplier_top uut (.clk(clk),.rst(rst),.adr1_r(adr1_r),.adr2_r(adr2_r),.adr_ram(adr_ram),.result(result),.st_out(st_out));

  
  always begin
    #5 clk = ~clk;
  end

 
  initial begin
    rst = 1;
    #10 
    rst = 0;
  end


  initial begin
    adr1_r = 3'b000;
    adr2_r = 3'b001;
    adr_ram = 3'b010;

    
    #15 adr1_r = 3'b001;  
    #15 adr2_r = 3'b010; 
    #15 adr_ram = 3'b011; 

    

    #10 $stop; 
  end

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 02:04:55 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiplier_top(clk, rst, adr1_r, adr2_r, adr_ram, result, st_out);

  // I/O declaration
  input clk, rst;
  input [2:0] adr1_r, adr2_r, adr_ram;
  output [7:0] result;
  output [3:0] st_out;
  
  wire [2:0] adr;
  wire w_rf;
  wire DA, SA, SB;
  wire [3:0] st_out;
  wire [2:0] w_ram;

  wire [3:0] A, B;
  wire D, W;
  
  wire [7:0] p;

  assign result = p;
  assign st_out = st_out;

  // Portmap
  ROM uut1 (.ROM_data(A), .ROM_addr(adr1_r));
  
  ROM uut6 (.ROM_data(B), .ROM_addr(adr2_r));
  
  Control_Unit uut4 (.clk(clk),.rst(rst),.adr1(adr1_r),.adr2(adr2_r),.w_rf(w_rf),.adr(adr),.DA(DA),.SA(SA),.SB(SB),.st_out(st_out),.w_ram(w_ram));

  Register_File uut5 (.clk(clk),.rst(rst),.A(A),.B(B),.SA(SA),.SB(SB),.D(D),.DA(DA),.W(W));

  Multiplier_Combinational uut2 (.a(A),.b(B),.p(p));

  RAM1 uut3 (.clk(clk),.rst(rst),.addr(adr_ram),.data_in(D),.read_en(st_out == 5'b0000),.write_en(st_out == 5'b0100),.data_out(result));




endmodule

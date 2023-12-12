`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 04:06:12 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit (
  input clk, rst,
  input [2:0] adr1,
  input [2:0] adr2,
  output reg w_rf,
  output reg [2:0] adr,
  output reg DA, SA, SB,
  output reg [3:0] st_out,
  output reg [2:0] w_ram
);

parameter S0_idle = 0, S1_send_adr1 = 1, S2_send_adr2 = 2, S3_multiply = 3, S4_write_ram = 4, S5_read_ram = 5;
reg [3:0] PS, NS;

always @(posedge clk or posedge rst)
begin
  if (rst)
    PS <= S0_idle;
  else
    PS <= NS;
end

always @(*)
begin
  case (PS)
    S0_idle:
    begin
      NS = S1_send_adr1;
      w_rf <= 0;
      w_ram <= 0;
      st_out <= S0_idle;
    end

    S1_send_adr1:
    begin
      NS = S2_send_adr2;
      w_rf <= 1;
      adr <= adr1;
      DA <= 1'b0;
      SA <= 1'b0;
      SB <= 1'b1;
      st_out <= S1_send_adr1;
    end

    S2_send_adr2:
    begin
      NS = S3_multiply;
      w_rf <= 0;
      adr <= adr2;
      DA <= 1'b1;
      SA <= 1'b0;
      SB <= 1'b1;
      st_out <= S2_send_adr2;
    end

    S3_multiply:
    begin
      NS = S4_write_ram;
      st_out <= S3_multiply;
      w_ram <= 1; 
    end

    S4_write_ram:
    begin
      NS = S5_read_ram;
      st_out <= S4_write_ram;
      
    end

    S5_read_ram:
    begin
      if (!rst)
        NS = S0_idle;
      else
        NS = S5_read_ram;
      w_ram <= 0; 
      st_out <= S5_read_ram;
    end
  endcase
end

endmodule
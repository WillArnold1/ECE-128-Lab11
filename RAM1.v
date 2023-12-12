`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 03:59:11 PM
// Design Name: 
// Module Name: RAM1
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


module RAM1 (
  input  clk,          // Clock input
  input  rst,          // Reset input
  input  [2:0] addr,   // Address input (3-bit for 8 locations)
  input wire [7:0] data_in, // Data input (8 bits)

  input  read_en,      // Read enable input
  input  write_en,     // Write enable input

  output reg [7:0] data_out // Data output (8 bits)
);

  // Internal memory array (8 locations, each 8 bits wide)
  reg [7:0] memory [7:0];
  integer i;
  always @(posedge clk) begin
    if (rst) begin
      // Reset memory to zero on positive edge of reset signal
      for ( i = 0; i < 8; i = i + 1) begin
        memory[i] <= 8'b0;
      end
    end 
    else begin
      // Read operation
      if (read_en) begin
        data_out <= memory[addr];
      end

      // Write operation
      if (write_en) begin
        memory[addr] <= data_in;
      end
    end
  end
endmodule

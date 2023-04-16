`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2023 13:04:40
// Design Name: 
// Module Name: memory
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


module memory(
    input clk,
    input [3:0] addr1, addr2,
    input [15:0] din1, din2,
    input we1, we2,
    output reg [15:0] dout1, dout2
    );
    
reg [15:0] mem[15:0];

always @(posedge clk) begin
  if (we1) mem[addr1] <= din1;
  if (we2) mem[addr2] <= din2;
  dout1 <= mem[addr1];
  dout2 <= mem[addr2];
end   
endmodule

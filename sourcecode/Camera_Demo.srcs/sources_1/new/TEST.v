`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:32:27
// Design Name: 
// Module Name: TEST
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


module TEST(
input clk,
input [23:0]rgb_data,
input rgb_x,
input rgb_y,
output reg [23:0] rgb_data_o
    );
    
    always@(posedge clk)
    begin
        if(rgb_x==640 && rgb_y==360)
            rgb_data_o<=rgb_data; 
    end
    
   
endmodule

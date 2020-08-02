`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:46:45
// Design Name: 
// Module Name: RGB
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

module RGB
(input sysclk,
 input [23:0] RGB1,
 input rst,
 output L
 );
  reg [7:0]R;
  reg [7:0]G;
  reg [7:0]B;
//reg [25:0]counter;
reg [3:0]cnt;
reg clk_10MHZ;  
always @(posedge sysclk)
begin
if(cnt<5)
cnt=cnt+1;
else
begin
cnt=1;
clk_10MHZ=~clk_10MHZ;
end
end

always@(posedge sysclk or negedge rst)
begin
if(rst==0)
//counter=0;
{R,G,B}=0;
else
begin
//if(counter>2000000)
         //begin
         if(RGB1[23:16]>RGB1[15:8]&&RGB1[23:16]>RGB1[7:0])
         begin
         R<=8'd255;
         {G,B}<=0;
		// counter<=counter+1;	
		 end
		 if(RGB1[15:8]>RGB1[23:16]&&RGB1[15:8]>RGB1[7:0])
         begin
         B<=8'd255;
         {R,G}<=0;
		 //counter<=counter+1;	
		 end	 
		 if(RGB1[7:0]>RGB1[15:8]&&RGB1[7:0]>RGB1[23:16])
         begin
         G<=8'd255;
         {R,B}<=0;
		// counter<=counter+1;	
		//end	 	 
     // if(counter>5000000)     
	     // counter=1;  
	// else
	// begin
	    //  counter=counter+1;
	    //  {R,G,B}=0;
	 //end
	 end
	 end
end


Driver_SK6805_0 your_instance_name (
  .R_In1(R),          // input wire [7 : 0] R_In1
  .G_In1(G),          // input wire [7 : 0] G_In1
  .B_In1(B),          // input wire [7 : 0] B_In1
  .R_In2(0),          // input wire [7 : 0] R_In2
  .G_In2(0),          // input wire [7 : 0] G_In2
  .B_In2(0),          // input wire [7 : 0] B_In2
  .clk_10MHz(clk_10MHZ),  // input wire clk_10MHz
  .Rst(rst),
  .LED_IO(L)        // output wire LED_IO
);



endmodule

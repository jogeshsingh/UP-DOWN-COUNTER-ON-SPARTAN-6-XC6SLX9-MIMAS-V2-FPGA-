`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:46 10/21/2021 
// Design Name: 
// Module Name:    Top_module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//

//////////////////////////////////////////////////////////////////////////////////

module Top_module
(
input  i_clk_fpga , 
input reset , 
input en , 
output [7:0] seven_seg , 
output [2:0] seg_en , 
output led 
    );
	 wire counter_en ;
	 parameter max_cnt = 50_000_000-1 ; //////maximum clock frequency counts upto 0 to 99_999_999 //
	 reg [26:0] counter_100M ;              /////  counter for counting upto 100_000_000// here 2^27 = 134_217_728/// /// 0 to 26 bit wide reg for counting upto 100MHZ/// 
	 reg [3:0] counter_up_down ;  ///counter counts from 0 to 9 ///
	 
	 assign seg_en = 3'b100 ; ////here the right most segment display is used to carry out the operation///
	 
	 ///instantiate the seven seg display module here///
	 ///seven_seg is connected to o_seven_seg///
	 //counter_up_down is connected to d_in///
seven_seg_display U1( counter_up_down,seven_seg );

///////creating a counter to divide 100MHZ FPGA clock to 1HZ ////
always @ (posedge i_clk_fpga , negedge reset)
  if(~reset)
    counter_100M <= 0;
	  else if (counter_100M == max_cnt)  /////reset every 50_000_000 clcok cycles//
	    counter_100M <= 0 ;
		  else
		    counter_100M <= counter_100M + 1'b1;
	 
	 
	 ///creating a counter to count from 0 to 9 at frequency of 1 HZ ///
	 
	 
	 always @(posedge i_clk_fpga )
	  begin
	   if (~reset)
		 counter_up_down <= 0 ;
		   else if (counter_en )  
				if (en==1'b1)
				counter_up_down <= counter_up_down + 1'b1;
				else
				 counter_up_down<= counter_up_down -1'b1 ;
				 end
			 /////assigning counter_en to enable the opeartion every 100M cycles////
			   assign counter_en = counter_100M == 0 ;
				
				////assigning led to show that seven segment display has counted till 9////
				assign led = counter_up_down ==  15;
			 
	 
	 
	 
	 
	 
	 
	 
	endmodule

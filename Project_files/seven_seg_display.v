`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:20:29 10/21/2021 
// Design Name: 
// Module Name:    seven_seg_display 
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
module seven_seg_display
	   #(parameter DATA_WIDTH1 = 4 , 
  parameter DATA_WIDTH2 = 8 
   )
(
    input [DATA_WIDTH1-1:0] d_in,
    output reg [DATA_WIDTH2-1:0] o_seven_seg 
    );
	
	always @(*)
	begin
	case(d_in)
	4'h0:o_seven_seg[DATA_WIDTH2-1:0] =	8'b0000_0011; ///digit 0
	4'h1:o_seven_seg[DATA_WIDTH2-1:0] = 8'b1001_1111; //digit 1
	4'h2:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0010_0101;  ///digit 2 
	4'h3:o_seven_seg[DATA_WIDTH2-1:0]=	8'b0000_1101; //digit 3
	4'h4:o_seven_seg[DATA_WIDTH2-1:0] = 8'b1001_1001; //digit 4 
	4'h5:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0100_1001; //digit 5 
	4'h6:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0100_0001; //digit 6
	4'h7:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0001_1111; //digit 7 
	4'h8:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0000_0001;  ///digit 8
	4'h9:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0001_1001;  //digit 9
	4'ha:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0001_0001;  ///digit 10 = a
	4'hb:o_seven_seg[DATA_WIDTH2-1:0] = 8'b1100_0001; //digit 11 = b
	4'hc:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0110_0011; //digit 12 = c
	4'hd:o_seven_seg[DATA_WIDTH2-1:0] = 8'b1000_0101;  //digit 13 = d
	4'he:o_seven_seg[DATA_WIDTH2-1:0] = 8'b0110_0001;  //digit 14 = e */
	default:o_seven_seg[DATA_WIDTH2-1:0]  = 8'b0000_0011; /// 0 
endcase
 end

endmodule




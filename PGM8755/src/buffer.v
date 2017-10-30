`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bryan Orabutt
// 
// Create Date:    	22:14:33 10/26/2017 
// Design Name: 		PGM8755
// Module Name:    	buffer
// Project Name:   	PGM8755
// Target Devices: 	Spartan 3E Starter Board, Mojo board (Spartan 6 xc6slx9-2tqg144)
// Description:  		Buffer to hold instruction bytes while EPROM is being programmed.
//////////////////////////////////////////////////////////////////////////////////
module buffer(input rst, clk, dir, input[7:0] data_in, input[10:0] address, output reg[7:0] data_out);
	
	reg[7:0] blockram [2047:0]; //2048 x 8 = 16Kbit buffer space
	reg[10:0] address_i; //internal address used while writing to buffer.
	
	/* If programmer is not enabled, dir = 0 and data is written to buffer.
	 * When programmer is enabled, dir = 1 and data is read from the buffer.
	 * Always write to the buffer first then enable the programmer.
	 */
	always@(posedge clk) begin
		if(rst) address_i <= 10'hFF0;
		if(dir) data_out <= blockram[address];
		else begin
			blockram[address_i] <= data_in;
			address_i <= address_i - 1'b1;
		end
	end
	
endmodule

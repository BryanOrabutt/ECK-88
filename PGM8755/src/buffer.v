`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bryan Orabutt
// 
// Create Date:    	22:14:33 10/26/2017 
// Design Name: 		PGM8755
// Module Name:    	buffer
// Project Name:   	PGM8755
// Target Devices: 	Spartan 3E Starter Board, Spartan 6 xc6slx9-2tqg144
// Description:  		Buffer to hold instruction bytes while EPROM is being programmed.
//////////////////////////////////////////////////////////////////////////////////
module buffer(input clk, dir, input[7:0] data_in, input[10:0] address, output reg[7:0] data_out);
	
	reg[7:0] blockram [2047:0]; //2048 x 8 = 16Kbit FIFO space
	
	always@(posedge clk) begin
		if(dir) data_out <= blockram[address];
		else blockram[address] <= data_in;
	end
	
endmodule

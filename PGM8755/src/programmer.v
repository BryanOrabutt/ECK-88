`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bryan Orabutt
// 
// Create Date:    	00:07:41 10/27/2017 
// Design Name: 	PGM8755
// Module Name:    	programmer
// Project Name:   	PGM8755
// Target Devices: 	Spartan 3E Starter Board, Spartan 6 xc6slx9-2tqg144
// Description:  	Module to perform 8755 EPROM programming and verification
//////////////////////////////////////////////////////////////////////////////////
module programmer(input clk, rst, input [7:0] data_in, output reg rdy, data_latch, 
				      output reg[10:0] addr_dat);
				  
	always@(posedge clk)begin
		if(rst) begin
			rdy <= 1'b0;
			data_latch <= 1'b0;
			addr_dat <= 11'b0;
		end
		else begin
			rdy <= ~rdy;
			addr_dat <= ~addr_dat;
			data_latch <= ~data_latch;
			addr_latch <= ~addr_latch;
		end
	end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SIUE
// Engineer: Bryan Orabutt
// 
// Create Date:    	21:43:50 10/26/2017 
// Design Name: 	PGM8755
// Module Name:		uart 
// Project Name:   	PGM8755
// Target Devices: 	Spartan 3E Starter Board, Mojo board (Spartan 6 xc6slx9-2tqg144)
// Description:  	UART to read data from host PC
//////////////////////////////////////////////////////////////////////////////////
module uart(input rst, rx, new_tx_data, clk, block, input[7:0] tx_data, output tx, busy,
				new_rx_data, output[7:0] rx_data);

	// CLK_PER_BIT is the number of cycles each 'bit' lasts for
	// rtoi converts a 'real' number to an 'integer'
	parameter CLK_RATE = 50000000;
	parameter SERIAL_BAUD_RATE = 500000;
	parameter CLK_PER_BIT = $rtoi($ceil(CLK_RATE/SERIAL_BAUD_RATE));

	serial_rx #(.CLK_PER_BIT(CLK_PER_BIT)) uart_rx(.clk(clk), .rst(rst), .rx(rx),
					.data(rx_data), .new_data(new_rx_data));

	serial_tx #(.CLK_PER_BIT(CLK_PER_BIT)) uart_tx(.clk(clk), .rst(rst), .tx(tx),
					.block(block), .busy(busy), .data(tx_data), .new_data(new_tx_data));

endmodule

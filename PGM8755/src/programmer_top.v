//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bryan Orabutt
// 
// Create Date:    	00:35:21 10/27/2017 
// Design Name: 		PGM8755
// Module Name:    	buffer
// Project Name:   	PGM8755
// Target Devices: 	Spartan 3E Starter Board, Mojo board (Spartan 6 xc6slx9-2tqg144)
// Description:  		Buffer to hold instruction bytes while EPROM is being programmed.
//////////////////////////////////////////////////////////////////////////////////
module programmer_top(input clk, rst_n, rx, output tx, prog_ce, vdd_25, vdd_5, output[7:0]led, output[10:0] address);

	wire rst = ~rst_n; // make reset active high

	wire[7:0] rx_data, buff_out;
	wire new_rx_data, new_tx_data, pgm_rdy, busy, prog_ce;

	programmer pgm(.clk(clk), .rst(rst), .data_latch(vdd_25), .addr_latch(prog_ce), .data_in(buff_out),
				   .rdy(pgm_rdy), .addr_dat(address));
				
	buffer buff(.clk(clk), .dir(pgm_rdy), .data_in(rx_data), .address(address), .data_out(buff_out));
												 
	uart #(.CLK_RATE(50000000), .SERIAL_BAUD_RATE(115200)) host(.rst(rst), .rx(rx), .new_tx_data(new_tx_data), 
		   .clk(clk), .tx_data(address[7:0]), .tx(tx), .new_rx_data(new_rx_data), .rx_data(rx_data), .busy(busy));
		   
	assign led[0] = new_rx_data;
	assign led[1] = new_tx_data;
	assign vdd_5 = ~vdd_25;

endmodule

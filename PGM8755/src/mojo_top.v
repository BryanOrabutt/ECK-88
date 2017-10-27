module mojo_top(input clk, rst_n, rx, output tx, output[7:0]led, output[10:0] address);

	wire rst = ~rst_n; // make reset active high

	wire[7:0] rx_data, buff_out;
	wire new_rx_data, new_tx_data, pgm_rdy, busy, prog_ce;

	programmer pgm(.clk(clk), .rst(rst), .data_latch(prog_ce), .addr_latch(ale), .data_in(buff_out),
				   .rdy(pgm_rdy), .addr_dat(address));
				
	buffer buff(.clk(clk), .dir(rdy), .data_in(rx_data), .address(address), .data_out(buff_out));
												 
	uart #(.CLK_RATE(50000000), .SERIAL_BAUD_RATE(115200)) host(.rst(rst), .rx(rx), .new_tx_data(new_tx_data), 
		   .clk(clk), .tx_data(address[7:0]), .tx(tx), .new_rx_data(new_rx_data), .rx_data(rx_data), .busy(busy));
		   
	assign led = 8'b0;

endmodule

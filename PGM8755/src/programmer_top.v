//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bryan Orabutt
// 
// Create Date:    	00:35:21 10/27/2017 
// Design Name: 		PGM8755
// Module Name:    	buffer
// Project Name:   	PGM8755
// Target Devices: 	Spartan 3E Starter Board, Mojo board (Spartan 6 xc6slx9-2tqg144)
// Description:  		Buffer to hold instruction bytes while EPROM is being programmed.
// Portlist:		clk - 50 MHz clock for all sequential eleents. (slower clocks derived
// 						in individual modules)
//			rst_n - low active reset button on board.
//			rx - UART receive line
//			mode - determines if FPGA is writing data or reading data. Should be
//				connected to a toggle switch. 0 = Verify, 1 = Program
//			en - enables/disables the programmer element. UART and Buffer reamin
//				active. Use to write to buffer before enabling programmer.
//				Connect this line to a toggle switch.
//			tx - UART transmit line
//			pce - 8755 prog/ce line control. 0 = CE state, 1 = Prog sate
//			rd - 8755 low active RD line. Used when verifying EPROM.
//			vdd_25 - +25V control line. 8755 VDD must be held at +25V while
//				latching data. This is a low active line to connect to a
//				PFET high side switch to +25V.
//			vdd_5 - +5V control line. 8755 VDD must be held at 5V while NOT
//				latching data. This is a low active line to connect to a
//				PFET high side switch to +5V.
//			ale - Address Latch Enable. Latches address into EPROM before
//				writing data.
//			led[1:0] - LED0 = RX indicator, LED1 = TX indicator
//			address - Multiplexed Address/data line. represents 10-bit
//				address when ALE is active, and represents 8-bit data
//				when data is being latched or read.
//////////////////////////////////////////////////////////////////////////////////
module programmer_top(input clk, rst_n, rx, mode, en, output tx, pce, rd, vdd_25, vdd_5, 
					  ale, output[1:0]led, output[10:0] address);

	wire rst = ~rst_n; // make reset active high

	wire[7:0] rx_data, buff_out; //UART received data, and blockram buffer output
	/* new_rx_data: flag to inicate a byte of RX data has been received and processed.
	 * new_tx_data: flag to indicate data is ready to be transmitted.
	 * busy: inidcates transmitter is in process of sending a byte
	 * block: forces transmitter into busy state.
	 */
	wire new_rx_data, new_tx_data, busy, block;
	
	
	programmer pgm(.clk(clk), .rst(rst), .data_latch(vdd_25), .data_in(buff_out), .rdy(new_tx_data), 
				   .tx_busy(busy), .addr_dat(address), .ce(pce), .rd(rd), .tx_block(block), .mode(mode), 
				   .en(en), .ale(ale));
				
	buffer buff(.rst(rst), .clk(clk), .dir(en), .data_in(rx_data), .address(address), .data_out(buff_out));
												 
	uart #(.CLK_RATE(50000000), .SERIAL_BAUD_RATE(115200)) host(.rst(rst), .rx(rx), .new_tx_data(new_tx_data), 
		   .clk(clk), .tx_data(address[7:0]), .tx(tx), .new_rx_data(new_rx_data), .rx_data(rx_data), 
		   .block(block), .busy(busy));
		   
	assign led[0] = new_rx_data;
	assign led[1] = new_tx_data;
	assign vdd_5 = ~vdd_25; //when not latching data hold vdd at 5V, otherwise hold at 25V

endmodule

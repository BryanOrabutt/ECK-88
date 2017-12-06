`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bryan Orabutt
// 
// Create Date:    	00:07:41 10/27/2017 
// Design Name: 	PGM8755
// Module Name:    	programmer
// Project Name:   	PGM8755
// Target Devices: 	Spartan 3E Starter Board, Mojo board (Spartan 6 xc6slx9-2tqg144)
// Description:  	Module to perform 8755 EPROM programming and verification
//////////////////////////////////////////////////////////////////////////////////
module programmer(input clk, rst, mode, en, tx_busy, input [7:0] data_in, output reg tx_block, rdy, 
				  ale, data_latch, ce, rd, output reg[10:0] addr_dat);
				  
	localparam PROGRAM = 2'b01, VERIFY = 2'b10, IDLE = 2'b00;

	reg[1:0] state; //state machine state (PROGRAM, IDLE, or VERIFY)
	reg[10:0] address; //intenrnal address assigned to adr_dat during ALE phase
	wire delay_rdy; //output of counter, determines when it's okay to move from data to ALE phase.
	wire ale_rdy; //output of counter, allows ALE to meet setup/hold times
	wire rd_wr_rdy; //output of counter, allows ~RD/WR wire to meet setup/hold times.
	wire prg_end; //allows settling time for data_latch
	
	/* start: starts the counter during the data phase.
	*  addr_state: indicates ALE phase (1) or data phase (0) during PROGRAM.
	*  tx_state: indicates ALE phase (0) or rd phase (1) during VERIFY.
	*/
	reg start, addr_state, tx_state, prg_fall;
	
	/* Counter will output 1 to delay_rdy after 50.002 ms. Output valid for 1 cycle (20 ns) */
	delay_cycles #(.WAIT_CYCLES(1000100)) prg_dly(.clk(clk), .rst(rst), .rdy(delay_rdy), .en(start));
	
	/* Counter will output 1 to ale_rdy after 60 ns. Output valid for 1 cycle (20 ns) */
	delay_cycles #(.WAIT_CYCLES(3)) ale_dly(.clk(clk), .rst(rst), .rdy(ale_rdy), .en(ale));	
	
	/* Counter will output 1 to ale_rdy after 2 us. Output valid for 1 cycle (20 ns) */
	delay_cycles #(.WAIT_CYCLES(100)) prg_fall_dly(.clk(clk), .rst(rst), .rdy(prg_end), .en(rd));
	
	/* Evaluate state machine every cycle */
	always@(posedge clk)begin
		if(rst) begin
			rdy <= 1'b0;
			data_latch <= 1'b1;
			addr_dat <= 11'b0;
			state <= IDLE;
			addr_state <= 1'b0;
			addr_state <= 1'b1;
			address <= 11'hFF0; //8088 resets to FFFF0
			rd <= 1'b1;
			tx_state <= 0;
			prg_fall <= 0;
		end
		else begin
			/* IDLE && ~en should stay in IDLE state */
			if(state == IDLE && ~en) begin
				start <= 0;
				rdy <= 0;
				addr_dat <= 11'b0;
				data_latch <= 0;
			end
			/* If en is high, check mode to see if we are programming or verifying */
			else if(state == IDLE && en) state <= (mode) ? PROGRAM:VERIFY;
			/* If we are programming begin programming routine */
			else if(state == PROGRAM && en) begin
				/* Check if we need to latch address or latch data */
				if(addr_state) begin //latch address
					ce <= 1'b0;
					addr_dat <= address; //put address on the bus
					ale <= 1; //ALE is high active
					if(ale_rdy) begin
						addr_state <= 1'b0; //change to data phase.
						data_latch <= 1'b1; //data_latch is low active.
						ale <= 0; //end address latch
					end
				end
				else begin
					start <= 1'b1; //hold start high during whole data phase
					rd <= 1'b1; //rd is low active. 
					if(~delay_rdy) begin //counter has not finished
						ce <= 1'b1; //hold ce/prog in the prog state
						addr_dat[7:0] <= data_in; //put data on the bus
						//ale <= 1'b0; //make sure ALE is not active
						data_latch <= 1'b0; //keep data latch on until counter is done
						prg_fall <= 1'b1;
					end
					else begin
						if(prg_end) begin
							addr_state <= 1'b1; //change to ALE phase
							address <= address - 1'b1; //decrement address
							start <= 1'b0; //stop counter
							prg_fall <= 1'b0;
						end
					end
				end
			end
			/* If we are verifying, begin verify routine */
			else if(state == VERIFY && en) begin
				ce <= 1'b0; //remain in ce state for whole verify phase
				if(~tx_state && ~tx_busy) begin //we are in ALE state
					rdy <= 1'b0; //not ready to transmit data
					ale <= 1'b1; //latch address
					addr_dat <= address; //put address on bus
					tx_state <= 1'b1; //change to read phase
					rd <= 1'b1;
					tx_block <= 1'b1; //do not transmit while latching address.
				end
				else begin //we are in RD phase
					tx_block <= 1'b0;
					rd <= 1'b0; //rd is low active
					rdy <= 1'b1; //we are ready to transmit data.
				end
			end
			else state <= IDLE;
		end
	end

endmodule

module delay_cycles(input clk, rst, en, output rdy);
	parameter WAIT_CYCLES = 1000000;
	parameter CTR_SIZE = $clog2(WAIT_CYCLES);
	
	reg[CTR_SIZE-1:0] counter;
	
	always@(posedge clk) begin
		if(rst || ~en) counter <= 0;
		else counter <= counter + 1'b1;
	end
	
	assign rdy = counter == WAIT_CYCLES;
	
endmodule

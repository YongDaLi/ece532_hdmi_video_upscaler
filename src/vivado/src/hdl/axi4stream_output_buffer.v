`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 04:22:29 AM
// Design Name: 
// Module Name: axi4stream_buffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module axi4stream_output_buffer #(
    parameter AXI_WIDTH = 1024,
    parameter BUFFER_WIDTH = 1024,
    parameter NUM_PACKETS = 1,
    parameter NUM_PACKETS_PER_TXN = NUM_PACKETS,
    parameter LAST_PACKET_WIDTH = AXI_WIDTH
)(
    // AXI Stream Master Interface
    input aclk,
    input areset,
    
    output[AXI_WIDTH-1:0] tdata,
    output tvalid,
    output tlast, 
    input tready,
    
    // Input
    input [BUFFER_WIDTH-1:0] input_buffer,
    input input_buffer_valid,
    
    // Probes
    output [7:0] state_probe,
    output [31:0] i_packet_probe,
    output [31:0] i_packet_in_txn_probe,
    output [31:0] shift_probe,
    output [31:0] i_init_probe
);  
    localparam STATE_NOT_READY = 0, STATE_READY = 1, STATE_TX = 2, STATE_UNINIT = 3, STATE_PRE_TX = 4;
    reg [7:0] state = STATE_NOT_READY;  // initial state, wait for 5 cycles
    
    reg [31:0] i_packet = 0;
    reg [31:0] i_packet_in_txn = 0;
    reg [31:0] shift = 0;
    reg [31:0] i_init = 0;

    // Utilities
    wire is_last_packet = i_packet == NUM_PACKETS - 1;
    wire is_last_packet_in_txn = i_packet_in_txn == NUM_PACKETS_PER_TXN - 1;
    
    // Statically assigned outputs.
    assign tvalid = state != STATE_UNINIT & state != STATE_NOT_READY;
    assign tdata = input_buffer >> shift; // TODO: masking issue
    assign tlast = is_last_packet_in_txn;
    
    // Setup probes.
    assign state_probe = state;
    assign i_packet_probe = i_packet;
    assign i_packet_in_txn_probe = i_packet_in_txn;
    assign shift_probe = shift;
    assign i_init_probe = i_init;
    
    always @(posedge aclk) begin
        case (state)
            STATE_UNINIT: begin
                if (i_init == 4) begin
                    state <= STATE_NOT_READY;
                    i_init <= 0;
                end
                else begin
                    if (tready)
                        i_init <= i_init + 1;
                end
            end
            
            STATE_NOT_READY: begin
                shift <= 0;
                if (input_buffer_valid)
                    state <= STATE_TX;
            end
            
            STATE_TX: begin
                if (tready) begin
                    if (is_last_packet_in_txn) begin
                        i_packet_in_txn <= 0;
                        shift <= shift + LAST_PACKET_WIDTH;
                    end else begin
                        i_packet_in_txn <= i_packet_in_txn + 1;
                        shift <= shift + AXI_WIDTH;
                    end
                    
                    if (is_last_packet) begin
                        i_packet <= 0;
                        state <= STATE_NOT_READY;
                    end else
                        i_packet <= i_packet + 1;
                end
            end
        endcase
    end
endmodule

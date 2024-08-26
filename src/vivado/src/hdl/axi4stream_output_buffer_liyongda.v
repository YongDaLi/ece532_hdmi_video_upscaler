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

/*
[4 4], [4 4], [4]
[4 4], [4 4], [4]

8 + 8 + 4
8 + 8 + 4
*/

module axi4stream_output_buffer_liyongda #(
    parameter PACKET_SIZE = 8,
    parameter NROWS = 2,
    parameter ROW_LENGTH = 20,
    parameter MYBUFFER_SIZE = NROWS * ROW_LENGTH
)(
    // AXI Stream Master Interface
    input aclk,
    input areset,
    
    output[PACKET_SIZE-1:0] tdata,
    output tvalid,
    output tlast, 
    input tready,

    // Input
    input [MYBUFFER_SIZE-1:0] myBuffer,
    input myBuffer_valid,

    // probing internal states
    output probe_transfer_in_progress,
    output probe_nshift,
    output probe_row_index,
    output probe_col_index
);  
    // Data Outputs
    reg [PACKET_SIZE-1:0] output_tdata = 0;
    reg output_tlast = 0;
    reg output_tvalid = 0;

    assign tdata = output_tdata;
    assign tlast = output_tlast;
    assign tvalid = output_tvalid;
    
    // internal variables
    reg [31:0] row_index = 0;       // starts at 0
    reg [31:0] col_index = 1;       // starts at 1
    reg [31:0] nshift = MYBUFFER_SIZE - PACKET_SIZE;        // first shift value

    // state variables
    reg transfer_in_progress = 0;

    // probe variables
    assign probe_transfer_in_progress = transfer_in_progress;
    assign probe_nshift = nshift;
    assign probe_row_index = row_index;
    assign probe_col_index = col_index;

    always @ (posedge aclk) begin
        if (myBuffer_valid) begin
            transfer_in_progress <= 1;
        end

        if (transfer_in_progress) begin
            // take the data
            output_tdata <= myBuffer >> nshift;
            output_tvalid <= 1;

            // only update to next cycle if slave is ready
            if (tready) begin
                // ---- update for next cycle ---
                // need to go to new row
                if ( (col_index) * PACKET_SIZE > ROW_LENGTH) begin
                    nshift <= MYBUFFER_SIZE - ( (row_index+1) * ROW_LENGTH);
                    row_index <= row_index + 1;
                    col_index <= 1;     // col_index starts counting at 1, but row_index starts counting at 0
                end
                // on same row
                else begin
                    nshift <= MYBUFFER_SIZE - (row_index*ROW_LENGTH + col_index*PACKET_SIZE);
                    col_index <= col_index + 1;
                end

                // row index updated out of bounds, we're finished, reset all values
                if (row_index > NROWS) begin
                    row_index <= 0;
                    col_index <= 1;
                    nshift <= MYBUFFER_SIZE - PACKET_SIZE;
                    transfer_in_progress <= 0;
                    output_tvalid <= 0;
                    output_tlast <= 1;
                end
            end

            // turn off tlast on the next cycle
            if (output_tlast) begin
                output_tlast = 0;
            end
        end
    end

endmodule

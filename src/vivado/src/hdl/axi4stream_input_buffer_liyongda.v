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

module axi4stream_input_buffer #(
    parameter AXI_PACKET_SIZE = 8,
    parameter BUFFER_SIZE = 40,
    parameter ROW_SIZE = 20,
    parameter N_ROWS = 2
)(
    // AXI Stream Slave Interface
    input aclk,
    input areset,
    
    input[AXI_PACKET_SIZE-1:0] tdata,
    input tvalid,
    input tlast, // Technically redundant, since this requires knowing the number of chunks. But, needed for DMA compat.
    output tready,
    
    // Output
    output [BUFFER_SIZE-1:0] buffer,
    output valid
);
    // For now, assume we are always ready to consume data.
    assign tready = 1;
    
    // Outputs
    reg [BUFFER_SIZE-1:0] output_buffer = 0; // The complete fetched data.
    reg output_valid = 0; // Whether the output is ready to consume.
    
    assign buffer = output_buffer;
    assign valid = output_valid;
    
    // When a stream starts, we interpret each data as a single chunk of the buffer.
    // We continue reading out until the tlast bit goes high.
    wire active_transaction = tvalid & tready;
    
    reg[31:0] nshift = 0;
    reg[31:0] row_index = 1;

    always @(posedge aclk) begin
        if (areset == 1) begin
            output_buffer <= 0;
            row_index = 1;
            nshift = 0;
        end 
        else begin
            if (active_transaction) begin
                // overflow the current AXI packet
                if ( (nshift + AXI_PACKET_SIZE) > (ROW_SIZE * row_index) ) begin
                    output_buffer <= output_buffer | (tdata << nshift); 
                    nshift <= (row_index) * ROW_SIZE;
                    row_index <= row_index + 1;
                end
                else begin
                    // normal case
                    output_buffer <= output_buffer | (tdata << nshift); 
                    nshift <= nshift + AXI_PACKET_SIZE;
                end
            end
            else begin
                output_buffer <= output_buffer;
            end
        end
    end

    /*
    reg [7:0] current_chunk = 0;
    
    // Control this buffer's higher order state.
    // When an incoming stream starts, start the buffering transaction.
    // Update the counter, until complete, then set the output to read.
    always @(posedge aclk) begin
        // A new set of input data is available for us to consume.
        if (active_transaction) begin            
            // End the transaction if complete.
            if (tlast) begin
                current_chunk <= 0;
                output_valid <= 1;
            end else begin // Otherwise, continue the transaction.
                // This logic is a bit tricky, as first transaction-cycle also requires data storage.
                // Therefore, the next always block must see the *old* value, hence the non-blocking assign.
                current_chunk <= current_chunk + 1;
                output_valid <= 0;
            end
        end
    end
    
    // In verilog, we cannot assign to memory regions using dynamic offsets.
    // So, we must pre-generate all of the store-logic.
    // These will simply be gated by an offset term, so they only store when required.
    genvar i_chunk; // The hypothetical offset number, for each generated store-r.
    generate
        for (i_chunk = 0; i_chunk < NUM_PACKETS; i_chunk = i_chunk + 1) begin
            always @(posedge aclk) begin : store_chunk                
                // If there is an ongoing transaction, and our internal state indicates
                // it is this chunk's turn to consume data, store it in this part of the output buffer.
                if (
                    (active_transaction)
                    && (i_chunk == current_chunk)
                ) begin : store_chunk_i
                    // Just some helpers: compute the location of this chunk in the total buffer.
                    localparam chunk_lsb = i_chunk * AXI_WIDTH;
                    
                    // We apply special logic for the last chunk, since the axi size may not divide evenly into the buffer.
                    // This lets us clip the msb if needed.
                    localparam chunk_msb = chunk_lsb + AXI_WIDTH - 1;
                    localparam max_chunk_msb = BUFFER_WIDTH - 1;
                    localparam chunk_msb_clipped = (chunk_msb > max_chunk_msb) ? max_chunk_msb : chunk_msb;
                    
                    output_buffer[chunk_msb_clipped:chunk_lsb] = tdata;
                end
            end
        end
    endgenerate

    */
endmodule

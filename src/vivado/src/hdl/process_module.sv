`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 01:05:05 AM
// Design Name: 
// Module Name: process_module
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

`include "types.sv"

// This is currently an empty shell, just to let us implement the rest of it.
module process_module();
    
    // In particular, this needs to route to other components.
    (*dont_touch="yes"*) chunk_input last_chunk;
    (*dont_touch="yes"*) chunk_input current_chunk;
    
    (*dont_touch="yes"*) chunk_output current_output_chunk;
    (*dont_touch="yes"*) chunk_output next_output_chunk;
    
    always @(*) begin
        for (int i = 0; i < CHUNK_SIZE; i++) begin
            for (int j = 0; j < INPUT_CELL_SIZE; j++) begin
                for (int k = 0; k < INPUT_CELL_SIZE; k++) begin
                    last_chunk[i][j][k] = (k % 2 == 0) ? {8'hFF, 8'hFF, 8'hFF} : {8'h0, 8'h0, 8'h0};
                end
            end
        end
    end
    
    processor p(
        .last_chunk(last_chunk),
        .current_chunk(current_chunk),
        .output_chunk_current(current_output_chunk),
        .output_chunk_next(next_output_chunk)
    );
endmodule

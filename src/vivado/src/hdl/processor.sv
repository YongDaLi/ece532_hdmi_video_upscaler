`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 11:50:53 PM
// Design Name: 
// Module Name: processor
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

module processor(
    input chunk_input last_chunk,
    input chunk_input current_chunk,
    output chunk_output output_chunk_current,
    output chunk_output output_chunk_next
    );
    
    // Frame Interpolation
    // Based on the current and last chunk, generate an in-between interpolated chunk.
    chunk_input interpolated_chunk;
    frame_interpolator_averaging interpolator(last_chunk, current_chunk, interpolated_chunk);
    
    // Resolution Upscalers
    // We process both the interpolated and current frame in parallel.
    resolution_upscaler_chunk interpolated_upscaler(interpolated_chunk, output_chunk_next);
    resolution_upscaler_chunk passthrough_upscaler(current_chunk, output_chunk_current);
endmodule

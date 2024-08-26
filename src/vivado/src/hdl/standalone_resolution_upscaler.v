`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2023 03:16:15 AM
// Design Name: 
// Module Name: standalone_resolution_upscaler
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


module standalone_resolution_upscaler #(
    // Careful. These must be changed alongside types.sv
    parameter CHUNK_SIZE = 64
) (
    input [(3 * 8) * (2 * 2) * CHUNK_SIZE-1:0] processor_packed_input,
    output [(3 * 8) * (3 * 3) * CHUNK_SIZE-1:0] processor_packed_output
);
    resolution_upscaler_chunk ruc (processor_packed_input, processor_packed_output);
endmodule

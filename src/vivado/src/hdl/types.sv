`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 10:45:55 PM
// Design Name: 
// Module Name: types
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
`ifndef TYPES
    `define TYPES

    parameter BIT_DEPTH = 8;

    // resolution_upscaler_cell.sv is hard-coded
    // will only work with 2x2 input, and 3x3 output
    parameter INPUT_CELL_SIZE = 2;
    parameter OUTPUT_CELL_SIZE = 3;
    
    parameter CHUNK_SIZE = 64;
    
    typedef bit [BIT_DEPTH - 1:0] color;
    typedef color[2:0] pixel;
    
    typedef pixel[INPUT_CELL_SIZE - 1:0][INPUT_CELL_SIZE - 1:0] cell_input;
    typedef cell_input[CHUNK_SIZE - 1:0] chunk_input;
    
    typedef pixel[OUTPUT_CELL_SIZE - 1:0][OUTPUT_CELL_SIZE - 1:0] cell_output;
    typedef cell_output[CHUNK_SIZE - 1:0] chunk_output;
`endif

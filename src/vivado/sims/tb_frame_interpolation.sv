`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2023 04:28:43 PM
// Design Name: 
// Module Name: tb_frame_interpolation
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

// test with 5x2 blocks of different colours
module tb_frame_interpolation();
    parameter BIT_DEPTH = 8;
    parameter ROW_WIDTH = 2;
    parameter N_LINES = 2;
    
    integer line, pixel, colour;
    integer i, j;
    
    // test output
    wire [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] output_generated;

    // test input frames
    reg [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] input_white;
    reg [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] input_black;
    reg [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] input_grey;
    reg [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] input_red;
    reg [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] input_green;
    reg [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] input_blue;
    
    // input wires
    reg [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] input_0;
    reg [N_LINES - 1:0][ROW_WIDTH - 1:0][2:0][BIT_DEPTH - 1:0] input_1;
    
    // initialize input frames
    initial begin
        for (line = 0; line < N_LINES; line = line + 1) begin
            for (pixel = 0; pixel < ROW_WIDTH; pixel = pixel + 1) begin
                for (colour = 0; colour < 3; colour = colour + 1) begin
                    input_white [line][pixel][colour] = 255;
                    input_black [line][pixel][colour] = 0;
                    input_grey [line][pixel][colour] = 127;
                    case (colour)
                        0: begin
                                input_red [line][pixel][colour] = 255;
                                input_green [line][pixel][colour] = 0;
                                input_blue [line][pixel][colour] = 0;
                            end
                        1: begin
                                input_red [line][pixel][colour] = 0;
                                input_green [line][pixel][colour] = 255;
                                input_blue [line][pixel][colour] = 0;
                            end
                        2: begin
                                input_red [line][pixel][colour] = 0;
                                input_green [line][pixel][colour] = 0;
                                input_blue [line][pixel][colour] = 255;
                            end
                    endcase
                end
            end
        end
        $display("initialized colours");
    end
            
    // instantiate frame interpolator
    frame_interpolator_averaging FI
    (
        .scanline_in_last(input_0),
        .scanline_in_current(input_1),
        .scanline_out(output_generated)
    );
    
    // test different inputs
    initial begin
        for (i = 0; i < 6; i = i + 1) begin
            case (i)
                0: input_0 = input_white;
                1: input_0 = input_black;
                2: input_0 = input_grey;
                3: input_0 = input_red;
                4: input_0 = input_green;
                5: input_0 = input_blue;
            endcase
            for (j = 0; j < 6; j = j + 1) begin
                case (j)
                    0: input_1 = input_white;
                    1: input_1 = input_black;
                    2: input_1 = input_grey;
                    3: input_1 = input_red;
                    4: input_1 = input_green;
                    5: input_1 = input_blue;
                endcase
            end
            #10 $display("Done case %d", i);
        end
    end
endmodule

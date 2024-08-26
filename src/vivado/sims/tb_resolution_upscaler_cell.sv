`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 12:28:50 AM
// Design Name: 
// Module Name: tb_resolution_upscaler_cell
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


module tb_resolution_upscaler_cell();
    reg [1:0][1:0][2:0][7:0] original;
    
    reg [2:0][2:0][2:0][7:0] expected;
    wire [2:0][2:0][2:0][7:0] upscaled;
    
    wire valid = expected == upscaled;
    
    resolution_upscaler_cell r(original, upscaled);
    
    initial begin
        // If input is all zeroes, the output should be too.
        original = {
            {{8'd0, 8'd0, 8'd0}, {8'd0, 8'd0, 8'd0}},
            {{8'd0, 8'd0, 8'd0}, {8'd0, 8'd0, 8'd0}}
        };
        expected = {
            {{8'd0, 8'd0, 8'd0}, {8'd0, 8'd0, 8'd0}, {8'd0, 8'd0, 8'd0}},
            {{8'd0, 8'd0, 8'd0}, {8'd0, 8'd0, 8'd0}, {8'd0, 8'd0, 8'd0}},
            {{8'd0, 8'd0, 8'd0}, {8'd0, 8'd0, 8'd0}, {8'd0, 8'd0, 8'd0}}
        };
        
        #10;
        
        // Try a simple example, with all 1s.
        // This should stay 1s.
        original = {
            {{8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}},
            {{8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}}
        };
        expected = {
            {{8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}},
            {{8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}},
            {{8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}}
        };
        
        #10;
        
        // A simple example with some variation (ie, actual averaging required.
        // Keep in mind that these are integer ops, no floating point.
        // This is also path-dependent on how we perform the central average,
        // Since it will round at each intermediate step.
        // So, avg(10, 0, 10, 10) = avg( avg(10, 0), avg(10, 10)) = avg(5, 10) = 7
        // As a very basic verification of color independence, keep one channel unchanged.
        original = {
            {{8'd10, 8'd10, 8'd10}, {8'd0, 8'd0, 8'd10}},
            {{8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}}
        };
        expected = {
            {{8'd10, 8'd10, 8'd10}, {8'd5, 8'd5, 8'd10}, {8'd0, 8'd0, 8'd10}},
            {{8'd10, 8'd10, 8'd10}, {8'd7, 8'd7, 8'd10}, {8'd5, 8'd5, 8'd10}},
            {{8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}, {8'd10, 8'd10, 8'd10}}
        };
        
        // TODO: add more complicated hand-verified example.
    end
endmodule

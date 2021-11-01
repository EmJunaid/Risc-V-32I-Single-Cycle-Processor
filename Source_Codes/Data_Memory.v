`timescale 1ns/1ns
module Data_Memory (
    input [31:0] WD,
    input [31:0] A,
    input clk,WE,rst,
    output reg [31:0] ReadData
);
    reg [31:0] Data_Mem [255:0];
    integer i;
    always @(*) begin
        ReadData <= Data_Mem[A];
    end
    always @(posedge clk) begin
        if (rst) begin
            for(i=0;i<255;i=i+1)
                Data_Mem[i] <= 32'd0;
        end else if (WE) begin
            Data_Mem[A] <= WD; 
        end
    end
    
    
endmodule
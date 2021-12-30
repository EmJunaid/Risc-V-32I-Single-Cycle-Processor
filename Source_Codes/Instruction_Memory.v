`timescale 1ns/1ns
module Instruction_Memory (
    input [31:0] PC,
    output reg [31:0] instruction
);
    reg [31:0] instructions_Value[31:0];

    initial begin
       //$readmemh("instruction.mem", instructions_Value);
       instructions_Value[0] <= 32'h00000000;
       instructions_Value[1] <= 32'h8CDEFAB7; //32'hFFC4A303; 0x8CDEFAB7
       instructions_Value[2] <= 32'h0064A423;
       instructions_Value[3] <= 32'h0062E233;
       instructions_Value[4] <= 32'hFE420AE3;
    end

    always@(*) begin
    instruction = instructions_Value[PC/4];
    end
endmodule

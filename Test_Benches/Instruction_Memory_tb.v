`timescale 1ns/1ns
module Instruction_Memory_tb ();
    reg [31:0] PC;
    wire [31:0] instruction;
    Instruction_Memory DUT (PC,instruction);

    initial begin
        PC=0;

        #50
        PC=32'd4;

        #50
        PC=32'd20;

        #50
        PC=32'd12;
    end
endmodule
`timescale 1ns/1ns
module Instruction_Fetch_tb();
    reg [31:0] Instructions;
    //reg clk;
    wire [4:0] A1,A2,A3;
    wire [6:0] OP;
    wire [2:0] funct3;
    wire funct7;
    wire [24:0] Imm;
    //wire [6:0] funct77;

    Instruction_Fetch DUT (Instructions,A1,A2,A3,OP,funct3,funct7,Imm);

 //   initial clk = 0;
//    always #5 clk=~clk;

    initial begin
        Instructions = 32'h00042403;

        #50
        Instructions = 32'h00060613;

    end
endmodule

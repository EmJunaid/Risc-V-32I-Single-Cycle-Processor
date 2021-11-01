`timescale 1ns/1ns
module Adress_Generator (
     input rst,clk,
     input PCSrc,
     input [31:0] ImmExt,
    output reg [31:0] PC
);
    reg[31:0] PCnext;
    always @(*) begin
            PCnext <= PCSrc?  PC + ImmExt : PC + 4;
        end
    always @(posedge clk) begin
        if (rst)
            PC <= 32'd0;
        else
            PC <= PCnext;    
    end 
    

endmodule
`timescale 1ns/1ns
module ALU_tb ();
    reg [31:0] RD1,SrcB;
    reg [3:0] ALUControl;
    wire [31:0] ALUResult;
    wire Zero;
    alu AAA (RD1,SrcB,ALUControl,ALUResult,Zero);
    initial begin
        RD1<=32'd100;
        SrcB<=32'd200;
        ALUControl<=4'd0;

        #50
        RD1<=32'd100;
        SrcB<=32'd200;
        ALUControl<=4'd1;

        #50
        RD1<=32'd100;
        SrcB<=32'd200;
        ALUControl<=4'd2;
    end
    
endmodule
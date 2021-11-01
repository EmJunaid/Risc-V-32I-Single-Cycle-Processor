`timescale 1ns/1ns
module mux2_tb();
    reg [31:0] ALUResult, ReadData;
    reg ResultSrc;
    wire [31:0] Result;
    mux2 mux(ALUResult, ReadData,ResultSrc,Result);

    initial begin
        ALUResult <= 32'd100;
        ReadData <= 32'd200;
        ResultSrc <= 0;

        #50

        ALUResult <= 32'd100;
        ReadData <= 32'd200;
        ResultSrc <= 1;

    end
endmodule
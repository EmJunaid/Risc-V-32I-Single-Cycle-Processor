`timescale 1ns / 1ns

module main(
    input rst, clk
);

    wire [31:0] WD,instruction,PC,ImmExt,ALUResult,RD1,RD2,ALUControl;
    wire [2:0] funct3;
    wire [31:0] SrcB;
    wire [31:0] Result;
    wire [31:0] ReadData;
    wire [4:0] A1,A2,A3;
    wire [24:0] Imm;
    wire [6:0] OP,funct77;
    wire [2:0] ImmSrc;
    wire funct7,Zero,PCSrc,Branch;
    wire [1:0] ResultSrc;
    wire WE3,WE,ALUSrc;


    Adress_Generator SSS (.rst(rst),.clk(clk),.PCSrc(PCSrc),.ImmExt(ImmExt),.PC(PC));
    Instruction_Memory AAA (.PC(PC),.instruction(instruction));
    Instruction_Fetch BBB (.instruction(instruction),.A1(A1),.A2(A2),.A3(A3),.OP(OP),.funct3(funct3),.funct7(funct7),.Imm(Imm),.funct77(funct77));
    Register_File CCC (.A1(A1),.A2(A2),.A3(A3),.WD3(Result),.clk(clk),.WE3(WE3),.rst(rst),.RD1(RD1),.RD2(RD2));
    mux3 #(32)   mux (.ALUResult(ALUResult),.ReadData(ReadData),.PC(PC),.ResultSrc(ResultSrc),.Result(Result));   //last mux
    mux #(32)   mux1 (.RD2(RD2),.ImmExt(ImmExt),.ALUSrc(ALUSrc),.SrcB(SrcB));
    alu DDD (.RD1(RD1),.SrcB(SrcB),.ALUControl(ALUControl),.funct3(funct3),.ALUResult(ALUResult),.Zero(Zero));
    extend EEE (.Imm(Imm),.ImmSrc(ImmSrc),.ImmExt(ImmExt));
    Data_Memory FFF (.WD(RD2),.A(ALUResult),.clk(clk),.WE(WE),.rst(rst),.ReadData(ReadData));
    Controller zzz (.OP(OP),.funct77(funct77),.funct3(funct3),.Zero(Zero),.funct7(funct7),.ResultSrc(ResultSrc),.PCSrc(PCSrc),.WE(WE),.ALUSrc(ALUSrc),.WE3(WE3),.Branch(Branch),.ALUControl(ALUControl),.ImmSrc(ImmSrc));
    
    




endmodule
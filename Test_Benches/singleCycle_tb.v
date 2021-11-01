`timescale 1ns/1ns
module singleCycle_tb ();
    reg rst,clk;
    wire [31:0] DM0,DM4,DM8,instruction,PC;
   // wire [4:0] A1,A2,A3;
   // wire [6:0] OP;
    wire [2:0] funct3;
    //wire funct7;
    //wire [24:0] Imm;
    //wire [6:0] funct77;
    wire [31:0] check_x4;
    wire [31:0] ImmExt;
    wire Zero,PCSrc,Branch;
    wire [31:0] ALUResult;
    wire [31:0] RD1,RD2;
    wire [3:0] ALUControl;

    main DYT(rst,clk,DM0,DM4,DM8,instruction,PC,funct3,check_x4,ImmExt,Zero,PCSrc,Branch,ALUResult,RD1,RD2,ALUControl);
    
    initial clk=0;
    always #5 clk=~clk;

    initial begin
        //@(posedge clk);
        rst=1;


        //@(posedge clk);
        #20

        rst=0;
       // @(posedge clk);
        //@(posedge clk);
        //@(posedge clk);
        //@(posedge clk);
        //@(posedge clk);
        //@(posedge clk);
        //@(posedge clk);
        //@(posedge clk);
        //$stop;
    end
endmodule
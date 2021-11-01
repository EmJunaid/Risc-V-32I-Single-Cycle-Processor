`timescale 1ns/1ns
module Adress_Generator_tb ();
    reg reset,PCSrc,clk;
    reg [31:0] Immext;
    wire [31:0] PC;

    Adress_Generator DUT (reset,clk,PCSrc,Immext,PC);
    initial clk=0;
     always #5 clk = ~clk;

    initial begin
        reset=1;
        PCSrc=0;
        Immext=32'h0;


        #10

        reset=0;
        PCSrc=0;
        Immext=32'h0;

        #10

        reset=0;
        PCSrc=1;
        Immext=32'd24;
        
        #10
        reset=0;
        PCSrc=0;
        Immext=32'h0;
        

    end    
    
    
endmodule
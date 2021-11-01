`timescale 1ns/1ns
module Data_Memory_tb ();
    reg [31:0] WD;
    reg [31:0] A;
    reg clk,WE,rst;
    wire [31:0] ReadData;
   //output reg [31:0] DM0,DM4,DM8
Data_Memory DUT(WD,A,clk,WE,rst,ReadData ); 
    initial clk=0;
    always #5 clk=~clk;
    initial
    begin
      rst=1;
      WE=1;
       WD=32'h27;
       A=32'ha;
       #20
       rst=0;
       #20
       WE=0;
       #20
       WE=0;
       A=32'h7;
       #20
       WE=0;
end
   

    
    
endmodule
`timescale 1ns/1ns
module Register_File_tb ();
    reg [4:0] A1,A2,A3;
    reg [31:0] WD3;
    reg clk,WE3,reset;
    wire [31:0] RD1,RD2;
    Register_File DUT (A1,A2,A3,WD3,clk,WE3,reset,RD1,RD2);

    initial clk=0;
    always #5 clk=~clk;

    initial begin
        A1 = 5'h1;
        A2 = 5'h3;
        A3 = 5'd1;
        reset = 1;
        WE3 = 1;
        WD3 = 32'd100;

        #50
        A1 = 5'h1;
        A2 = 5'h3;
        A3 = 5'h1;
        reset = 0;
        WE3 = 1;
        WD3 = 32'd100;

        #50
        WE3 = 0;

    end

endmodule
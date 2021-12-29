`timescale 1ns/1ns
module data_path (
    input clk,ready,rst,
    input [3:0] In1,In2,In3,In4,
    output reg [3:0] A0,A1,A2,A3
);
    reg [3:0] cs,ns;
    reg [1:0] c;
    reg done;
    reg [3:0] wire0,wire1,wire2,wire3,wire6,wire7,wire10,wire11,wire13;
    reg [1:0] d;
    reg [1:0] wire4,wire5,wire8,wire9,wire12;
    reg sel5,sel9,sel8,sel11,sel12;
    reg [1:0] sel1,sel2,sel3,sel4,sel6,sel7,sel10;
    reg wire14,wire15;


    // Registers
    always @(posedge clk) begin
        if(rst)
            A0 <= In1;
        else
            A0 <= wire0;    
    end

    always @(posedge clk) begin
        if(rst)
            A1 <= In2;
        else
            A1 <= wire1;    
    end

    always @(posedge clk) begin
        if(rst)
            A2 <= In3;
        else
            A2 <= wire2;    
    end

    always @(posedge clk) begin
        if(rst)
            A3 <= In4;
        else
            A3 <= wire3;    
    end

    always @(posedge clk) begin
        if(rst)
            c <= 2'b00;
        else
            c <= wire4;    
    end

    always @(posedge clk) begin
        if(rst)
            d <= 2'b00;
        else
            d <= wire5;    
    end

    //Muxes

    always @(*) begin
        wire0 <= sel5?  wire6 : A0;
    end

    always @(*) begin

        case (sel6)
            2'b00 : wire1 <= A1;
            2'b01 : wire1 <= wire7;
            2'b10 : wire1 <= wire6;  
            default: wire1 <=A1;
        endcase
        
    end

    always @(*) begin

        case (sel7)
            2'b00 : wire2 <= A2;
            2'b01 : wire2 <= wire7;
            2'b10 : wire2 <= wire6;  
            default: wire2 <= A2;
        endcase
        
    end

    always @(*) begin
        wire3 <= sel8?  wire7 : A3;
    end
    

    always @(*) begin
        wire4 <= sel9?  wire8 : c;
    end


    always @(*) begin

        case (sel10)
            2'b00 : wire5 <= d;
            2'b01 : wire5 <= wire9;
            2'b10 : wire5 <= 2'b00;  
            default: wire5 <= d;
        endcase
        
    end


    //2nd Muxes


    always @(*) begin

        case (sel3)
            2'b00 : wire10 <= A0;
            2'b01 : wire10 <= A1;
            2'b10 : wire10 <= A2; 
            2'b11 : wire10 <= A3; 
            default: wire10 <= A0;
        endcase
        
    end

    always @(*) begin

        case (sel4)
            2'b00 : wire6 <= A0;
            2'b01 : wire6 <= A1;
            2'b10 : wire6 <= A2; 
            2'b11 : wire6 <= A3; 
            default: wire6 <= A0;
        endcase
        
    end

    //swap reg

    always @(posedge clk ) begin
        wire7<=wire10;
    end

    //3rd Muxes

    always @(*) begin

        case (sel2)
            2'b00 : wire11 <= 2'b11;
            2'b01 : wire11 <= wire12;
            2'b10 : wire11 <= wire10;  
            default: wire11 <= 2'b11;
        endcase
        
    end

    always @(*) begin

        case (sel1)
            2'b00 : wire13 <= c;
            2'b01 : wire13 <= d;
            2'b10 : wire13 <= wire6;  
            default: wire13 <= c;
        endcase
        
    end

    reg f;
    //comparator
    always @(*) begin
        f <= (wire11>wire13);
    end


    //Adder Muxes

    always @(*) begin
        wire14 <= sel11?  1 : 0;
    end

    always @(*) begin
        wire15 <= sel12?  1 : 0;
    end

    //adders

    always @(*) begin
        wire8 <= c + wire14;
    end

    always @(*) begin
        wire9 <= d + wire15;
    end


    //subtracter

    always @(*) begin
        wire12 <= 3-c;
    end


    // State Machine


    
    parameter s0 = 4'b0000;
    parameter s1 = 4'b0001;
    parameter s2 = 4'b0010;
    parameter s3 = 4'b0011;
    parameter s4 = 4'b0100;
    parameter s5 = 4'b0101;
    parameter s6 = 4'b0110;
    parameter s7 = 4'b0111;
    parameter s8 = 4'b1000;
    parameter s9 = 4'b1001;
    parameter s10 = 4'b1010;
    parameter s11 = 4'b1011;
    parameter s12 = 4'b1100;

    //state reg
    always @(posedge clk) begin
        if(rst) cs<=s0;
        else cs <= ns;  
    end

    //next state logic

    always @(*) begin

        case (cs)
           s0 : ns <= ready? s1:s0;
           s1 : ns <= f? s2:s12;
           s2 : ns <= f? s3:s11;
           s3 : ns <= f? s4:s5;
           s4 : ns <= s5;
           s5 : ns <= f? s6:s11;
           s6 : ns <= f? s7:s8;
           s7 : ns <= s8;
           s8 : ns <= f? s9:s11;
           s9 : ns <= f? s10:s11;
           s10 : ns <= s11;
           s11 : ns <= s1;
           s12 : ns <= s0;
            default: ns <= s0;
        endcase
        
    end

    //Output logic

    always @(*) begin

        case (cs)
            s0 : begin
                sel1 <= 2'b00;
                sel2 <= 2'b00;
                sel3 <= 2'b00;
                sel4 <= 2'b00;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b00;
                sel11 <= 0;
                sel12 <= 0;
            end 

            s1 : begin
                sel1 <= 2'b00;
                sel2 <= 2'b00;
                sel3 <= 2'b00;
                sel4 <= 2'b00;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b10;
                sel11 <= 0;
                sel12 <= 1;
            end

            s2 : begin
                sel1 <= 2'b01;
                sel2 <= 2'b01;
                sel3 <= 2'b00;
                sel4 <= 2'b00;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b01;
                sel11 <= 0;
                sel12 <= 0;
            end

            s3 : begin
                sel1 <= 2'b10;
                sel2 <= 2'b10;
                sel3 <= 2'b00;
                sel4 <= 2'b01;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b00;
                sel11 <= 0;
                sel12 <= 0;
            end

            s4 : begin
                sel1 <= 2'b10;
                sel2 <= 2'b10;
                sel3 <= 2'b00;
                sel4 <= 2'b01;
                sel5 <= 1;
                sel6 <= 2'b01;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b00;
                sel11 <= 0;
                sel12 <= 0;
            end

            s5 : begin
                sel1 <= 2'b01;
                sel2 <= 2'b01;
                sel3 <= 2'b00;
                sel4 <= 2'b01;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b00;
                sel11 <= 0;
                sel12 <= 1;
            end

            s6 : begin
                sel1 <= 2'b10;
                sel2 <= 2'b10;
                sel3 <= 2'b01;
                sel4 <= 2'b10;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b01;
                sel11 <= 0;
                sel12 <= 0;
            end

            s7 : begin
                sel1 <= 2'b10;
                sel2 <= 2'b10;
                sel3 <= 2'b01;
                sel4 <= 2'b10;
                sel5 <= 0;
                sel6 <= 2'b10;
                sel7 <= 2'b01;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b00;
                sel11 <= 0;
                sel12 <= 0;
            end

            s8 : begin
                sel1 <= 2'b01;
                sel2 <= 2'b01;
                sel3 <= 2'b01;
                sel4 <= 2'b10;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b00;
                sel11 <= 0;
                sel12 <= 1;
            end

            s9 : begin
                sel1 <= 2'b10;
                sel2 <= 2'b10;
                sel3 <= 2'b10;
                sel4 <= 2'b11;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b01;
                sel11 <= 0;
                sel12 <= 0;
            end

            s10 : begin
                sel1 <= 2'b10;
                sel2 <= 2'b10;
                sel3 <= 2'b10;
                sel4 <= 2'b11;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b10;
                sel8 <= 1;
                sel9 <= 0;
                sel10 <= 2'b00;
                sel11 <= 0;
                sel12 <= 0;
            end

            s11 : begin
                sel1 <= 2'b10;
                sel2 <= 2'b10;
                sel3 <= 2'b10;
                sel4 <= 2'b11;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 1;
                sel10 <= 2'b00;
                sel11 <= 1;
                sel12 <= 0;
            end

            s12 : done <=1;
            
            default: begin
                sel1 <= 2'b00;
                sel2 <= 2'b00;
                sel3 <= 2'b00;
                sel4 <= 2'b00;
                sel5 <= 0;
                sel6 <= 2'b00;
                sel7 <= 2'b00;
                sel8 <= 0;
                sel9 <= 0;
                sel10 <= 2'b00;
                sel11 <= 0;
                sel12 <= 0;
            end
        endcase
        
    end


endmodule
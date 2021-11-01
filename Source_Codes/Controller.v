`timescale 1ns/1ns
module Controller (
    input [6:0] OP,funct77,
    input [2:0] funct3,
    input Zero,funct7,
    output reg PCSrc,WE,ALUSrc,WE3,Branch,
    output reg [1:0] ResultSrc,
    output reg [4:0] ALUControl,
    output reg [2:0] ImmSrc
);
    
    wire [16:0] checker;
    assign checker={{OP},{funct3},{funct77}};
    reg [1:0] ALUOp;
    always @(*) begin
        casex (OP)
            7'b0000011: begin  //lw
                Branch <= 0;
                ResultSrc <= 2'b01;
                WE <= 0;
                ALUSrc <= 1;
                WE3 <= 1;
                ALUOp <= 2'b00;
                ImmSrc <= 3'b000;
            end 

            7'b0100011:begin  //sw
                Branch <= 0;
                ResultSrc <= 2'bxx;
                WE <= 1;
                ALUSrc <= 1;
                WE3 <= 0;
                ALUOp <= 2'b00;
                ImmSrc <= 3'b001;
            end

            7'b0110011:begin  //R-type
                Branch <= 0;
                WE3 <= 1;
                ImmSrc <= 3'bxxx;
                ALUSrc <= 0;
                WE <= 0;
                ResultSrc <= 2'b00;
                ALUOp <= 2'b10;
            end

            7'b1100011:begin  //branch
                Branch <= 1;
                WE3 <= 0;
                ImmSrc <= 3'b010;
                ALUSrc <= 0;
                WE <= 0;
                ResultSrc <= 2'bxx;
                ALUOp <= 2'b01;
            end

            7'b0010011:begin  //I-Type
                Branch <= 0;
                WE3 <= 1;
                ImmSrc <= 3'b000;
                ALUSrc <= 1;
                WE <= 0;
                ResultSrc <= 2'b00;
                ALUOp <= 2'b10;
            end
            7'b1101111:begin //j
                Branch <= 0;
                WE3 <= 1;
                ImmSrc <= 3'b011;
                ALUSrc <= 0;
                 WE <= 0;
                 ResultSrc <= 2'b10;
                 ALUOp <= 2'b00;
            end
            7'b0110111:begin
                Branch <= 0;
                WE3 <= 1;
                ImmSrc <= 3'b100;
                ALUSrc <= 1;
                WE <= 0;
                ResultSrc <= 0;
                ALUOp <= 2'b00;
            end    
                
            default:begin
                Branch <= 0;
                WE3 <= 0;
                ImmSrc <= 3'b000;
                ALUSrc <= 0;
                WE <= 0;
                ResultSrc <= 0;
                ALUOp <= 2'b00;
            end 
            
        endcase
        
    end
    always @(*) begin
        PCSrc <= Zero && Branch;     
    end

    always @(*) begin
        case (checker)
            17'b01100110000000000: ALUControl <= 5'b00000;
            17'b01100110000100000: ALUControl <= 5'b00001;
            17'b01100110000000001: ALUControl <= 5'b00010;
            17'b01100111000000001: ALUControl <= 5'b00011;
            17'b01100111100000001: ALUControl <= 5'b00000;
            17'b01100111110000000: ALUControl <= 5'b01000;
            17'b01100111100000000: ALUControl <= 5'b01001;
            17'b01100111000000000: ALUControl <= 5'b01010;
            17'b01100110010000000: ALUControl <= 5'b00100; 
            17'b01100111010000000: ALUControl <= 5'b00101; 
            17'b0010011000xxxxxxx: ALUControl <= 5'b00000;
            17'b11000110001111111: ALUControl <= 5'b00001; 
            17'b1100011001xxxxxxx: ALUControl <= 5'b00001;
            17'b0000011010xxxxxxx: ALUControl <= 5'b00000;
            17'b0100011010xxxxxxx: ALUControl <= 5'b00000; 
            17'b0110111xxxxxxxxxx: ALUControl <= 5'b10000; 
            default: ALUControl <= 5'b00000;
        endcase
        
    end
endmodule
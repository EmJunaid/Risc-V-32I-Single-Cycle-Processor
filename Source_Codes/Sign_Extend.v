module extend(input  		[24:0] Imm,
              input  		[2:0]  ImmSrc,
              output reg 	[31:0] ImmExt);
    always @(*)
    case(ImmSrc)
         // I?type
    3'b000:     ImmExt = {{20{Imm[24]}}, Imm[24:13]};
		 // S?type (stores)
    3'b001:     ImmExt = {{20{Imm[24]}}, Imm[24:18], Imm[4:0]};
         // B?type (branches)
    3'b010:      ImmExt = {{20{Imm[24]}}, Imm[0],  Imm[23:18], Imm[4:1], 1'b0};                          // J?type (jal)
		// J?type (branches)
	3'b011:      ImmExt = {{12{Imm[24]}}, Imm[12:5],  Imm[13], Imm[23:14], 1'b0};
	   // U?type
	3'b100:      ImmExt = {Imm[24:5],12'b000000000000};
           
	default: 	ImmExt = 32'bx; // undefined
    endcase
endmodule
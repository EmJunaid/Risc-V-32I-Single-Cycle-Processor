module mux3 #(parameter WIDTH = 8)
                     (input  [WIDTH-1:0] ALUResult, ReadData, PC,
                      input  [1:0]       ResultSrc,
                      output [WIDTH-1:0] Result);
     assign Result = ResultSrc[1] ? PC+4 : (ResultSrc[0] ? ReadData : ALUResult);
endmodule
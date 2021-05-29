module ALU ( 
  input [2:0] Op_code,
  input [31:0] A, B,
  output reg [31:0] Y
);
parameter equalA=3'b000, Add = 3'b001,Subtract=3'b010,And=3'b011,Or=3'b100,IncreA=3'b101,DecreA=3'b110,equalB=3'b111;

always@(*)
case(Op_code)
	equalA		:Y<=A;
	Add			:Y<=A+B;
	Subtract	:Y<=A-B;
	And			:Y<=A&B;
	Or			:Y<=A|B;
	IncreA		:Y<=A+1'b1;
	DecreA		:Y<=A-1'b1;
	equalB		:Y<=B;
	default     :Y<=32'b0;
	endcase
	
endmodule

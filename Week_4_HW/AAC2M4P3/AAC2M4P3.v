module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);
reg [1:0]state;
parameter StateA=2'b00, StateB=2'b01, StateC=2'b10;

always@(posedge CLK)begin
	if(RST)
		state=StateA;
	else begin
		case(state)
			StateA:begin
				if(In1==1'b1)
					state<=StateB;
				else
					state<=StateA;
			end
			StateB:begin
				if(In1==1'b0)
					state<=StateC;
				else
					state<=StateB;
			end
			StateC:begin
				if(In1==1'b1)
					state<=StateA;
				else
					state<=StateC;
			end
			default
				state<=StateA;
		endcase
		if(state==StateC)
			Out1<=1'b1;
		else
			Out1<=1'b0;
	end
	end
	endmodule
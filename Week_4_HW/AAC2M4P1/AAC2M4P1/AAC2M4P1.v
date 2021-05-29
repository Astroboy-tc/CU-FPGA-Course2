module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output reg[3:0]Q,        // Parallel Output 	
    output reg RCO            // Ripple Carry Output (Terminal Count)
); 
always@(posedge CLK)
begin
	if(!CLR_n) 
		Q<=4'b0;
	else begin
		if(!LOAD_n)
			Q<=D;
		else if(ENP==1'b1 && ENT==1'b1)
			Q<=Q+1;
		else begin
			if(Q==4'b1111 && ENT==1'b1)
				RCO<=1'b1;
			else
				RCO<=1'b0;
		end
	end
end

endmodule
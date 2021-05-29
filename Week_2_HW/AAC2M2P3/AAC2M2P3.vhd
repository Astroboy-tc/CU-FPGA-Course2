library ieee;
use ieee.std_logic_1164.all;

entity FSM is
--generic(S_width: integer:=2;
--StateA:std_logic_vector(1 downto 0) := "00";
--StateB:std_logic_vector(1 downto 0) := "01";
--StateC:std_logic_vector(1 downto 0) := "10"
-- );
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;
--Architecture
architecture AAC2M2P3 of FSM is
	type state_type is (StateA,StateB,StateC);
	--signal CurrentState, NextState:std_logic_vector(S_width-1 downto 0)Register;
	signal CurrentState: state_type; 
begin
	clk_pro: process(CLK,RST)begin
		if(RST='1')then CurrentState <= StateA;
		elsif(rising_edge(CLK))then 
			case(CurrentState) is
			when StateA =>
				if(In1='1')then 
					CurrentState <= StateB;
					
				else
					CurrentState <= StateA;
				end if;
			when StateB =>
				if(In1='0')then 
					CurrentState <= StateC;
				else
					CurrentState <= StateB;
				end if;
			when StateC =>
				if(In1='1')then 
					CurrentState <= StateA;
				else
					CurrentState <= StateC;
				end if;
			when others =>  CurrentState <= StateA;
		end case;
		end if;
	end process clk_pro;
	Out1 <= '1' when CurrentState = StateC else '0'; 
end AAC2M2P3;

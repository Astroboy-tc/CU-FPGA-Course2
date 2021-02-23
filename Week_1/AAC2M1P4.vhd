--Use IEEE standard library
library IEEE;
use IEEE.std_logic_1164.all;

--Entity
Entity Majority is 
	port(
		A,B,C: in std_logic;
		Y: out std_logic);
end Majority;

--Architecture 
Architecture behavioral of Majority is
	begin 
	mylabel:process(A,B,C)
		begin
			if (A and B)='1' or (A and C)='1' or (B and C)='1' then
				Y <= '1';
			end if;
		end process mylabel;
	end behavioral;

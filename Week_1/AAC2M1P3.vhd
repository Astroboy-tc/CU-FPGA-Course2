----
-- Created by 林子喬 on 2021/02/23
--
-- Use standard IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

--entity
Entity find_errors is port(
	a: in bit_vector(0 to 3);
	b: out std_logic_vector(3 downto 0);
	c: in bit_vector(5 downto 0));
end find_errors;

--architecture
architecture not_good of find_errors is
	begin
	mylabel:process(a,c)
		begin
			if c ="111111" then--=x"F" then
				b<= to_stdlogicvector(a);
			else 
				b<="1010";
			end if;
		end process mylabel;
	end not_good;

				

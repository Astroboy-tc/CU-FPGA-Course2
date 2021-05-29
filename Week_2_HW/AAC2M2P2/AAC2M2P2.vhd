LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END ENTITY RAM128_32;

--Architecture
architecture mem of RAM128_32 is
	type ram_type is array(0 to 2**7) of std_logic_vector(31 DOWNTO 0);
	signal ram:ram_type;
begin
	process(clock)begin
		if(rising_edge(clock))then
			if(wren='1') then
				ram(to_integer(unsigned(address)))<= data;
				
			end if;
		end if;		
		q <= ram(to_integer(unsigned(address)));	
	end process;
end mem;

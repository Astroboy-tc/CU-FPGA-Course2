--Use IEEE standard library
library IEEE;
use IEEE.std_logic_1164.all;

--Entity
Entity FullAdd is port(
		A, B, Cin: in std_logic;
		Sum, Cout: out std_logic);
end FullAdd;

--Architecture 
Architecture behavioral of FullAdd is
	signal s: std_logic_vector(2 downto 0);
begin
	s(0) <= A xor B;
	s(1) <= A and B;
	s(2) <= s(0) and Cin;
	Sum <= s(0) xor Cin;
	Cout <= s(2) or s(1);

end behavioral;

--
-- 2bit_comparator.vhd
-- HW of Coursera
--  
-- HW designed by:  @author Tim Scherr 
--					University of Colorado
-- Created by 林子喬 on 2021/02/23
--
-- Use standard IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
Entity comparator2 is port(
	A, B : in std_logic_vector(1 downto 0);
	Equals : out std_logic);
end comparator2;

-- Architecture
Architecture dataflow of comparator2 is 
	signal s : std_logic_vector (3 downto 0);
begin
	s(0) <= (not A(1)) and (not A(0)) and (not B(1)) and (not B(0));
	s(1) <= (not A(1)) and A(0) and (not B(1)) and B(0);
	s(2) <= A(1) and (not A(0)) and B(1) and (not B(0));
	s(3) <= A(1) and A(0) and B(1) and B(0);

	Equals <= s(0) or s(1) or s(2) or s(3);
end dataflow;


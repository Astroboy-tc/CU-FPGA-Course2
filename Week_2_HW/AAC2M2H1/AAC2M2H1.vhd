LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
PORT( Op_code : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
A, B : IN STD_LOGIC_VECTOR( 31 DOWNTO 0 );
Y : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 ) );
END ALU;

--Architecture
architecture AAC2M2H1 of ALU is
	CONSTANT equalA		:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "000";
	CONSTANT Add		:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "001";
	CONSTANT Subtract	:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "010";
	CONSTANT AAndB		:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "011";
	CONSTANT AOrB		:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "100";
	CONSTANT incrementA	:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "101";
	CONSTANT decrementA	:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "110";
	CONSTANT equalB		:	STD_LOGIC_VECTOR( 2 DOWNTO 0 ) := "111"; 
begin
	process(Op_code)begin
		case(Op_code) is
			when equalA => Y<=A;
			when Add => Y<=A+B;
			when Subtract => Y<=A-B;
			when AAndB => Y<=A and B;
			when AOrB => Y<=A or B;
			when incrementA => Y<=A+1;
			when decrementA => Y<=A-1;
			when equalB => Y<=B;
			when others => Y<="00000000000000000000000000000000";
		end case;
	end process;


end AAC2M2H1; 
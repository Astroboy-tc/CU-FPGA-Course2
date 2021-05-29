library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO8x9 is
   port(
      clk, rst:		in std_logic;
      RdPtrClr, WrPtrClr:	in std_logic;    
      RdInc, WrInc:	in std_logic;
      DataIn:	 in std_logic_vector(8 downto 0);
      DataOut: out std_logic_vector(8 downto 0);
      rden, wren: in std_logic
	);
end entity FIFO8x9;

architecture RTL of FIFO8x9 is
	--signal declarations
	type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);  -- makes use of VHDL’s enumerated type
	signal fifo:  fifo_array;
	signal wrptr, rdptr: unsigned(2 downto 0);
	signal en: std_logic_vector(7 downto 0);
	signal dmuxout: std_logic_vector(8 downto 0);
begin
	FIFO_WRITE: process(clk,rst)
begin
	if rst = '1' then --reset must do 3 things: clear fifo elements, zero rdptr, and zero wrptr
		for i in 7 downto 0 loop
			fifo(i) <= (others => '0'); --this clears each element of the fifo one at a time
		end loop;
		wrptr <= (others => '0'); -- send wrptr to point at first element in fifo
		rdptr <= (others => '0'); -- sends rdptr to point at the first element in fifo
	elsif rising_edge(clk) then
		if wren = '1' then
			fifo(to_integer(wrptr)) <= DataIn; --writes input data to fifo at location indicated by the wrptr
		else 
			fifo(to_integer(wrptr)) <= fifo(to_integer(wrptr)); --keeps us from using memory. always have to show what occurs for other cases
		end if;
		if RdPtrClr = '1' then
			rdptr <= (others => '0'); -- sends rdptr to point at the first element in fifo
		elsif RdInc = '1' then
			rdptr <= rdptr + 1; --increment rdptr if enabled (dont know why rden cant handle this? but go off with the "no directions" approach profs, good job)
		end if;
		if WrPtrClr = '1' then
			wrptr <= (others => '0'); -- sends wrptr to point at the first element in fifo
		elsif WrInc = '1' then
			wrptr <= wrptr + 1; --increment wrptr if enabled 
		end if;
	end if;
end process;

------------------------reading data from FIFO buffer--------------------------
data_read: process(rden,rdptr)
begin
	if rden = '1' then 
		DataOut <= fifo(to_integer(rdptr)); --load the fifo element specified by rdptr into the DataOut when rden is 1
	else 
		DataOut <= (others => 'Z'); --high impedance if read isnt enabled
	end if;
end process;
end RTL;

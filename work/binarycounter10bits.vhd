--10 bit counter from Altera templates in Quartus.

-- Quartus Prime VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binarycounter10bits is

--	generic
--	(
--		MIN_COUNT : natural := 0;
--		MAX_COUNT : natural := 1023
--	);

	port
	(
		clk		  : in std_logic;
		reset	  : in std_logic;
		enable	  : in std_logic;
		--q		  : out integer range MIN_COUNT to MAX_COUNT
		q		  : out std_logic_vector(9 downto 0);
		
		--my addition
		cout	:	out std_logic
	);

end entity;

architecture rtl of binarycounter10bits is
begin

	process (clk)
		variable   cnt		   : integer;
	begin
		if (rising_edge(clk)) then

			if reset = '1' then
				-- Reset the counter to 0
				cnt := 0;

			elsif enable = '1' then
				-- Increment the counter if counting is enabled			   
				cnt := cnt + 1;
				
				--my addition
				if cnt = 1023 then
					cout <= '1';
				elsif cnt < 1023 then
					cout <= '0';
				end if;
				
			end if;
			
		end if;

		-- Output the current count
		--q <= cnt;
		--my_slv <= std_logic_vector(to_unsigned(my_int, my_slv'length));
		q <= std_logic_vector(to_unsigned(cnt, 10));
	end process;

end rtl;




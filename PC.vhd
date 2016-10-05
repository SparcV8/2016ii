library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           PEN : in  STD_LOGIC_VECTOR (31 downto 0);
           PSA : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is
begin
process (clk, reset, PEN)
begin
	if(rising_edge(clk))then
		if(reset = '1')then PSA <= (others => '0');
		else PSA <= PEN;
		end if;
	end if;
end process;
end Behavioral;


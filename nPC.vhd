library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NPC is
    Port ( en_NPC : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sa_NPC : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end NPC;

architecture ARQ_NPC of NPC is
begin
	process (en_NPC, reset, clk)
	begin
		if(rising_edge(clk))then
			if(reset = '1')then sa_NPC <= (others => '0');
			else sa_NPC <= en_NPC;
			end if;
		end if;
	end process;
end ARQ_NPC;


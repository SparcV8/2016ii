LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY TB_nPC IS
END TB_nPC;
 
ARCHITECTURE behavior OF TB_nPC IS 
  
    COMPONENT NPC
    PORT(
         en_NPC : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         sa_NPC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal en_NPC : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal sa_NPC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NPC PORT MAP (
          en_NPC => en_NPC,
          reset => reset,
          clk => clk,
          sa_NPC => sa_NPC
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      reset <= '1';
			wait for 100 ns;
      reset <= '0';
		en_NPC <= "00000000000000000000000000000001";
      wait for clk_period*10;
		en_NPC <= "00000000000000000000000000000010";
      wait for clk_period*10;
		en_NPC <= "00000000000000000000000000000011";
      wait for clk_period*10;
      wait;
   end process;

END;
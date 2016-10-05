LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_PC IS
END TB_PC;
 
ARCHITECTURE behavior OF TB_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         PEN : IN  std_logic_vector(31 downto 0);
         PSA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal PEN : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal PSA : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          clk => clk,
          reset => reset,
          PEN => PEN,
          PSA => PSA
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
--      reset <= '0';
		PEN <= "00000000000000000000000000000001";
		wait for 10 ns;
		PEN <= "00000000000000000000000000000010";
		wait for 10 ns;
		PEN <= "00000000000000000000000000000011";
      wait for clk_period*10;
      wait;
   end process;
END;

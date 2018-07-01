-- VHDL Test Bench Created from source file Interf_Inputs.vhd -- Sat Jun 30 11:43:51 2018
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Lattice recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "source->import"
-- menu in the ispLEVER Project Navigator to import the testbench.
-- Then edit the user defined section below, adding code to generate the 
-- stimulus for your design.
-- 3) VHDL simulations will produce errors if there are Lattice FPGA library 
-- elements in your design that require the instantiation of GSR, PUR, and
-- TSALL and they are not present in the testbench. For more information see
-- the How To section of online help.  
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 
	COMPONENT Interf_Inputs
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		data_in : IN std_logic_vector(7 downto 0);
		empty_buf : IN std_logic;          
		en : OUT std_logic;
		data_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL data_in :  std_logic_vector(7 downto 0);
	SIGNAL empty_buf :  std_logic;
	SIGNAL en :  std_logic;
	SIGNAL data_out :  std_logic_vector(7 downto 0);

BEGIN
-- Please check and add your generic clause manually
	uut: Interf_Inputs PORT MAP(
		clk => clk,
		reset => reset,
		data_in => data_in,
		empty_buf => empty_buf,
		en => en,
		data_out => data_out
	);

-- *** Test Bench - User Defined Section ***
   tb0 : PROCESS
   BEGIN
        clk <= '1'; wait for 3 ns;
        clk <= '0'; wait for 3 ns;
   END PROCESS;
   
   tb1 : PROCESS
   BEGIN
		reset <= '1'; wait for 3 ns;
		reset <= '0';
        empty_buf <= '0';
		data_in <= "10101010";	wait for 7 ns;
        data_in <= "11111111";	wait for 10 ns;
		empty_buf <= '1';		wait for 10 ns;
		empty_buf <= '0';		wait for 10 ns;
		data_in <= "00010001";	wait for 10 ns;
		empty_buf <= '1';		wait for 10 ns;
		data_in <= "11110000";	wait for 10 ns;
		empty_buf <= '0';		wait for 20 ns;
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
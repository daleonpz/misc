LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT Reception_blk   
	PORT(
            clk: in std_logic; 
            reset: in std_logic; 
            clk_spi: in std_logic;
            rx: in std_logic;
            Out_7Seg_LSB: out std_logic_vector(7 downto 0);
            Out_7Seg_MSB: out std_logic_vector(7 downto 0)
        );
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL reset :  std_logic;
	SIGNAL clk_spi :  std_logic;
	SIGNAL rx :  std_logic;
	SIGNAL Out_7Seg_LSB:  std_logic_vector(7 downto 0);
	SIGNAL Out_7Seg_MSB:  std_logic_vector(7 downto 0);

BEGIN

-- Please check and add your generic clause manually
	uut: Reception_blk PORT MAP(
		clk => clk,
		reset => reset,
		clk_spi => clk_spi,
		rx => rx,
		Out_7Seg_LSB => Out_7Seg_LSB,
                Out_7Seg_MSB => Out_7Seg_MSB 
	);


-- *** Test Bench - User Defined Section ***
    tb0 : PROCESS
   BEGIN
        clk <= '0'; wait for 5 ns;
        clk <= '1'; wait for 5 ns;
   END PROCESS;
   
   tb1 : PROCESS
   BEGIN
        rx <= '0';
        reset <= '1';
        wait for 15 ns;
        reset <= '0';
        wait for 60 ns;
        
        -- sync
        rx <= '0';
        clk_spi <= '1'; wait for 20 ns; 
        clk_spi <= '0'; wait for 20 ns;
        -- reception starts here 0101 0101
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
       
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        -- two more clk_spi
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
 
        wait for 200 ns;

        -- sync
        rx <= '0';
        clk_spi <= '1'; wait for 20 ns; 
        clk_spi <= '0'; wait for 20 ns;
        -- reception of 1100 1100 starts here 
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '1'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        -- two more clk_spi
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
        
        clk_spi <= '1'; wait for 15 ns; 
        rx <= '0'; wait for 5 ns;
        clk_spi <= '0'; wait for 20 ns;
 
        wait for 200 ns;
   END PROCESS;
   
-- *** End Test Bench - User Defined Section ***

END;


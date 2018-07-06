-- Bidirectional block

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity bidirectional is
    port ( 
            clk: in std_logic;
            reset: in std_logic; 
            
            -- Transmission ports
            push_button: in std_logic;
            dip_switch: in std_logic_vector(7 downto 0);
            clk_spi_out: out std_logic; 
            tx: out std_logic;

            -- Reception ports 
            clk_spi_in: in std_logic;
            rx: in std_logic; 
            Out_7Seg_LSB: out std_logic_vector(7 downto 0);
            Out_7Seg_MSB: out std_logic_vector(7 downto 0)
        );
end entity bidirectional;

architecture arch of bidirectional is

    component Transmission_blk is
        port(
            clk:    in  std_logic;
            reset:  in  std_logic;
            push_button:in  std_logic;
            dip_switch: in  std_logic_vector(7 downto 0);
            clk_spi: out std_logic;
            tx: out std_logic
        );
    end component Transmission_blk;

    component Reception_blk is
        port (  
            clk: in std_logic; 
            reset: in std_logic; 
            clk_spi: in std_logic;
            rx: in std_logic;
            Out_7Seg_LSB: out std_logic_vector(7 downto 0);
            Out_7Seg_MSB: out std_logic_vector(7 downto 0)
        );
    end component Reception_blk;

    signal iclk_spi: std_logic; 
    signal iPIN: std_logic;

begin 
    TX: Transmission_blk port map(
            clk  => clk,
            reset => reset, 
            push_button => push_button,
            dip_switch => dip_switch,
            clk_spi => clk_spi_out, 
            tx => tx );

    RX: Reception_blk port map(
            clk => clk,
            reset => reset,
            clk_spi => clk_spi_in,
            rx => rx,
            Out_7Seg_LSB => Out_7Seg_LSB, 
            Out_7Seg_MSB => Out_7Seg_MSB );

end architecture arch;



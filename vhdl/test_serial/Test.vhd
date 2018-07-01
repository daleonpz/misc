-- Transmission block

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

entity Test is 
    port(
            clk:    in  std_logic;
            reset:  in  std_logic;
            push_button:in  std_logic;
            dip_switch: in  std_logic_vector(7 downto 0);
            data: out std_logic_vector (7 downto 0);
            full_buf: out std_logic
    );
end entity Test;

architecture arch of Test is

    component Transmission_blk is
    port(
            clk:    in  std_logic;
            reset:  in  std_logic;
            push_button:in  std_logic;
            dip_switch: in  std_logic_vector(7 downto 0);
            clk_spi: out std_logic;
            tx: out std_logic
    );
	end component; 
    
    component spi_block_rx is
    port (  clk: in std_logic; 
            reset: in std_logic; 
            clk_spi: in std_logic;
            rx: in std_logic;
            data: out std_logic_vector (7 downto 0);
            full_buf: out std_logic
        );
	end component spi_block_rx; 
        -- Internal signals

    signal iclk_spi: std_logic;
    signal itx: std_logic;

begin
    
    TX: Transmission_blk port map(
            clk => clk,
            reset => reset, 
            push_button => push_button,
            dip_switch => dip_switch,
            clk_spi => iclk_spi,
            tx => itx
    );
    
    RX: spi_block_rx  port map (
            clk => clk,
            reset => reset,
            clk_spi => iclk_spi ,
            rx => itx,
            data => data, 
            full_buf => full_buf
        );
    
end architecture arch; 



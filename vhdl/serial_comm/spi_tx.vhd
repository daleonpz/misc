-- SPI transmitter 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_tx is
    port (  clk: in std_logic;
            reset: in std_logic; 
            en: in std_logic;
            data: in std_logic_vector (3 downto 0);
            empty_buf: out std_logic;
            tx: out std_logic;
            clk_spi: out std_logic 
         );
end entity spi_tx; 

architecture arch of spi_tx is
    component clk_generator
        port(   clk : in std_logic;
                reset : in std_logic;
		en : in std_logic;          
		clk_out : out std_logic	
            );
    end component;

    type STATES is (IDLE, SEND);
    signal state_next, state_reg: STATES;
    signal buf_next, buf_reg: std_logic_vector (3 downto 0);  
    signal count_next, count_reg: unsigned (2 downto 0); 
    signal empty_next, empty_reg: std_logic;
    signal tx_next, tx_reg: std_logic;  
    constant DBIT: integer := 4;   
begin

    SPI_CLK: clk_generator port map( 
                    clk => clk,
                    reset => reset,
                    en => en,
                    clk_out => clk_spi);

    -- FSMD: state and data registers
    process (clk, reset)
    begin
        if (reset = '1') then
            state_reg <= IDLE;
            buf_reg <= (others => '0');
            count_reg <= (others => '0');
            empty_reg <= '1';
            tx_reg <= '0';
	elsif ( rising_edge(clk)) then 
            state_reg <= state_next;
            buf_reg <= buf_next;
            count_reg <= count_next;
            empty_reg <= empty_next;  
            tx_reg <= tx_next; 
        end if;
    end process; 
    
    -- Control logic and data path
    process (en, state_reg, count_reg, buf_reg,
         empty_reg, tx_reg, data)
    begin
        state_next <= state_reg;
        count_next <= count_reg;
        buf_next <= buf_reg; 
        empty_next <= '1';
        tx_next <= tx_reg;
        
        if (en = '1') then
            case state_reg is
                when IDLE =>
                    state_next <= SEND;
                    buf_next <= data; 
                when SEND =>  
                    empty_next <= '0';
                    if ( count_reg = (DBIT-1)  ) then
                        count_next <= (others => '0');
                        state_next <= IDLE;
                        empty_next <= '1';
                    else 
                        count_next <= (count_reg + 1);
                        -- LSB is sent first
                        -- so we need to rotate the buffer
                        buf_next <= '0' & buf_reg(3 downto 1);
                        tx_next <= buf_reg(0);
                    end if; 
            end case;
        end if;
    end process;  
    
    empty_buf <= empty_reg;
    tx <= tx_reg;
end architecture arch;

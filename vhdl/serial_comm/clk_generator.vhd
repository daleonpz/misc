-- clk generator for the SPI communication
-- clk by default 0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_generator is
    port (  clk: in std_logic; 
            reset: in std_logic; 
            en: in std_logic;
            clk_out: out std_logic
         );
end entity clk_generator;

architecture arch of clk_generator is
    type STATES is (IDLE, ONE, ZERO, HOLD);
    signal state_next, state_reg: STATES; 
    signal clk_next, clk_reg: std_logic;
    -- when we are in HOLD we need to know the previous state
    signal state_h: STATES;     
    signal count_next, count_reg: unsigned (3 downto 0);
    constant MAX_COUNT: integer := 8;
begin

    -- FSMD: state and data registers
    process(clk, reset)
    begin
        if (reset = '1') then
            state_reg <= IDLE;
            clk_reg <= '0';
            count_reg <= (others => '0');
        elsif (clk'event and clk = '1') then
            state_reg <= state_next;
            clk_reg <= clk_next;
            count_reg <= count_next; 
        end if;
    end process;

    -- Control logic and data path
    process(state_reg, count_reg, en)
    begin
        state_next <= IDLE; 
        if (en = '1') then
            case state_reg is
                when IDLE => 
                    state_next <= ONE;
                when ONE =>
                    state_next <= HOLD;
                    state_h <= ZERO;
                    clk_next <= '1';
                when ZERO =>  
                    state_next <= HOLD;
                    state_h <= ONE;
                    clk_next <= '0';
                when HOLD => 
                    if (count_reg = MAX_COUNT - 1) then
                        count_next <= (others => '0');
                        state_next <= state_h;
                    else 
                        count_next <= count_reg + 1;
                    end if; 
           end case;
        end if;
    end process;
    clk_out <= clk_reg;
end architecture arch;


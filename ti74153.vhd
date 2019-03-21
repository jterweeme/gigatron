library ieee;
use ieee.std_logic_1164.all;

entity ti74153 is
    port (sel: in std_logic_vector(1 downto 0);
        g0_n, g1_n: in std_logic;
        c0, c1: in std_logic_vector(3 downto 0);
        y0, y1: out std_logic);
end entity;

architecture behavior of ti74153 is
signal mux0_out, mux1_out: std_logic;
begin
    y0 <= not g0_n and mux0_out;
    y1 <= not g1_n and mux1_out;

    process (sel, c0, c1)
    begin
        case sel is
            when "00" =>
                mux0_out <= c0(0);
                mux1_out <= c1(0);
            when "01" =>
                mux0_out <= c0(1);
                mux1_out <= c1(1);
            when "10" =>
                mux0_out <= c0(2);
                mux1_out <= c1(2);
            when "11" =>
                mux0_out <= c0(3);
                mux1_out <= c1(3);
        end case;
    end process;
end architecture;



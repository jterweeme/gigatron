library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock is
    port (clk50, rst_n: in std_logic; clk625: out std_logic);
end entity;

architecture behavior of clock is
signal cnt: unsigned(3 downto 0);
begin
    clk625 <= cnt(3);

    clockdiv: process (clk50, rst_n)
    begin
        if rst_n='0' then
            cnt <= (others => '0');
        elsif rising_edge(clk50) then
            cnt <= cnt + 1;
        end if;
    end process;
end architecture;



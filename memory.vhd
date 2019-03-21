library ieee;
use ieee.std_logic_1164.all;

entity memory is
    port (clk625, eh, el, oe_n, we_n: in std_logic;
        ram_in, x, y, d: in std_logic_vector(7 downto 0);
        q: out std_logic_vector(7 downto 0));
end entity memory;

architecture behavior of memory is
signal ram_a: std_logic_vector(14 downto 0);
signal ram_out: std_logic_vector(7 downto 0);
begin
    u36: entity work.ram port map (ram_a, clk625, ram_in, we_n, q);
    ram_a(7 downto 0) <= x when el='0' else d;
    ram_a(14 downto 8) <= y(6 downto 0) when eh='0' else (others => '1');
end architecture;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ti7483 is
    port(
        c0: in std_logic;
        c4: out std_logic;
        a, b: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(3 downto 0));
end entity;

architecture behavior of ti7483 is
signal tmp: unsigned(5 downto 0);
begin
    tmp <= ('0' & unsigned(a) & '1') + ('0' & unsigned(b) & c0);
    s <= std_logic_vector(tmp(4 downto 1));
    c4 <= tmp(5);
end architecture;



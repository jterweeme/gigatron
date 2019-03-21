library ieee;
use ieee.std_logic_1164.all;

entity alu is
port (
    al: in std_logic;
    sel: in std_logic_vector(3 downto 0);
    a, b: in std_logic_vector(7 downto 0);
    q: out std_logic_vector(7 downto 0);
    co: out std_logic);
end entity;

architecture behavior of alu is
signal out00, out01, out10, out11, out20, out21, out30, out31: std_logic;
signal out40, out41, out50, out51, out60, out61, out70, out71: std_logic;
signal carry: std_logic;
begin
    lu0: entity work.ti74153 port map(a(0) & b(0), '0', al, sel, "0101", out00, out01);
    lu1: entity work.ti74153 port map(a(1) & b(1), '0', al, sel, "0101", out10, out11);
    lu2: entity work.ti74153 port map(a(2) & b(2), '0', al, sel, "0101", out20, out21);
    lu3: entity work.ti74153 port map(a(3) & b(3), '0', al, sel, "0101", out30, out31);
    lu4: entity work.ti74153 port map(a(4) & b(4), '0', al, "0011", sel, out40, out41);
    lu5: entity work.ti74153 port map(a(5) & b(5), '0', al, "0011", sel, out50, out51);
    lu6: entity work.ti74153 port map(a(6) & b(6), '0', al, "0011", sel, out60, out61);
    lu7: entity work.ti74153 port map(a(7) & b(7), '0', al, "0011", sel, out70, out71);

    adder1: entity work.ti7483 port map(
        sel(0), carry, out00 & out10 & out20 & out30, out01 & out11 & out21 & out31, q(3 downto 0));

    adder2: entity work.ti7483 port map(
        carry, co, out40 & out50 & out60 & out70, out41 & out51 & out61 & out71, q(7 downto 4));
end architecture;



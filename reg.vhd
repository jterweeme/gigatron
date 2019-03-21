library ieee;
use ieee.std_logic_1164.all;

entity reg is
    port (ld_n, yl_n, ol_n, xl_n, ix, ae_n, clk625: in std_logic;
        alu: in std_logic_vector(7 downto 0);
        x, y, ac: out std_logic_vector(7 downto 0);
        r, g, b: out std_logic_vector(1 downto 0);
        hsync, vsync: out std_logic);
end entity;

architecture behavior of reg is
signal xc: std_logic;
begin
    u27: process (clk625, ld_n)
    begin
        if rising_edge(clk625) and ld_n='0' then
            ac <= alu;
        end if;
    end process;

    u29: entity work.ti74161 port map (clk625, '1', xl_n, ix, '1',
        alu(3 downto 0), x(3 downto 0), xc);

    u30: entity work.ti74161 port map (clk625, '1', xl_n, ix, xc,
        alu(7 downto 4), x(7 downto 4));

    u31: process (clk625, yl_n)
    begin
        if rising_edge(clk625) and yl_n='0' then
            y <= alu;
        end if;
    end process;

    u37: process (clk625, ol_n)
    begin
        if rising_edge(clk625) and ol_n='0' then
            r <= alu(1 downto 0);
            g <= alu(3 downto 2);
            b <= alu(5 downto 4);
            hsync <= alu(6);
            vsync <= alu(7);
        end if;
    end process;
end architecture;



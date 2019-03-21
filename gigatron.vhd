library ieee;
use ieee.std_logic_1164.all;

entity gigatron is
    port (
        clk50, rst_n: in std_logic;
        r, g, b: out std_logic_vector(1 downto 0);
        hsync, vsync: out std_logic);
end entity;

architecture behavior of gigatron is
signal ram_a: std_logic_vector(14 downto 0);
signal pc, rom_q: std_logic_vector(15 downto 0);

signal x_data, ac, xbus, xout, alu, y, ir, d, ram_out: std_logic_vector(7 downto 0);

signal ae_n, oe_n, al, el, eh, ph_n, pl_n, xl_n, yl_n, ld_n, de_n, ol_n, co, we_n,
        ix, ie_n, bf_n, clk625: std_logic;

signal ar: std_logic_vector(3 downto 0);
signal tmp0: std_logic_vector(1 downto 0);
begin
    clockdiv: entity work.clock port map (clk50, rst_n, clk625);
    xprg: entity work.prg port map (rst_n, clk625, pl_n, ph_n, xbus, y, ir, d);

    mem: entity work.memory port map (clk625, eh, el, '1', we_n, ac, x_data, y, d, ram_out);

    reg: entity work.reg port map (ld_n, yl_n, ol_n, xl_n, ix, ae_n, clk625, alu,
        x_data, y, ac, r, g, b, hsync, vsync);

    cu: entity work.cu port map (ir, co, ar, de_n, oe_n, ae_n, ie_n,
        eh, el, xl_n, yl_n, ix, al, pl_n, ph_n, we_n, ld_n, ol_n);

    -- bus gateway AC
    xbus <= ac when ae_n='0' else ram_out;

    xalu: entity work.alu port map (al, ar, xbus, ac, alu, co);
end architecture;




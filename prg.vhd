library ieee;
use ieee.std_logic_1164.all;

entity prg is
    port (rst_n, clk625, pl_n, ph_n: in std_logic;
        bus_in, y: in std_logic_vector(7 downto 0);
        ir, d: out std_logic_vector(7 downto 0));
end entity prg;

architecture behavior of prg is
signal pc, rom_q: std_logic_vector(15 downto 0);
signal u3c, u4c, u5c: std_logic;
begin
    u3: entity work.ti74161 port map (clk625, rst_n, pl_n, '1', '1',
        bus_in(3 downto 0), pc(3 downto 0), u3c);

    u4: entity work.ti74161 port map (clk625, rst_n, pl_n, '1', u3c,
        bus_in(7 downto 4), pc(7 downto 4), u4c);

    u5: entity work.ti74161 port map (clk625, rst_n, ph_n, pl_n, u4c,
        y(3 downto 0), pc(11 downto 8), u5c);

    u6: entity work.ti74161 port map (clk625, rst_n, ph_n, pl_n, u5c,
        y(7 downto 4), pc(15 downto 12));
		  
    u7: entity work.rom port map (pc, clk625, rom_q);
		  
    u8: process (rst_n, clk625, rom_q)
    begin
        if rst_n='0' then
            ir <= (others => '0');
            d <= (others => '0');
        elsif rising_edge(clk625) then
            ir <= rom_q(7 downto 0);
            d <= rom_q(15 downto 8);
        end if;
    end process;
end architecture behavior;



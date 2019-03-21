library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ti74161 is
    port (
        clk, rst_n, load_n, enp, ent: in std_logic;
        a: in std_logic_vector(3 downto 0);
        q: out std_logic_vector(3 downto 0);
        c4: out std_logic
    );
end entity;

architecture behavior of ti74161 is
signal cnt: unsigned(3 downto 0);
begin
    c4 <= '1' when cnt="1111" and ent='1' else '0';
    q <= std_logic_vector(cnt);

    process (clk, rst_n) begin
        if rst_n='0' then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            if load_n='1' then
                if ent='1' and enp='1' then
                    cnt <= cnt + 1;
                end if;
            else
                cnt <= unsigned(a);
            end if;
        end if;
    end process;
end architecture behavior;




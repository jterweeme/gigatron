library ieee;
use ieee.std_logic_1164.all;

entity cu is
    port (ir: in std_logic_vector(7 downto 0);
        co: in std_logic;
        ar: out std_logic_vector(3 downto 0);

        de_n, oe_n, ae_n, ie_n, eh, el,
            xl_n, yl_n, ix, al, pl_n, ph_n, we_n, ld_n, ol_n: out std_logic);
end entity;

architecture behavior of cu is
signal bf_n, op_ld, op_and, op_or, op_xor, op_add,
    cond, op_sub, op_st, bcc, xph_n: std_logic;
begin
    xph_n <= bcc or bf_n;
    ph_n <= xph_n;
    pl_n <= xph_n;
    we_n <= op_st;
    ol_n <= op_st;
    ld_n <= op_st;

    de_n <= '0' when ir(1 downto 0)="00" else '1';
    oe_n <= '0' when ir(1 downto 0)="01" else '1';
    ae_n <= '0' when ir(1 downto 0)="10" else '1';
    ie_n <= '0' when ir(1 downto 0)="11" else '1';
    bf_n <= '0' when ir(4 downto 2)="000" else '1';

    -- instruction decoder
    op_ld <= '0' when ir(7 downto 5)="000" else '1';
    op_and <= '0' when ir(7 downto 5)="001" else '1';
    op_or <= '0' when ir(7 downto 5)="010" else '1';
    op_xor <= '0' when ir(7 downto 5)="011" else '1';
    op_add <= '0' when ir(7 downto 5)="100" else '1';
    op_sub <= '0' when ir(7 downto 5)="101" else '1';
    op_st <= '0' when ir(7 downto 5)="110" else '1';
    bcc <= '0' when ir(7 downto 5)="111" else '1';
    al <= '0' when bcc='1' or ir(7)='1' else '1';

    -- mode decoder
    eh <= '0' when ir(4 downto 2)="010" else '1';
    el <= '0' when ir(4 downto 2)="011" else '1';
    xl_n <= '0' when ir(4 downto 2)="100" else '1';
    yl_n <= '0' when ir(4 downto 2)="101" else '1';
    ix <= '0' when ir(4 downto 2)="111" else '1';


end architecture;




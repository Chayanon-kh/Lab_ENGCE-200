library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_alu_4bit is
end tb_alu_4bit;
architecture behavior of tb_alu_4bit is
    component alu_4bit
    Port (
        M, S1, S0 : in  STD_LOGIC;
        Cin_in : in  STD_LOGIC;
        A4, A3, A2, A1, A0 : in STD_LOGIC;
        B4, B3, B2, B1, B0 : in STD_LOGIC;
        Cin, GB, FB, GA, FA : out STD_LOGIC;
        Mini0, Mini1, Mini2, Mini3, Mini4 : out STD_LOGIC;
        C0, C1, C2, C3, C4 : out STD_LOGIC;
        F0, F1, F2, F3, F4 : out STD_LOGIC;
        Co : out STD_LOGIC
    );
    end component;
    signal M,S1,S0,Cin_in : STD_LOGIC;
    signal A4,A3,A2,A1,A0 : STD_LOGIC;
    signal B4,B3,B2,B1,B0 : STD_LOGIC;
    signal Cin,GB,FB,GA,FA : STD_LOGIC;
    signal Mini0,Mini1,Mini2,Mini3,Mini4 : STD_LOGIC;
    signal C0,C1,C2,C3,C4 : STD_LOGIC;
    signal F0,F1,F2,F3,F4 : STD_LOGIC;
    signal Co : STD_LOGIC;
begin
    DUT : alu_4bit
    port map(
        M => M,
        S1 => S1,
        S0 => S0,
        Cin_in => Cin_in,
        A4 => A4,
        A3 => A3,
        A2 => A2,
        A1 => A1,
        A0 => A0,
        B4 => B4,
        B3 => B3,
        B2 => B2,
        B1 => B1,
        B0 => B0,
        Cin => Cin,
        GB => GB,
        FB => FB,
        GA => GA,
        FA => FA,
        Mini0 => Mini0,
        Mini1 => Mini1,
        Mini2 => Mini2,
        Mini3 => Mini3,
        Mini4 => Mini4,
        C0 => C0,
        C1 => C1,
        C2 => C2,
        C3 => C3,
        C4 => C4,
        F0 => F0,
        F1 => F1,
        F2 => F2,
        F3 => F3,
        F4 => F4,
        Co => Co
    );
    process
    begin
        -- A = 10101 1+4+16 = 21
        -- B = 01100 4+8 = 12

        A4 <= '0';
        A3 <= '0';
        A2 <= '1';
        A1 <= '1';
        A0 <= '0';

        B4 <= '1';
        B3 <= '1';
        B2 <= '0';
        B1 <= '0';
        B0 <= '1';

        -- A
        M <= '0'; S1 <= '0'; S0 <= '0'; Cin_in <= '0';
        wait for 20 ns;

        -- A+1
        M <= '0'; S1 <= '0'; S0 <= '0'; Cin_in <= '1';
        wait for 20 ns;

        -- A+B
        M <= '0'; S1 <= '0'; S0 <= '1'; Cin_in <= '0';
        wait for 20 ns;

        -- A+B+1
        M <= '0'; S1 <= '0'; S0 <= '1'; Cin_in <= '1';
        wait for 20 ns;

        -- A+B'
        M <= '0'; S1 <= '1'; S0 <= '0'; Cin_in <= '0';
        wait for 20 ns;

        -- A-B
        M <= '0'; S1 <= '1'; S0 <= '0'; Cin_in <= '1';
        wait for 20 ns;

        -- A'+B
        M <= '0'; S1 <= '1'; S0 <= '1'; Cin_in <= '0';
        wait for 20 ns;

        -- B-A
        M <= '0'; S1 <= '1'; S0 <= '1'; Cin_in <= '1';
        wait for 20 ns;

        -- AND
        M <= '1'; S1 <= '0'; S0 <= '0'; Cin_in <= '0';
        wait for 20 ns;

        -- OR
        M <= '1'; S1 <= '0'; S0 <= '1'; Cin_in <= '0';
        wait for 20 ns;

        -- XOR
        M <= '1'; S1 <= '1'; S0 <= '0'; Cin_in <= '0';
        wait for 20 ns;

        -- XNOR
        M <= '1'; S1 <= '1'; S0 <= '1'; Cin_in <= '0';
        wait for 20 ns;

        wait;

    end process;

end behavior;
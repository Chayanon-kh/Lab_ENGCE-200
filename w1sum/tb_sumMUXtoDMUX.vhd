library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_sumMUXtoDMUX is
end tb_sumMUXtoDMUX;
architecture sim of tb_sumMUXtoDMUX is
  signal D      : std_logic_vector(15 downto 0);
  signal S_MUX  : std_logic_vector(3 downto 0);
  signal S_DMUX : std_logic_vector(3 downto 0);
  signal Y      : std_logic_vector(15 downto 0);

  -- ??? D ?????????????? 
  signal D0  : std_logic := '0';
  signal D1  : std_logic := '0';
  signal D2  : std_logic := '0';
  signal D3  : std_logic := '0';
  signal D4  : std_logic := '0';
  signal D5  : std_logic := '0';
  signal D6  : std_logic := '0';
  signal D7  : std_logic := '0';
  signal D8  : std_logic := '0';
  signal D9  : std_logic := '0';
  signal D10 : std_logic := '0';
  signal D11 : std_logic := '0';
  signal D12 : std_logic := '0';
  signal D13 : std_logic := '0';
  signal D14 : std_logic := '0';
  signal D15 : std_logic := '0';

  -- ??? Y ?????????????? 
  signal Y0  : std_logic;
  signal Y1  : std_logic;
  signal Y2  : std_logic;
  signal Y3  : std_logic;
  signal Y4  : std_logic;
  signal Y5  : std_logic;
  signal Y6  : std_logic;
  signal Y7  : std_logic;
  signal Y8  : std_logic;
  signal Y9  : std_logic;
  signal Y10 : std_logic;
  signal Y11 : std_logic;
  signal Y12 : std_logic;
  signal Y13 : std_logic;
  signal Y14 : std_logic;
  signal Y15 : std_logic;

begin

  ---------------------------------------------------------------- 
  -- ??? D0-D15 ???? Bus 
  ---------------------------------------------------------------- 

  D <= D15 & D14 & D13 & D12 &
    D11 & D10 & D9 & D8 &
    D7 & D6 & D5 & D4 &
    D3 & D2 & D1 & D0;

  ---------------------------------------------------------------- 
  -- ??? Y 
  ---------------------------------------------------------------- 

  Y0  <= Y(0);
  Y1  <= Y(1);
  Y2  <= Y(2);
  Y3  <= Y(3);
  Y4  <= Y(4);
  Y5  <= Y(5);
  Y6  <= Y(6);
  Y7  <= Y(7);
  Y8  <= Y(8);
  Y9  <= Y(9);
  Y10 <= Y(10);
  Y11 <= Y(11);
  Y12 <= Y(12);
  Y13 <= Y(13);
  Y14 <= Y(14);
  Y15 <= Y(15);

  ---------------------------------------------------------------- 
  -- DUT 
  ---------------------------------------------------------------- 

  uut : entity work.mux_dmux16
    port map
    (
      D      => D,
      S_MUX  => S_MUX,
      S_DMUX => S_DMUX,
      Y      => Y
    );

  ---------------------------------------------------------------- 
  -- Truth Table Test 
  ---------------------------------------------------------------- 

  process
  begin

    D5     <= '1';
    S_MUX  <= "0101";
    S_DMUX <= "1001";
    wait for 10 ns;
    D9 <= '1';

    D1     <= '1';
    S_MUX  <= "0001";
    S_DMUX <= "0001";
    wait for 10 ns;
    D1 <= '0';

    D2     <= '1';
    S_MUX  <= "0010";
    S_DMUX <= "0010";
    wait for 10 ns;
    D2 <= '0';

    D3     <= '1';
    S_MUX  <= "0011";
    S_DMUX <= "0011";
    wait for 10 ns;
    D3 <= '0';

    D4     <= '1';
    S_MUX  <= "0100";
    S_DMUX <= "0100";
    wait for 10 ns;
    D4 <= '0';

    D5     <= '1';
    S_MUX  <= "0101";
    S_DMUX <= "1001";
    wait for 10 ns;
    D5 <= '0';

    D6     <= '1';
    S_MUX  <= "0110";
    S_DMUX <= "0110";
    wait for 10 ns;
    D6 <= '0';

    D7     <= '1';
    S_MUX  <= "0111";
    S_DMUX <= "0111";
    wait for 10 ns;
    D7 <= '0';

    D8     <= '1';
    S_MUX  <= "1000";
    S_DMUX <= "1000";
    wait for 10 ns;
    D8 <= '0';

    D9     <= '1';
    S_MUX  <= "1001";
    S_DMUX <= "1001";
    wait for 10 ns;
    D9 <= '0';

    D10    <= '1';
    S_MUX  <= "1010";
    S_DMUX <= "1010";
    wait for 10 ns;
    D10 <= '0';

    D11    <= '1';
    S_MUX  <= "1011";
    S_DMUX <= "1011";
    wait for 10 ns;
    D11 <= '0';

    D12    <= '1';
    S_MUX  <= "1100";
    S_DMUX <= "1100";
    wait for 10 ns;
    D12 <= '0';

    D13    <= '1';
    S_MUX  <= "1101";
    S_DMUX <= "1101";
    wait for 10 ns;
    D13 <= '0';

    D14    <= '1';
    S_MUX  <= "1110";
    S_DMUX <= "1110";
    wait for 10 ns;
    D14 <= '0';

    D15    <= '1';
    S_MUX  <= "1111";
    S_DMUX <= "1111";
    wait for 10 ns;
    D15 <= '0';

    wait;

  end process;

end sim;
  library IEEE; 
  use IEEE.STD_LOGIC_1164.all; 
  
  entity tb_MUX16to1 is 
  end tb_MUX16to1; 
  
  architecture sim of tb_MUX16to1 is 
  
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
  
    signal D : std_logic_vector(15 downto 0); 
  
    signal S : std_logic_vector(3 downto 0); 
    signal Y : std_logic; 
  
  begin 
  
    D <= D15 & D14 & D13 & D12 & 
      D11 & D10 & D9 & D8 & 
      D7 & D6 & D5 & D4 & 
      D3 & D2 & D1 & D0; 
  
    uut : entity work.MUX16to1 
      port map 
      ( 
        D => D, 
        S => S, 
        Y => Y 
      ); 
  
    process 
    begin 
  
      D0 <= '1'; 
      S  <= "0000"; 
      wait for 10 ns; 
      D0 <= '0'; 
  
      D1 <= '1'; 
      S  <= "0001"; 
      wait for 10 ns; 
      D1 <= '0'; 
  
      D2 <= '1'; 
      S  <= "0010"; 
      wait for 10 ns; 
      D2 <= '0'; 
  
      D3 <= '1'; 
      S  <= "0011"; 
      wait for 10 ns; 
      D3 <= '0'; 
  
      D4 <= '1'; 
      S  <= "0100"; 
      wait for 10 ns; 
      D4 <= '0'; 
  
      D5 <= '1'; 
      S  <= "0101"; 
      wait for 10 ns; 
      D5 <= '0'; 
  
      D6 <= '1'; 
      S  <= "0110"; 
      wait for 10 ns; 
      D6 <= '0'; 
  
      D7 <= '1'; 
      S  <= "0111"; 
      wait for 10 ns; 
      D7 <= '0'; 
  
      D8 <= '1'; 
      S  <= "1000"; 
      wait for 10 ns; 
      D8 <= '0'; 
  
      D9 <= '1'; 
      S  <= "1001"; 
      wait for 10 ns; 
      D9 <= '0'; 
  
      D10 <= '1'; 
      S   <= "1010"; 
      wait for 10 ns; 
      D10 <= '0'; 
  
      D11 <= '1'; 
      S   <= "1011"; 
      wait for 10 ns; 
      D11 <= '0'; 
  
      D12 <= '1'; 
      S   <= "1100"; 
      wait for 10 ns; 
      D12 <= '0'; 
  
      D13 <= '1'; 
      S   <= "1101"; 
      wait for 10 ns; 
      D13 <= '0'; 
  
      D14 <= '1'; 
      S   <= "1110"; 
      wait for 10 ns; 
      D14 <= '0'; 
  
      D15 <= '1'; 
      S   <= "1111"; 
      wait for 10 ns; 
      D15 <= '0'; 
  

      
  wait; 
  end process; 
  end sim;
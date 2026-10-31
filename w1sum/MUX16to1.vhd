library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
 
entity MUX16to1 is 
  port ( 
    D : in std_logic_vector(15 downto 0); 
    S : in std_logic_vector(3 downto 0); 
    Y : out std_logic 
  ); 
end MUX16to1; 
 
architecture GateLevel of MUX16to1 is 
 
  signal W : std_logic_vector(15 downto 0); 
 
begin 
 
  W(0) <= D(0) and (not S(3)) and (not S(2)) and (not S(1)) and (not 
S(0)); 
  W(1) <= D(1) and (not S(3)) and (not S(2)) and (not S(1)) and S(0); 
  W(2) <= D(2) and (not S(3)) and (not S(2)) and S(1) and (not S(0)); 
  W(3) <= D(3) and (not S(3)) and (not S(2)) and S(1) and S(0); 
 
  W(4) <= D(4) and (not S(3)) and S(2) and (not S(1)) and (not S(0)); 
  W(5) <= D(5) and (not S(3)) and S(2) and (not S(1)) and S(0); 
  W(6) <= D(6) and (not S(3)) and S(2) and S(1) and (not S(0)); 
  W(7) <= D(7) and (not S(3)) and S(2) and S(1) and S(0); 
 
  W(8)  <= D(8) and S(3) and (not S(2)) and (not S(1)) and (not S(0)); 
  W(9)  <= D(9) and S(3) and (not S(2)) and (not S(1)) and S(0); 
W(10) <= D(10) and S(3) and (not S(2)) and S(1) and (not S(0)); 
W(11) <= D(11) and S(3) and (not S(2)) and S(1) and S(0); 
W(12) <= D(12) and S(3) and S(2) and (not S(1)) and (not S(0)); 
W(13) <= D(13) and S(3) and S(2) and (not S(1)) and S(0); 
W(14) <= D(14) and S(3) and S(2) and S(1) and (not S(0)); 
W(15) <= D(15) and S(3) and S(2) and S(1) and S(0); 
Y <= W(0) or W(1) or W(2) or W(3) or 
W(4) or W(5) or W(6) or W(7) or 
W(8) or W(9) or W(10) or W(11) or 
W(12) or W(13) or W(14) or W(15); 
end GateLevel; 

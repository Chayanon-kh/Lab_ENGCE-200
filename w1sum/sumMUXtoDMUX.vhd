library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
 
entity mux_dmux16 is 
  port ( 
    D : in std_logic_vector(15 downto 0); 
 
    S_MUX  : in std_logic_vector(3 downto 0); 
    S_DMUX : in std_logic_vector(3 downto 0); 
 
    Y : out std_logic_vector(15 downto 0) 
  ); 
end mux_dmux16; 
 
architecture Structural of mux_dmux16 is 
 
  signal M : std_logic; 
 
begin 
 
  ---------------------------------------------------------------- 
  -- MUX 16:1 
  ---------------------------------------------------------------- 
 
  M <= (D(0) and not S_MUX(3) and not S_MUX(2) and not S_MUX(1) and 
not S_MUX(0)) 
    or (D(1) and not S_MUX(3) and not S_MUX(2) and not S_MUX(1) and 
S_MUX(0)) 
    or (D(2) and not S_MUX(3) and not S_MUX(2) and S_MUX(1) and not 
S_MUX(0)) 
    or (D(3) and not S_MUX(3) and not S_MUX(2) and S_MUX(1) and 
S_MUX(0)) 
 
    or (D(4) and not S_MUX(3) and S_MUX(2) and not S_MUX(1) and not 
S_MUX(0)) 
    or (D(5) and not S_MUX(3) and S_MUX(2) and not S_MUX(1) and 
S_MUX(0)) 
    or (D(6) and not S_MUX(3) and S_MUX(2) and S_MUX(1) and not 
S_MUX(0)) 
    or (D(7) and not S_MUX(3) and S_MUX(2) and S_MUX(1) and S_MUX(0)) 
 
    or (D(8) and S_MUX(3) and not S_MUX(2) and not S_MUX(1) and not 
S_MUX(0)) 
    or (D(9) and S_MUX(3) and not S_MUX(2) and not S_MUX(1) and 
S_MUX(0)) 
    or (D(10) and S_MUX(3) and not S_MUX(2) and S_MUX(1) and not 
S_MUX(0)) 
    or (D(11) and S_MUX(3) and not S_MUX(2) and S_MUX(1) and S_MUX(0)) 
 
    or (D(12) and S_MUX(3) and S_MUX(2) and not S_MUX(1) and not 
S_MUX(0)) 
    or (D(13) and S_MUX(3) and S_MUX(2) and not S_MUX(1) and S_MUX(0)) 
    or (D(14) and S_MUX(3) and S_MUX(2) and S_MUX(1) and not S_MUX(0)) 
    or (D(15) and S_MUX(3) and S_MUX(2) and S_MUX(1) and S_MUX(0)); 
 
  ---------------------------------------------------------------- 
  -- DMUX 1:16 
  ---------------------------------------------------------------- 
 
  Y(0) <= M and not S_DMUX(3) and not S_DMUX(2) and not S_DMUX(1) and 
not S_DMUX(0); 
  Y(1) <= M and not S_DMUX(3) and not S_DMUX(2) and not S_DMUX(1) and 
S_DMUX(0); 
  Y(2) <= M and not S_DMUX(3) and not S_DMUX(2) and S_DMUX(1) and not 
S_DMUX(0); 
  Y(3) <= M and not S_DMUX(3) and not S_DMUX(2) and S_DMUX(1) and 
S_DMUX(0); 
 
  Y(4) <= M and not S_DMUX(3) and S_DMUX(2) and not S_DMUX(1) and not 
S_DMUX(0); 
  Y(5) <= M and not S_DMUX(3) and S_DMUX(2) and not S_DMUX(1) and 
S_DMUX(0); 
  Y(6) <= M and not S_DMUX(3) and S_DMUX(2) and S_DMUX(1) and not 
S_DMUX(0); 
Y(7) <= M and not S_DMUX(3) and S_DMUX(2) and S_DMUX(1) and 
S_DMUX(0); 
Y(8)  <= M and S_DMUX(3) and not S_DMUX(2) and not S_DMUX(1) and not 
S_DMUX(0); 
Y(9)  <= M and S_DMUX(3) and not S_DMUX(2) and not S_DMUX(1) and 
S_DMUX(0); 
Y(10) <= M and S_DMUX(3) and not S_DMUX(2) and S_DMUX(1) and not 
S_DMUX(0); 
Y(11) <= M and S_DMUX(3) and not S_DMUX(2) and S_DMUX(1) and 
S_DMUX(0); 
Y(12) <= M and S_DMUX(3) and S_DMUX(2) and not S_DMUX(1) and not 
S_DMUX(0); 
Y(13) <= M and S_DMUX(3) and S_DMUX(2) and not S_DMUX(1) and 
S_DMUX(0); 
Y(14) <= M and S_DMUX(3) and S_DMUX(2) and S_DMUX(1) and not 
S_DMUX(0); 
Y(15) <= M and S_DMUX(3) and S_DMUX(2) and S_DMUX(1) and S_DMUX(0); 
end Structural;
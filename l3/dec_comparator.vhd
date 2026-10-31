library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dec_comparator is
  port (
    A3     : in std_logic;
    A2     : in std_logic;
    A1     : in std_logic;
    B3     : in std_logic;
    B2     : in std_logic;
    B1     : in std_logic;
    A_gt_B : out std_logic;
    A_eq_B : out std_logic;
    A_lt_B : out std_logic
  );
end dec_comparator;

architecture Dataflow of dec_comparator is
  signal S                : std_logic_vector(1 downto 0);
  signal Y_EQ, Z_LT, X_GT : std_logic;

  signal I_GT : std_logic_vector(3 downto 0);
  signal I_EQ : std_logic_vector(3 downto 0);
  signal I_LT : std_logic_vector(3 downto 0);
begin
  -- Select Lines
  S <= A3 & A2;

  -- ????????????
  Y_EQ <= A1 xnor B1;
  Z_LT <= (not A1) and B1;
  X_GT <= A1 and (not B1);

  -- MUX 1: A > B
  I_GT(0) <= (not B3) and (not B2) and X_GT;
  I_GT(1) <= ((not B3) and (not B2)) or ((not B3) and B2 and X_GT);
  I_GT(2) <= (not B3) or (B3 and (not B2) and X_GT);
  I_GT(3) <= (not B3) or (not B2) or X_GT;

  -- MUX 2: A = B
  I_EQ(0) <= (not B3) and (not B2) and Y_EQ;
  I_EQ(1) <= (not B3) and B2 and Y_EQ;
  I_EQ(2) <= B3 and (not B2) and Y_EQ;
  I_EQ(3) <= B3 and B2 and Y_EQ;

  -- MUX 3: A < B
  I_LT(0) <= B3 or B2 or ((not B3) and (not B2) and Z_LT);
  I_LT(1) <= B3 or ((not B3) and B2 and Z_LT);
  I_LT(2) <= (B3 and B2) or (B3 and (not B2) and Z_LT);
  I_LT(3) <= B3 and B2 and Z_LT;

  -- Output MUX 1 (A > B)
  with S select
    A_gt_B <= I_GT(0) when "00",
    I_GT(1) when "01",
    I_GT(2) when "10",
    I_GT(3) when "11",
    '0' when others;

  -- Output MUX 2 (A = B)
  with S select
    A_eq_B <= I_EQ(0) when "00",
    I_EQ(1) when "01",
    I_EQ(2) when "10",
    I_EQ(3) when "11",
    '0' when others;

  -- Output MUX 3 (A < B)
  with S select
    A_lt_B <= I_LT(0) when "00",
    I_LT(1) when "01",
    I_LT(2) when "10",
    I_LT(3) when "11",
    '0' when others;

end Dataflow;
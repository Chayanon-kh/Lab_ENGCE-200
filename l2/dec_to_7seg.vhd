library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec_to_7seg is
    Port ( 
      
        dec_in : in  STD_LOGIC_VECTOR (9 downto 0);
        
   
        seg_a  : out STD_LOGIC;
        seg_b  : out STD_LOGIC;
        seg_c  : out STD_LOGIC;
        seg_d  : out STD_LOGIC;
        seg_e  : out STD_LOGIC;
        seg_f  : out STD_LOGIC;
        seg_g  : out STD_LOGIC
    );
end dec_to_7seg;

architecture Behavioral of dec_to_7seg is

   
    signal A, B, C, D : STD_LOGIC;

begin
    -- ==========================================
    -- 1. Encoder: ???? Decimal ???? BCD
    -- ==========================================
    A <= dec_in(8) or dec_in(9);
    B <= dec_in(4) or dec_in(5) or dec_in(6) or dec_in(7);
    C <= dec_in(2) or dec_in(3) or dec_in(6) or dec_in(7);
    D <= dec_in(1) or dec_in(3) or dec_in(5) or dec_in(7) or dec_in(9);

    -- ==========================================
    -- 2. Decoder: ???? BCD ???? 7-Segment ????????
    -- ==========================================
    
    -- ?? a: $a = A + C + BD + \bar{B}\bar{D}$
    seg_a <= A or C or (B and D) or (not B and not D);
    
    -- ?? b: $b = \bar{B} + \bar{C}\bar{D} + CD$
    seg_b <= not B or (not C and not D) or (C and D);
    
    -- ?? c: $c = B + \bar{C} + D$
    seg_c <= B or (not C) or D;
    
    -- ?? d: $d = A + \bar{B}\bar{D} + C\bar{D} + \bar{B}C + B\bar{C}D$
    seg_d <= A or (not B and not D) or (C and not D) or (not B and C) or (B and not C and D);
    
    -- ?? e: $e = \bar{B}\bar{D} + C\bar{D}$
    seg_e <= (not B and not D) or (C and not D);
    
    -- ?? f: $f = A + B\bar{C} + B\bar{D} + \bar{C}\bar{D}$
    seg_f <= A or (B and not C) or (B and not D) or (not C and not D);
    
    -- ?? g: $g = A + B\bar{C} + \bar{B}C + C\bar{D}$
    seg_g <= A or (B and not C) or (not B and C) or (C and not D);

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_dec_to_7seg is
end tb_dec_to_7seg;

architecture behavior of tb_dec_to_7seg is

    -- ดึง Component วงจรหลักมาใช้งาน
    component dec_to_7seg
    Port ( 
        dec_in : in  STD_LOGIC_VECTOR (9 downto 0);
        seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G : out STD_LOGIC
    );
    end component;

    -- ประกาศสัญญาณจำลองสำหรับต่อเข้าวงจร
    signal dec_in : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G : STD_LOGIC;

begin

    -- แมปสัญญาณเข้ากับวงจรหลัก (UUT - Unit Under Test)
    uut: dec_to_7seg PORT MAP (
          dec_in => dec_in,
          seg_A => seg_A, 
          seg_B => seg_B, 
          seg_C => seg_C,
          seg_D => seg_D, 
          seg_E => seg_E, 
          seg_F => seg_F, 
          seg_G => seg_G
    );

    -- กระบวนการป้อนสัญญาณเพื่อดูผลกราฟใน Surfer
    stim_proc: process
    begin
        -- ให้สัญญาณเริ่มต้นเป็น 0 ทุกขา (พัก 10 ns)
        dec_in <= "0000000000"; wait for 10 ns; 
        
        -- ทดสอบเลข 0 (ขา 0 ไม่มีผลในลอจิก จึงเคลียร์ค่า)
        dec_in <= "0000000001"; wait for 10 ns; 
        
        -- ทดสอบเลข 1
        dec_in <= "0000000010"; wait for 10 ns; 
        
        -- ทดสอบเลข 2
        dec_in <= "0000000100"; wait for 10 ns; 
        
        -- ทดสอบเลข 3
        dec_in <= "0000001000"; wait for 10 ns; 
        
        -- ทดสอบเลข 4
        dec_in <= "0000010000"; wait for 10 ns; 
        
        -- ทดสอบเลข 5
        dec_in <= "0000100000"; wait for 10 ns; 
        
        -- ทดสอบเลข 6
        dec_in <= "0001000000"; wait for 10 ns; 
        
        -- ทดสอบเลข 7
        dec_in <= "0010000000"; wait for 10 ns; 
        
        -- ทดสอบเลข 8
        dec_in <= "0100000000"; wait for 10 ns; 
        
       -- ทดสอบเลข 9
        dec_in <= "1000000000"; wait for 10 ns; 

        -- เพิ่มบรรทัดนี้ไปอีก 1 อัน เพื่อเคลียร์ค่าและยืดเวลากราฟออกไปอีกนิดให้ดูง่ายขึ้น
        dec_in <= "0000000000"; wait for 10 ns;

        -- สิ้นสุดการจำลอง
        wait;
    end process;

end behavior;
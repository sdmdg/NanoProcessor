----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 09:50:12 PM
-- Design Name: 
-- Module Name: Comparator_4_Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparator_4_Bit is
    Port (A: in Std_Logic_Vector (3 downto 0);
          B: in Std_Logic_Vector (3 downto 0);
          S: out Std_Logic_Vector (3 downto 0); 
          Min_Max_Sel : in STD_LOGIC);
end Comparator_4_Bit;

architecture Behavioral of Comparator_4_Bit is

begin
    Comparator_4_Bit : process(A, B, Min_Max_Sel) begin
        -- When A, B, or Min_Max_Sel changes, this process will run
        if (A > B AND Min_Max_Sel = '0') OR (B > A AND Min_Max_Sel = '1') then
            S <= B;
        elsif (B > A AND Min_Max_Sel = '0') OR (A > B AND Min_Max_Sel = '1') then
            S <= A;
        else 
            S <= A;
        end if;
    end process;
end Behavioral;
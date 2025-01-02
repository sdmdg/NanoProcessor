----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2024 03:08:05 PM
-- Design Name: 
-- Module Name: Shifter_4_Bit - Behavioral
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

entity Shifter_4_Bit is
Port (
        A: in Std_Logic_Vector (3 downto 0);          -- Input A (4-bit)
        bit_shift_select: in Std_Logic;
        O: out Std_Logic_Vector (3 downto 0)          -- Output  (4-bit)
    );
end Shifter_4_Bit;

architecture Behavioral of Shifter_4_Bit is

begin
    Shifter_4_Bit : process(A, bit_shift_select) begin
        -- When A, B, or bit_shift_select changes, this process will run
        if (bit_shift_select = '0') then
            O <= A(2 downto 0) & '0';
        else 
            O <= '0' & A(3 downto 1);
        end if;
    end process;
end Behavioral;

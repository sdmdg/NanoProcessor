----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 01:28:17 PM
-- Design Name: 
-- Module Name: Mux_2_Way_4_Bit - Behavioral
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

entity Mux_2_Way_4_Bit is
    Port (A_in: in Std_Logic_Vector (3 downto 0);       --Input A
          B_in: in Std_Logic_Vector (3 downto 0);       --Input B
          S: in Std_Logic;                              --Selection input
          C_out: out Std_Logic_Vector (3 downto 0));    --Output 
end Mux_2_Way_4_Bit;

architecture Behavioral of Mux_2_Way_4_Bit is
    
begin
    Process (A_in, B_in, S)
    Begin
        If S = '0' then                                 --If S is low
            C_out <= A_in;                              --Output A    
        Else                                            --If S is high
            C_out <= B_in;                              --Output B    
        End If;
    End Process;
end Behavioral;

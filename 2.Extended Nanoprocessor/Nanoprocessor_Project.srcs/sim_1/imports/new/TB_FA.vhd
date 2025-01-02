----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2024 04:15:23 PM
-- Design Name: 
-- Module Name: TB_FA - Behavioral
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

entity TB_FA is
--  Port ( );
end TB_FA;

architecture Behavioral of TB_FA is
        COMPONENT FA
        PORT ( A, B, C_in : IN STD_LOGIC;
               S, C_out : OUT STD_LOGIC);
        END COMPONENT;
        SIGNAL a, b, c_in : std_logic;
        SIGNAL s, c_out : std_logic;

begin
    UUT: FA PORT MAP (
         A => a,
         B => b,
         C_in => c_in,
         S => s,
         C_out => c_out);
    process
    begin  
     a <= '0'; 
     b <= '0';
     c_in <= '0';
     WAIT FOR 100 ns; 
     c_in <= '1';
     WAIT FOR 100 ns; 
     b <= '1';
     c_in <= '0';
     WAIT FOR 100 ns; 
     c_in <= '1';
     WAIT FOR 100 ns; 
     a <= '1';
     b <= '0';
     c_in <= '0';
     WAIT FOR 100 ns; 
     c_in <= '1';
     WAIT FOR 100 ns; 
     b <= '1';
     c_in <= '0';
     WAIT FOR 100 ns; 
     c_in <= '1';
     WAIT;

    end process; 

end Behavioral;

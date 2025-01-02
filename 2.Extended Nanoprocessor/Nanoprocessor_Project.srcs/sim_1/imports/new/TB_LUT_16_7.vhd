----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2024 02:51:37 PM
-- Design Name: 
-- Module Name: TB_LUT_16_7 - Behavioral
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

entity TB_LUT_16_7 is
--  Port ( );
end TB_LUT_16_7;

architecture Behavioral of TB_LUT_16_7 is
    COMPONENT LUT_16_7
        PORT (Address : in STD_LOGIC_VECTOR (3 downto 0);
              Data : out STD_LOGIC_VECTOR (6 downto 0));
    END COMPONENT;
    
    Signal address : Std_Logic_Vector (3 downto 0);
    Signal data : Std_Logic_Vector (6 downto 0);
    
begin

    UUT: LUT_16_7
        PORT MAP (Address => address,
                  Data => data);
                  
    Process Begin
     --Give 2,0,6,3,a,f as inputs              
        address <= "0010";     Wait for 100ns;
        address <= "0000";     Wait for 100ns; 
        address <= "0110";     Wait for 100ns;
        address <= "0011";     Wait for 100ns;
        address <= "1010";     Wait for 100ns;
        address <= "1111";     Wait for 100ns;
    End Process;
    
end Behavioral;

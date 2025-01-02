----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 10:41:17 AM
-- Design Name: 
-- Module Name: TB_LUT - Behavioral
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

entity TB_LUT is
--  Port ( );
end TB_LUT;

architecture Behavioral of TB_LUT is
    COMPONENT LUT
        PORT (address : in STD_LOGIC_VECTOR (2 downto 0);
              data : out STD_LOGIC_VECTOR (11 downto 0));
    END COMPONENT;
    
    Signal address : Std_Logic_Vector (2 downto 0);
    Signal data : Std_Logic_Vector (11 downto 0);
    
begin

    UUT: LUT
        PORT MAP (address => address,
                  data => data);
                  
    Process Begin             
        address <= "001";     Wait for 100ns;
        address <= "000";     Wait for 100ns; 
        address <= "110";     Wait for 100ns;
        address <= "011";     Wait for 100ns;
        address <= "101";     Wait for 100ns;
        address <= "111";     Wait for 100ns;
    End Process;
    
end Behavioral;

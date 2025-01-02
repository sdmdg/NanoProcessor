----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 10:41:17 AM
-- Design Name: 
-- Module Name: TB_Adder_3bit - Behavioral
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

entity TB_Adder_3bit is
--  Port ( );
end TB_Adder_3bit;

architecture Behavioral of TB_Adder_3bit is
COMPONENT Adder_3bit        
        PORT(A: in Std_Logic_Vector (2 downto 0);
             B: in Std_Logic_Vector (2 downto 0);
             S: out Std_Logic_Vector (2 downto 0);
             C_in : in STD_LOGIC;
             C_out : out STD_LOGIC);        
        END COMPONENT; 
        
        Signal a, b, s: Std_Logic_Vector (2 downto 0);  
        SIGNAL c_in,c_out  : std_logic; 

begin
    UUT: Adder_3bit  PORT MAP(  
            A => a,
            B => b,
            S => s,
            C_in =>c_in,   
            C_out => c_out);   
    process
    begin
        c_in <= '0';
        a <= "111"; b <= "110"; WAIT FOR 100 ns;
        a <= "011"; b <= "101"; Wait for 100 ns;
         WAIT;
         end process;


end Behavioral;

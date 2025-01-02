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

    UUT: Adder_3bit  PORT MAP(A,B,S,c_in,c_out);
            
    main: process begin
    
            c_in <= '0';
            a <= "001";
            b <= "001";
            WAIT FOR 200 ns;
            a <= "010";
            Wait for 200 ns;
            a <= "011";
            Wait for 200 ns;
            a <= "100";
            Wait;
            
    end process;
end Behavioral;

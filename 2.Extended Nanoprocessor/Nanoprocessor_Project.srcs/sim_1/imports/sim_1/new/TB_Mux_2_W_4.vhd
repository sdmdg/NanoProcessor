----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 12:03:46 PM
-- Design Name: 
-- Module Name: TB_Mux_2_W_4 - Behavioral
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

entity TB_Mux_2_W_4 is
--  Port ( );
end TB_Mux_2_W_4;

architecture Behavioral of TB_Mux_2_W_4 is

component Mux_2_Way_4_Bit is
    Port (A_in: in Std_Logic_Vector (3 downto 0);
          B_in: in Std_Logic_Vector (3 downto 0);
          S: in Std_Logic;
          C_out: out Std_Logic_Vector (3 downto 0));
end component;

SIGNAL A_in,B_in,C_out:STD_LOGIC_VECTOR(3 downto 0);
SIGNAL S : STD_LOGIC ;

begin 
    UUT: Mux_2_Way_4_Bit PORT MAP(A_in, B_in, S, C_out);
    
    main: process begin
    
        A_in<="0000";
        B_in<="1111";
    
        S<='0';
        wait for 200 ns;  -- Switch to next bus
        S<='1';
        
        wait;
    
    end process;
end Behavioral;

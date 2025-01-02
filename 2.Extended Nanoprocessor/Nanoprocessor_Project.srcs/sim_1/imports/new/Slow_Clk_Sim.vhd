----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 03:23:28 PM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is
    Component Slow_Clk
    Port ( Clk_in: in STD_LOGIC;
           Clk_out: out STD_LOGIC);
    End Component;
    Signal clk_in: STD_LOGIC;
    Signal clk_out: STD_LOGIC;
begin
    UUT: Slow_Clk Port Map
        ( Clk_in => clk_in,
          Clk_out => clk_out );
    
    Process Begin
        clk_in <= '1';
        Wait for 10 ns;
        clk_in <= '0';
        Wait for 10 ns;
    End process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 10:05:18 PM
-- Design Name: 
-- Module Name: TB_Nanoprocessor - Behavioral
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

entity TB_Nanoprocessor is
--  Port ( );
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is

component Nanoprocessor is
  Port (Clk: in Std_logic;
        Reset: in Std_Logic;
        Overflow: Out Std_Logic;
        Zero: Out Std_Logic;
        Reg_7_Out: Out Std_Logic_Vector (3 downto 0));
end component;

SIGNAL Reset, Clk, Overflow, Zero : STD_LOGIC;
SIGNAL Reg_7_Out : STD_LOGIC_VECTOR(3 downto 0);

begin

    UTT : Nanoprocessor port map (Clk, Reset, Overflow, Zero, Reg_7_Out);
    
    clock : process
        begin
            Clk <= '0';
            wait for 5ns;
            Clk <= '1';
            wait for 5ns;
    end process;
    
    main: process begin
            Reset <= '1';
            wait for 50ns;
            Reset <= '0';
            
            wait for 500ns;
       
            Reset <= '1';
            wait for 50ns;
            Reset <= '0';
            wait;
    end process;
end Behavioral;
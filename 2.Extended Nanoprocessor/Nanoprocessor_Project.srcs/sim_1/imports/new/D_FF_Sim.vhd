----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 02:12:26 PM
-- Design Name: 
-- Module Name: D_FF_Sim - Behavioral
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

entity D_FF_Sim is
--  Port ( );
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is
    Component D_FF
    Port (  D: in STD_LOGIC;
            Res: in STD_LOGIC;
            Clk: in STD_LOGIC;
            Q: out STD_LOGIC;
            Qbar: out STD_LOGIC );      
    End Component;
    Signal d : STD_LOGIC := '0';
    Signal res: STD_LOGIC := '0';
    Signal clk: STD_LOGIC := '0';
    Signal q: STD_LOGIC;
    Signal qbar: STD_LOGIC;
    Constant clk_period: time := 10ns;      --Clock period definition

begin
    UUT: D_FF Port Map
        (   D => d,
            Res => res,
            Clk => clk, 
            Q => q,
            Qbar => qbar );
            
    Clk_process: process
        begin
            clk <= '0';
            Wait for clk_period/2;
            clk <= '1';
            Wait for clk_period/2;
        end process;
        
    process
        begin
        -- Reset
        res <= '1';
        Wait for 20 ns;
        res <= '0';
        
        -- Apply inputs
        d <= '1';
        Wait for 20 ns;
        d <= '0';
        Wait for 20 ns;
        d <= '1';
        Wait for 10 ns;
        
     
        res <= '1';
        wait for 10 ns;
        res <= '0';
        
        Wait for 50 ns;
        Wait; --
    end process;    
    
end Behavioral;

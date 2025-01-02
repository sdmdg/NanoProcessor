----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 10:55:35 AM
-- Design Name: 
-- Module Name: TB_Reg_4_Bit - Behavioral
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

entity TB_Reg_4_Bit is
--  Port ( );
end TB_Reg_4_Bit;

architecture Behavioral of TB_Reg_4_Bit is

component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Reset: in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL Clk, En, Reset : STD_LOGIC;
SIGNAL D : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Q : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT : Reg PORT MAP (D, Reset, En, Clk, Q);

    clock : process
    begin
        Clk <= '0';
        wait for 5ns;
        Clk <= '1';
        wait for 5ns;
    end process;
    
    main : process begin

        Reset <= '1';   -- Reset
        wait for 50ns;  
        Reset <= '0';
        
        En <= '0';
        D <= "1111";
        wait for 50ns;
        
        wait for 200ns;
        
        En <= '1';
        D <= "1111";
        wait for 50ns;
        En <= '0';
        
        wait for 200ns;
        
        Reset <= '1';   -- Reset
        wait for 50ns;  
        Reset <= '0';
        
        En <= '1';
        D <= "1111";
        wait for 50ns;
        En <= '0';
        
        wait;
    end process;
end Behavioral;
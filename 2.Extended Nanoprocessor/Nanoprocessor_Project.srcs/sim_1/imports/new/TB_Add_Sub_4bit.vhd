----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 11:10:39 AM
-- Design Name: 
-- Module Name: TB_Add_Sub_4bit - Behavioral
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

entity TB_Add_Sub_4bit is
--  Port ( );
end TB_Add_Sub_4bit;

architecture Behavioral of TB_Add_Sub_4bit is

component Add_Sub_4bit is
    Port (A: in Std_Logic_Vector (3 downto 0);
          B: in Std_Logic_Vector (3 downto 0);
          S: out Std_Logic_Vector (3 downto 0); 
          Add_Sub_Sel : in STD_LOGIC;         
          Carry : out STD_LOGIC;
          Zero: out Std_Logic);
end component;

signal A,B,S: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal Add_Sub_Sel:STD_LOGIC;
signal C_out:std_logic;
signal zero,overFlow:std_logic;

begin
    
    UUT:Add_Sub_4bit PORT MAP(A,B,S,Add_Sub_Sel,C_out,zero);
    
    main: process begin
    
        -- Add
        Add_Sub_Sel<='0';
        A<="0111";
        B<="0100";
        wait for 200 ns;
    
        Add_Sub_Sel<='0';
        A<="0111";
        B<="0100";
        wait for 200 ns;
    
        -- Subtract
        Add_Sub_Sel<='1';
        A<="1000";
        B<="0101";
        wait for 200 ns;
    
        Add_Sub_Sel<='1';
        A<="1000";
        B<="0101";
        wait for 200 ns;
        
        -- Zero  
        Add_Sub_Sel<='0';
        A<="0000";
        B<="0000";
        wait;
        
    end process;
end Behavioral;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 11:59:04 AM
-- Design Name: 
-- Module Name: TB_Mux_2_W_3 - Behavioral
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

entity TB_Mux_2_W_3 is
--  Port ( );
end TB_Mux_2_W_3;

architecture Behavioral of TB_Mux_2_W_3 is

component Mux_2_Way_3_Bit is
    Port ( A_in : in STD_LOGIC_VECTOR (2 downto 0);
           B_in : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A_in : STD_LOGIC_VECTOR (2 downto 0);
signal B_in : STD_LOGIC_VECTOR (2 downto 0);
signal S : STD_LOGIC;
signal C_out : STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT: Mux_2_Way_3_Bit PORT MAP(A_in, B_in, S, C_out);

    main: process begin
    
        A_in <= "000";
        B_in <= "111";
        
        S <= '0';
        wait for 200 ns;  -- Switch to next bus
        S <= '1';
        
        wait;
      
    end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2024 11:22:50 AM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
    COMPONENT Decoder_3_to_8
    PORT (I : in STD_LOGIC_VECTOR (2 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (7 downto 0));
 END COMPONENT;
 
 SIGNAL i : std_logic_vector(2 downto 0);
 SIGNAL y : std_logic_vector(7 downto 0);
 SIGNAL en: std_logic;

begin
    UUT: Decoder_3_to_8 
    PORT MAP(
        I => i,
        EN => en,
        Y => y);  
              
    process
    begin
        en <= '1';
        --Output 110
        i <= "110"; WAIT FOR 100ns;
        --Output 010
        i <= "010"; WAIT FOR 100ns;
        --Output 111
        i <= "111"; WAIT FOR 100ns;
        --Output 101
        i <= "101"; WAIT FOR 100ns;
    end process;
end Behavioral;

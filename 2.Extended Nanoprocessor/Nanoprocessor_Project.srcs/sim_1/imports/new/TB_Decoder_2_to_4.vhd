----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 02:19:47 PM
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
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

entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is
    COMPONENT Decoder_2_to_4
    PORT (I: In std_logic_vector(1 downto 0);
          EN: In std_logic;
          Y: Out std_logic_vector(3 downto 0));
    END COMPONENT;
    
    SIGNAL i: std_logic_vector(1 downto 0);
    SIGNAL en: std_logic;
    SIGNAL y: std_logic_vector(3 downto 0);

begin
    UUT: Decoder_2_to_4 PORT MAP(
        I => i,
        EN => en,
        Y => y);  
                  
process
begin
        en <= '0';
        i(0) <= '0';
        i(1) <= '0';
        
        WAIT for 100ns;
        i(0) <= '1';
        
        WAIT for 100ns;
        i(1) <= '1';
        i(0) <= '0';
        
        WAIT for 100ns;
        i(0) <= '1';
         
        WAIT for 100ns;
        en <= '1';
        i(0) <= '0';
        i(1) <= '0';
        
        WAIT for 100ns;
        i(0) <= '1';
        
        WAIT for 100ns;
        i(1) <= '1';
        i(0) <= '0';
        
        WAIT for 100ns;
        i(0) <= '1'; 
        
        WAIT;

end process;
end Behavioral;

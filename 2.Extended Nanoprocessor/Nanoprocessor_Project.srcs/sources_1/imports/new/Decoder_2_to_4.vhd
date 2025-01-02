----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 02:00:48 PM
-- Design Name: 
-- Module Name: Decoder_2_to_4 - Behavioral
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

entity Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);    -- Input vector with 2 bits
           EN : in STD_LOGIC;                       -- Enable input
           Y : out STD_LOGIC_VECTOR (3 downto 0));  -- Output vector with 4 bits
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is

begin

    Y(0) <= EN AND NOT I(0) AND NOT I(1);           -- Output Y(0) is enabled if EN is high and both input bits are low      
    Y(1) <= EN AND I(0) AND NOT I(1);               -- Output Y(1) is enabled if EN is high, I(0) is high, and I(1) is low
    Y(2) <= EN AND NOT I(0) AND I(1);               -- Output Y(2) is enabled if EN is high, I(0) is low, and I(1) is high
    Y(3) <= EN AND I(0) AND I(1);                   -- Output Y(3) is enabled if EN is high and both input bits are high


end Behavioral;
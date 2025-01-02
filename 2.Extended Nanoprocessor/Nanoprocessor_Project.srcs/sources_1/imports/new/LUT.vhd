----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 06:03:31 PM
-- Design Name: 
-- Module Name: LUT - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);--if we need to add more than 7 instructions then change this 2 to 3 
           data : out STD_LOGIC_VECTOR (13 downto 0));
end LUT;

architecture Behavioral of LUT is
type rom_type is array (0 to 6) of std_logic_vector(13 downto 0);
signal instruction_ROM : rom_type := (
    --SHL and SHR
    "00101110000010", --MOVI R7, 2
    "00101100000011", --MOVI R6, 3
    "00001111100000", --ADD R7, R6
    "01101110000000", --SHL R7
    "01111110000000", --SHR R7
    "00000000000000", --Loop
    "10110000000101"
);

begin
data <= instruction_ROM(to_integer(unsigned(address)));

end Behavioral;

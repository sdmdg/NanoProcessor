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
           data : out STD_LOGIC_VECTOR (11 downto 0));
end LUT;

architecture Behavioral of LUT is
type rom_type is array (0 to 4) of std_logic_vector(11 downto 0);--and also change this 5 to more to initiate space
signal instruction_ROM : rom_type := (
    
--    "100010001010", --10 001 000 1010 => 10 = MOVI, 001 = R1 register, 000 = defalut, 1010 = value 10
--    "100100000001", --10 010 000 0001 => 10 = MOVI, 010 = R2 register, 000 = defalut, 0001 = value 1
--    "010100000000", --01 010 010 0000 => 01 = NEG, 010 = R2 register, 0000000 = this is defalut
--    "000010100000", --00 001 010 0000 => 00 = ADD, 001 = R1 register, 010 = R2 register, 0000 = this value id defalut
--    "110010000101", -- 11 001 000 0111 => 11 = JZR, 001 = R1 register, 000 = defalut, 0111 = jump to 7
--    "110000000011" -- 11 000 000 0011 => 11 = JZR, 000 = R0 register, 000 = defalut, 0011 = jump to 3
--    --add more instructions 
--    --NOTE: if adding more instructions chamge above 5 and 2, change 5 to indicate the number of instructions and 2 to 3 to assign address based in 3 bit,
--    --for more than 15 instructions again change the 2 to 4.
    "101110000001", --MOVI R7, 1
    "101100000010", --MOVI R6, 2
    "101010000011", --MOVI R5, 3
    "001111100000", --ADD R7, R6
    "001111010000"  --ADD R7, R5
);

begin
data <= instruction_ROM(to_integer(unsigned(address)));

end Behavioral;

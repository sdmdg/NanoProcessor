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
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);     -- Address input for the LUT
           data : out STD_LOGIC_VECTOR (11 downto 0));    -- Output data from the LUT
end LUT;

architecture Behavioral of LUT is
    -- Type declaration for ROM data
    type rom_type is array (0 to 6) of std_logic_vector(11 downto 0);
    
    -- Initialization of instruction ROM data
    signal instruction_ROM : rom_type := (
        "101110000001", -- MOVI R7, 1
        "101100000010", -- MOVI R6, 2
        "101010000011", -- MOVI R5, 3
        "001111100000", -- ADD R7, R6
        "001111010000", -- ADD R7, R5
        "101000000000", -- MOVI R0, 0
        "110000000101"  -- JZR R0, 6
    );

begin
    -- Output data based on address input
    data <= instruction_ROM(to_integer(unsigned(address)));
end Behavioral;

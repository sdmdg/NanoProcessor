----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 02:36:15 PM
-- Design Name: 
-- Module Name: HA - Behavioral
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

entity HA is
    Port ( A : in STD_LOGIC;    -- Input A
           B : in STD_LOGIC;    -- Input B
           S : out STD_LOGIC;   -- Output sum
           C : out STD_LOGIC);  -- Output carry
end HA;

architecture Behavioral of HA is

begin
    S<= A XOR B;    -- Sum is the XOR of inputs A and B
    C<= A AND B;    -- Carry is the AND of inputs A and B

end Behavioral;

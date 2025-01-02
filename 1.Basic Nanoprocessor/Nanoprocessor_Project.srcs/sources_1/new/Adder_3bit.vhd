----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 10:26:26 AM
-- Design Name: 
-- Module Name: Adder_3bit - Behavioral
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

entity Adder_3bit is
    Port ( A: in Std_Logic_Vector (2 downto 0);          -- Input A (3-bit)
           B: in Std_Logic_Vector (2 downto 0);          -- Input B (3-bit)
           S: out Std_Logic_Vector (2 downto 0);        -- Output sum (3-bit)
           C_in : in STD_LOGIC;                          -- Carry-in
           C_out : out STD_LOGIC);                       -- Carry-out
end Adder_3bit;

architecture Behavioral of Adder_3bit is
 component FA
       port (
       A: in std_logic;
       B: in std_logic;
       C_in: in std_logic;
       S: out std_logic;
       C_out: out std_logic);
   end component;

SIGNAL FA_C: Std_Logic_Vector (2 downto 0);              -- Carry vector for each bit
SIGNAL internal_S: Std_Logic_Vector (2 downto 0);        -- Internal sum vector
SIGNAL internal_C_out: Std_Logic;                        -- Internal carry-out

begin
   FA_0 : FA
           port map (
           A => A(0),                                    -- First bit of A
           B => B(0),                                    -- First bit of B
           C_in =>'0',                                   -- Initial carry-in is 0
           S => internal_S(0),                           -- Output sum of first bit
           C_out => FA_C(0));                            -- Carry-out of first bit
       
   FA_1 : FA
       port map (
           A => A(1),                                    -- Second bit of A
           B => B(1),                                    -- Second bit of B
           C_in => FA_C(0),                              -- Carry-in from first bit's FA
           S => internal_S(1),                           -- Output sum of second bit
           C_out => FA_C(1));                            -- Carry-out of second bit
       
   FA_2 : FA
       port map (
           A => A(2),                                    -- Third bit of A
           B => B(2),                                    -- Third bit of B
           C_in => FA_C(1),                              -- Carry-in from second bit's FA
           S => internal_S(2),                           -- Output sum of third bit
           C_out => internal_C_out);                     -- Internal carry-out

-- Calculate final sum and carry-out
S <= (NOT(internal_C_out & internal_C_out & internal_C_out) AND internal_S) OR ((internal_C_out & internal_C_out & internal_C_out) AND "000");
C_out <= internal_C_out;

end Behavioral;

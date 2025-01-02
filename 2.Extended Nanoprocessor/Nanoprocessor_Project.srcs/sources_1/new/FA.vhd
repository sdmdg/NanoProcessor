----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 02:38:20 PM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( A : in STD_LOGIC;        -- Input A
           B : in STD_LOGIC;        -- Input B
           C_in : in STD_LOGIC;     -- Input carry-in
           S : out STD_LOGIC;       -- Output sum
           C_out : out STD_LOGIC);  -- Output carry-out
end FA;

architecture Behavioral of FA is
     component HA                     -- Half Adder component declaration
     port (
     A: in std_logic;                  -- Input A
     B: in std_logic;                  -- Input B
     S: out std_logic;                 -- Output sum
     C: out std_logic);                -- Output carry
     end component;
     
     SIGNAL HA0_S, HA0_C, HA1_S, HA1_C : std_logic;  -- Internal signals for half adders
    
begin
         HA_0 : HA                           -- Instantiation of first half adder
             port map (
             A => A,
             B => B,
             S => HA0_S,
             C => HA0_C);
         HA_1 : HA                           -- Instantiation of second half adder
             port map (
             A => HA0_S,
             B => C_in,
             S => HA1_S,
             C => HA1_C);
         S <= HA1_S;                         -- Output sum is the output of the second half adder
         C_out <= HA0_C OR HA1_C;            -- Output carry-out is the OR of carry-out from both half adders
         
     
     end Behavioral;

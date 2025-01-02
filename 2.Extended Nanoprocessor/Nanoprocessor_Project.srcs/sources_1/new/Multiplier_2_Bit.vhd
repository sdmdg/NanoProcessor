----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 02:15:46 PM
-- Design Name: 
-- Module Name: Multiplier_2_Bit - Behavioral
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

entity Multiplier_2_Bit is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2_Bit;

architecture Behavioral of Multiplier_2_Bit is

component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal b0a0, b0a1, b1a0, b1a1  : std_logic;
signal s_0_0, s_0_1, c_0_0, c_0_1  : std_logic;

begin

FA_0_0 : FA port map (
          A => b0a1,
          B => b1a0,
          C_in => '0',
          S => s_0_0,
          C_out => c_0_0
);

FA_0_1 : FA port map (
          A => '0',
          B => b1a1,
          C_in => c_0_0,
          S => s_0_1,
          C_out => c_0_1
);


b0a0 <= A(0) AND B(0);
b0a1 <= A(1) AND B(0);
b1a0 <= A(0) AND B(1);
b1a1 <= A(1) AND B(1);

-- Define output
Y(0) <= b0a0;
Y(1) <= s_0_0;
Y(2) <= s_0_1;
Y(3) <= c_0_1;

end Behavioral;

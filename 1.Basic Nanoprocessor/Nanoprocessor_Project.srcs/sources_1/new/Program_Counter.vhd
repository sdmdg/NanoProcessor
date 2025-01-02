----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 08:10:32 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
  Port (D : in STD_LOGIC_Vector (2 downto 0);
        Reset : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is
    Component D_FF
    Port ( D: in STD_LOGIC;
           Res: in STD_LOGIC;
           Clk: in STD_LOGIC;
           Q: out STD_LOGIC;
           Qbar: out STD_LOGIC); 
End Component;
    
begin
    D_FF0: D_FF
        Port Map ( D => D(0),
                   Res => Reset,
                   Clk => Clk,
                   Q => Q(0));

    D_FF1: D_FF
        Port Map ( D => D(1),
                   Res => Reset,
                   Clk => Clk,
                   Q => Q(1));

    D_FF2: D_FF
        Port Map ( D => D(2),
                   Res => Reset,
                   Clk => Clk,
                   Q => Q(2) );

end Behavioral;

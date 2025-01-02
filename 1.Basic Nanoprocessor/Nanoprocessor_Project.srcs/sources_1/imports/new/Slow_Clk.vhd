----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 03:09:56 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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

entity Slow_Clk is  
    Port ( Clk_in : in STD_LOGIC;               -- Input clock signal
           Clk_out : out STD_LOGIC);            -- Output clock signal
end Slow_Clk;

architecture Behavioral of Slow_Clk is
    Signal count: integer := 1;                 -- Counter for dividing the clock frequency
    Signal clk_status: STD_LOGIC := '0';        -- Initial clock status

begin

    process (Clk_in) begin
        if (rising_edge(Clk_in)) then
            count <= count + 1;                 --Increment counter
            if (count = 10000000) then          --10000000 when hardware implementation                 
                clk_status <= not clk_status;   --Invert clock status
                Clk_out <= clk_status;  
                count <= 1;                     --Reset counter
            end if;
        end if;
    end process;

end Behavioral;

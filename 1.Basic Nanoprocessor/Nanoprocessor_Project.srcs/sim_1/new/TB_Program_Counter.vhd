----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 10:19:41 AM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is

component Program_Counter is
  Port (D : in STD_LOGIC_Vector (2 downto 0);
        Reset : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
                    
SIGNAL D_in, Q : STD_LOGIC_VECTOR(2 downto 0);
SIGNAL Reset, Clk : STD_LOGIC := '0';

begin

    UUT : Program_Counter PORT MAP(D_in, Reset, Clk, Q);

    clock: process
      begin
          Clk <= NOT(Clk);
          wait for 5 ns;
      end process;
    
    main: process begin
    
            Reset <= '1';
            wait for 50ns;  -- Reset 1
            Reset <= '0';
            
            D_in <= "000";
            wait for 50ns;
            
            D_in <= "001";
            wait for 50ns;
            
            D_in <= "010";
            wait for 50ns;
            
            D_in <= "011";
            wait for 50ns;
            
            D_in <= "100";
            wait for 50ns;
            
            D_in <= "101";
            wait for 50ns;
            
            D_in <= "110";
            wait for 50ns;
            
            D_in <= "111";
            wait for 50ns;
            
            Reset <= '1';
            wait for 50ns;  -- Reset 2
            Reset <= '0';
            
            D_in <= "000";
            wait for 50ns;
            
            D_in <= "001";
            wait for 50ns;
            
            D_in <= "010";
            wait for 50ns;
            
            D_in <= "011";
            wait for 50ns;
            
            D_in <= "100";
            wait for 50ns;
            
            D_in <= "101";
            wait for 50ns;
            
            D_in <= "110";
            wait for 50ns;
            
            D_in <= "111";
            wait for 50ns;
            
            wait;
    end process;
end Behavioral;
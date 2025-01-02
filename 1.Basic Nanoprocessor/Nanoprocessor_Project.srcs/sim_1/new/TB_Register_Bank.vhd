----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:38:56 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

component Register_Bank is
    Port (Value_in: in Std_Logic_Vector (3 downto 0);
          Reg_EN: in Std_Logic_Vector (2 downto 0);
          Clk: in Std_Logic;
          Reset: in Std_Logic;
          Value_out_0: Out Std_Logic_Vector (3 downto 0);
          Value_out_1: Out Std_Logic_Vector (3 downto 0);
          Value_out_2: Out Std_Logic_Vector (3 downto 0);
          Value_out_3: Out Std_Logic_Vector (3 downto 0);
          Value_out_4: Out Std_Logic_Vector (3 downto 0);
          Value_out_5: Out Std_Logic_Vector (3 downto 0);
          Value_out_6: Out Std_Logic_Vector (3 downto 0);
          Value_out_7: Out Std_Logic_Vector (3 downto 0));
end component;

signal input : STD_LOGIC_VECTOR(3 downto 0);
signal clk,reset : STD_LOGIC := '0';
signal Reg_en : STD_LOGIC_VECTOR(2 downto 0);
signal Val_0,Val_1,Val_2,Val_3,Val_4,Val_5,Val_6,Val_7 : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: Register_Bank PORT MAP (input, Reg_en, clk, reset, Val_0, Val_1, Val_2, Val_3, Val_4, Val_5, Val_6, Val_7);
    
    clock: process
      begin
          Clk <= NOT(Clk);
          wait for 5 ns;
      end process;
  
    main: process begin
    
        reset <= '1';
        wait for 5 ns;
        reset <= '0';
        
        Reg_en <= "000";
        wait for 10 ns;    -- Testing the read only register.
        input <= "1111";
        
        wait for 100 ns;
        Reg_en <= "001";
        wait for 10 ns;
        input <= "1111";
        
        wait for 100 ns;
        Reg_en <= "010";
        wait for 10 ns;
        input <= "1111";
        
        wait for 100 ns;
        Reg_en <= "011";
        wait for 5 ns;
        input <= "1111";
        
        wait for 100 ns;
        Reg_en <= "100";
        wait for 10 ns;
        input <= "1111";
        
        wait for 100 ns;
        Reg_en <= "101";
        wait for 10 ns;
        input <= "1111";
        
        wait for 100 ns;
        Reg_en <= "110";
        wait for 10 ns;
        input <= "1111";
        
        wait for 100 ns;
        Reg_en <= "111";
        wait for 10 ns;
        input <= "1111";
        
        wait for 100 ns;
        reset <= '1';
        
        wait;
  end process;
end Behavioral;
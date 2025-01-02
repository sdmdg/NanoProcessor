----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 11:13:13 PM
-- Design Name: 
-- Module Name: TB_Mux_8_W_4 - Behavioral
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

entity TB_Mux_8_W_4 is
--  Port ( );
end TB_Mux_8_W_4;

architecture Behavioral of TB_Mux_8_W_4 is

component Mux_8_Way_4_Bit is
    Port (Data_0, Data_1, Data_2, Data_3, Data_4, Data_5, Data_6, Data_7  : in STD_LOGIC_VECTOR (3 downto 0); 
          RegSel : in STD_LOGIC_VECTOR (2 downto 0);  
          Output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Data_0,Data_1,Data_2,Data_3,Data_4,Data_5,Data_6,Data_7:STD_LOGIC_VECTOR(3 downto 0);
signal Output:STD_LOGIC_VECTOR(3 downto 0);
signal RegSel:STD_LOGIC_VECTOR(2 downto 0);

begin

    UUT:Mux_8_Way_4_Bit Port map(Data_0, Data_1, Data_2, Data_3, Data_4, Data_5, Data_6, Data_7, RegSel, Output);
        
    main: process begin
    
        Data_0<="0000";
        Data_1<="0001";
        Data_2<="0010";
        Data_3<="0011";
        Data_4<="0100";
        Data_5<="0101";
        Data_6<="0110";
        Data_7<="0111";
        
        -- Switching between busses.
        RegSel<="000";
        WAIT FOR 100 ns;
        RegSel<="001";
        WAIT FOR 100 ns;
        RegSel<="010";
        WAIT FOR 100 ns;
        RegSel<="011";
        WAIT FOR 100 ns;
        RegSel<="100";
        WAIT FOR 100 ns;
        RegSel<="101";
        WAIT FOR 100 ns;
        RegSel<="110";
        WAIT FOR 100 ns;
        RegSel<="111";
        WAIT;
        
    end process;
end Behavioral;
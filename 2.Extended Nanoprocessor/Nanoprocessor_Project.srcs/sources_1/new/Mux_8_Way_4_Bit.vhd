----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 10:00:07 PM
-- Design Name: 
-- Module Name: Mux_8_Way_4_Bit - Behavioral
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


entity Mux_8_Way_4_Bit is

    Port (Data_0, Data_1, Data_2, Data_3, Data_4, Data_5, Data_6, Data_7  : in STD_LOGIC_VECTOR (3 downto 0);   -- Input data
 
          RegSel : in STD_LOGIC_VECTOR (2 downto 0);        -- Selection input
          Output : out STD_LOGIC_VECTOR (3 downto 0));      -- Output data
end Mux_8_Way_4_Bit;

architecture Behavioral of Mux_8_Way_4_Bit is
    COMPONENT Mux_2_Way_4_Bit
    PORT(A_in: in STD_LOGIC_VECTOR (3 downto 0);
         B_in: in STD_LOGIC_VECTOR (3 downto 0);
         S: in STD_LOGIC;
         C_out: out STD_LOGIC_VECTOR (3 downto 0));
    END COMPONENT;
    SIGNAL C_out_0_0, C_out_0_1, C_out_0_2, C_out_0_3, C_out_1_0, C_out_1_1: STD_LOGIC_VECTOR (3 downto 0);     -- Intermediate signals for multiplexers

begin
    -- First stage of multiplexers
    Mux_2_Way_4_Bit_0_0: Mux_2_Way_4_Bit
    Port Map (A_in => Data_0,
              B_in => Data_1,
              S => RegSel(0),
              C_out => C_out_0_0);

    Mux_2_Way_4_Bit_0_1: Mux_2_Way_4_Bit
    Port Map (A_in => Data_2,
              B_in => Data_3,
              S => RegSel(0),
              C_out => C_out_0_1);

    Mux_2_Way_4_Bit_0_2: Mux_2_Way_4_Bit
    Port Map (A_in => Data_4,
              B_in => Data_5,
              S => RegSel(0),
              C_out => C_out_0_2);

    Mux_2_Way_4_Bit_0_3: Mux_2_Way_4_Bit
    Port Map (A_in => Data_6,
              B_in => Data_7,
              S => RegSel(0),
              C_out => C_out_0_3);
    
    -- Second stage of multiplexers
    Mux_2_Way_4_Bit_1_0: Mux_2_Way_4_Bit
    Port Map (A_in => C_out_0_0,
              B_in => C_out_0_1,
              S => RegSel(1),
              C_out => C_out_1_0);

    Mux_2_Way_4_Bit_1_1: Mux_2_Way_4_Bit
    Port Map (A_in => C_out_0_2,
              B_in => C_out_0_3,
              S => RegSel(1),
              C_out => C_out_1_1);
              
    -- Third stage of multiplexers
    Mux_2_Way_4_Bit_2_0: Mux_2_Way_4_Bit
    Port Map (A_in => C_out_1_0,
              B_in => C_out_1_1,
              S => RegSel(2),
              C_out => Output);

    
end Behavioral;

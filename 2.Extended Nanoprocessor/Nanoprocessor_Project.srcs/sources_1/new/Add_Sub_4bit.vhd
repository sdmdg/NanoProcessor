----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 01:08:05 PM
-- Design Name: 
-- Module Name: Add_Sub_4bit - Behavioral
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


entity Add_Sub_4bit is
    Port (
        A: in Std_Logic_Vector (3 downto 0);          -- Input A (4-bit)
        B: in Std_Logic_Vector (3 downto 0);          -- Input B (4-bit)
        S: out Std_Logic_Vector (3 downto 0);         -- Output sum/difference (4-bit)
        Add_Sub_Sel : in STD_LOGIC;                   -- Selector for addition/subtraction
        Carry : out STD_LOGIC;                        -- Output carry bit
        Zero: out Std_Logic                           -- Output zero flag
    );
end Add_Sub_4bit;

architecture Behavioral of Add_Sub_4bit is
    -- Component declaration for a full adder
    component FA
        port (
            A: in std_logic;
            B: in std_logic;
            C_in: in std_logic;
            S: out std_logic;
            C_out: out std_logic
        );
    end component;
    
    -- Internal signals
    Signal S_out, B_in, FA_C: Std_Logic_Vector (3 downto 0);
    Signal C_out: Std_Logic;
begin
    -- Full adder instances for each bit
    FA_0 : FA
        port map (
            A => A(0),
            B => B_in(0),
            C_in => Add_Sub_Sel, 
            S => S_out(0),
            C_out => FA_C(0)
        );
        
    FA_1 : FA
        port map (
            A => A(1),
            B => B_in(1),
            C_in => FA_C(0),
            S => S_out(1),
            C_out => FA_C(1)
        );
        
    FA_2 : FA
        port map (
            A => A(2),
            B => B_in(2),
            C_in => FA_C(1),
            S => S_out(2),
            C_out => FA_C(2)
        );
        
    FA_3 : FA
        port map (
            A => A(3),
            B => B_in(3),
            C_in => FA_C(2),
            S => S_out(3),
            C_out => FA_C(3)
        );
    
    -- Logic for selecting the input B based on the operation
    B_in(0) <= Add_Sub_Sel XOR B(0);
    B_in(1) <= Add_Sub_Sel XOR B(1);
    B_in(2) <= Add_Sub_Sel XOR B(2);
    B_in(3) <= Add_Sub_Sel XOR B(3);
    
    -- Assigning carry out and zero flag
    C_out <= FA_C(3);
    Zero <= NOT (S_out(0) OR S_out(1) OR S_out(2) OR S_out(3) OR C_out);
    
    -- Output assignments
    S <= S_out;
    Carry <= C_out;
end Behavioral;
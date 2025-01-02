----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 08:03:12 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Select : out STD_LOGIC;
           Immediate_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Select_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Select_B : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Select : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
----------------------------------------------
---------- **  Internal Signals  ** ----------
----------------------------------------------
-- SIGNAL(s) - Inputs
signal I_Instruction : STD_LOGIC_VECTOR (1 downto 0);
signal I_Ra : STD_LOGIC_VECTOR (2 downto 0);
signal I_Rb : STD_LOGIC_VECTOR (2 downto 0);
signal I_D : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Extracting values from the instruction vector for clear and readable code
    I_Instruction <= Instruction(11 downto 10);
    I_Ra <= Instruction(9 downto 7);
    I_Rb <= Instruction(6 downto 4);
    I_D <= Instruction(3 downto 0);

    process(I_Instruction, I_Ra, I_Rb, I_D) begin
    -- When I_Instruction, I_Ra, I_Rb or I_D gets changed, this process will run
        case I_Instruction is
        -- Instructions begin,
            when "10" =>
            -- Instruction 01 - MOVI   
                Reg_Enable <= I_Ra;         -- Enable the given Ra register
                Load_Select <= '1';         -- For immidiate values, 1
                Immediate_Val <= I_D;       -- Instruction, pass D
                Reg_Select_A <= "000";      -- Prevent undefined
                Reg_Select_B <= "000";      -- Prevent undefined
                Add_Sub_Select <= '0';      -- Prevent undefined
                Jump_Flag <= '0';           -- Default, 0
                Jump_Address <= "000";      -- Prevent undefined
                
            when "00" =>
            -- Instruction 02 - ADD
                Reg_Enable <= I_Ra;         -- Enable the given Ra register
                Load_Select <= '0';         -- Default, To connect Adder/Substaracter, 0
                Immediate_Val <= "0000";    -- Prevent undefined
                Reg_Select_A <= I_Ra;       -- Instruction, pass Ra
                Reg_Select_B <= I_Rb;       -- Instruction, pass Rb
                Add_Sub_Select <= '0';      -- Default, Addition, 0
                Jump_Flag <= '0';           -- Default, 0
                Jump_Address <= "000";      -- Prevent undefined
                
            when "01" =>
            -- Instruction 03 - NEG
                -- Perform substraction (0 - Ra) to calc -R,
                Reg_Enable <= I_Ra;         -- Enable the given Ra register
                Load_Select <= '0';         -- Default, To connect Adder/Substaracter, 0
                Immediate_Val <= "0000";    -- Prevent undefined
                Reg_Select_A <= I_Rb;       -- Instruction, pass Rb, 0
                Reg_Select_B <= I_Ra;       -- Instruction, pass Ra, input R
                Add_Sub_Select <= '1';      -- Substraction, 1
                Jump_Flag <= '0';           -- Default, 0
                Jump_Address <= "000";      -- Prevent undefined
                
            when "11" =>
            -- Instruction 04 - JZR
                Reg_Enable <= "000";                 -- Prevent undefined
                Load_Select <= '0';                  -- Prevent undefined
                Immediate_Val <= "0000";             -- Prevent undefined
                Reg_Select_A <= I_Ra;                -- Instruction, pass Ra
                Reg_Select_B <= I_Rb;                -- Prevent undefined
                Add_Sub_Select <= '0';               -- Prevent undefined
                
                if Reg_Check = "0000" then
                    Jump_Flag <= '1';                -- Jump, 1
                    Jump_Address <= I_D(2 downto 0); -- Instruction, pass D
                else
                    Jump_Flag <= '0';                -- Default, 0
                    Jump_Address <= "000";           -- Prevent undefined
                end if;
                
            when others =>
                Reg_Enable <= "000";        -- Prevent undefined
                Load_Select <= '0';         -- Prevent undefined
                Immediate_Val <= "0000";    -- Prevent undefined
                Reg_Select_A <= "000";      -- Prevent undefined
                Reg_Select_B <= "000";      -- Prevent undefined
                Add_Sub_Select <= '0';      -- Prevent undefined
                Jump_Flag <= '0';           -- Prevent undefined
                Jump_Address <= "000";      -- Prevent undefined
        end case;
    end process;
 end Behavioral;
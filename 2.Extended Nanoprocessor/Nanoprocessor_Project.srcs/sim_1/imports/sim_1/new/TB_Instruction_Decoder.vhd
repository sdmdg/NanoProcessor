----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 11:45:18 AM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder is
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
end component;

    SIGNAL ins_bus : STD_LOGIC_VECTOR(11 downto 0);
    SIGNAL reg_check, im_val : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL reg_en, reg_sel_a, reg_sel_b, jmp_addr : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL load_sel, add_sub_sel, jmp : STD_LOGIC;
    
begin
    UUT : Instruction_decoder PORT MAP( Instruction => ins_bus,
                                        Reg_Check => reg_check,
                                        Reg_Enable => reg_en,
                                        Load_Select => load_sel,
                                        Immediate_Val => im_val,
                                        Reg_Select_A => reg_sel_a,
                                        Reg_Select_B => reg_sel_b,
                                        Add_Sub_Select => add_sub_sel,
                                        Jump_Flag => jmp,
                                        Jump_Address => jmp_addr );

    main: process begin
    
        Reg_Check <= "0000";
        
        -- MOVI R1, 1
        ins_bus <= "100010000001";
        wait for 100ns;
        
        -- MOVI R2, 4
        ins_bus <= "100100000100";
        wait for 100ns;
        
        -- NEG R2
        ins_bus <= "010100000000";
        wait for 100ns;
        
        -- JZR 1
        ins_bus <= "110000000001";
        wait for 100ns;
        
        ----------------------------------------
        
        Reg_Check <= "1010";
        
        -- MOVI R1, 1
        ins_bus <= "100010000001";
        wait for 100ns;
        
        -- MOVI R2, 4
        ins_bus <= "100100000100";
        wait for 100ns;
        
        -- ADD R1, R2
        ins_bus <= "000010100000";
        wait for 100ns;
        
        -- JZR 0
        ins_bus <= "110000000000";
        wait;
        
    end process;
end Behavioral;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/19/2024 12:51:42 AM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
  Port (Clk: in Std_logic;
        Reset: in Std_Logic;
        Overflow: Out Std_Logic;
        Zero: Out Std_Logic;
        Reg_7_Out: Out Std_Logic_Vector (3 downto 0);
        S_7Seg:  Out Std_Logic_Vector (6 downto 0);
        Anode_activate: Out Std_Logic_Vector (3 downto 0)
        );
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is
    Component Add_Sub_4bit
    Port (A: in Std_Logic_Vector (3 downto 0);
          B: in Std_Logic_Vector (3 downto 0);
          S: out Std_Logic_Vector (3 downto 0); 
          Add_Sub_Sel : in STD_LOGIC;         
          Carry : out STD_LOGIC;
          Zero: out Std_Logic);
    End Component;
    
    Component Adder_3bit
    Port (A: in Std_Logic_Vector (2 downto 0);
          B: in Std_Logic_Vector (2 downto 0);
          S: out Std_Logic_Vector (2 downto 0);
          C_in : in STD_LOGIC;
          C_out : out STD_LOGIC);
    End Component; 
    
    Component Program_Counter
    Port (D : in STD_LOGIC_Vector (2 downto 0);
          Reset : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR (2 downto 0));
    End Component;
 
    Component Mux_8_Way_4_Bit
    Port (Data_0, Data_1, Data_2, Data_3, Data_4, Data_5, Data_6, Data_7  : in STD_LOGIC_VECTOR (3 downto 0); 
              RegSel : in STD_LOGIC_VECTOR (2 downto 0);  
              Output : out STD_LOGIC_VECTOR (3 downto 0));
    End Component;
    
    Component Mux_2_Way_4_Bit
    Port (A_in: in Std_Logic_Vector (3 downto 0);
          B_in: in Std_Logic_Vector (3 downto 0);
          S: in Std_Logic;
          C_out: out Std_Logic_Vector (3 downto 0)); 
    End Component;
    
    Component Mux_2_Way_3_Bit
    Port (A_in : in STD_LOGIC_VECTOR (2 downto 0);
          B_in : in STD_LOGIC_VECTOR (2 downto 0);
          S : in STD_LOGIC;
          C_out : out STD_LOGIC_VECTOR (2 downto 0));
    End Component;
    
    Component Register_Bank
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
    End Component;
    
    Component LUT
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
    End Component;
    
    Component Instruction_Decoder
    Port (Instruction : in STD_LOGIC_VECTOR (11 downto 0);
          Reg_Check : in STD_LOGIC_VECTOR (3 downto 0);
          Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
          Load_Select : out STD_LOGIC;
          Immediate_Val : out STD_LOGIC_VECTOR (3 downto 0);
          Reg_Select_A : out STD_LOGIC_VECTOR (2 downto 0);
          Reg_Select_B : out STD_LOGIC_VECTOR (2 downto 0);
          Add_Sub_Select : out STD_LOGIC;
          Jump_Flag : out STD_LOGIC;
          Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
    End Component;
    
    Component LUT_16_7
    Port (Address : in STD_LOGIC_VECTOR (3 downto 0);
         Data : out STD_LOGIC_VECTOR (6 downto 0));
    End Component;
    
    Component Slow_Clk              --Have to create the slow clock
        Port ( Clk_in: in STD_LOGIC;
               Clk_out: out STD_LOGIC);
    End Component;
    
    Signal instruction: Std_Logic_Vector (11 downto 0);
    Signal value_in, value_out_0, value_out_1, value_out_2, value_out_3, value_out_4, value_out_5, value_out_6, value_out_7: Std_Logic_Vector (3 downto 0);
    Signal mux_out_A, mux_out_B, sum, immediate_val: Std_Logic_Vector (3 downto 0);
    Signal reg_en, reg_sel_A, reg_sel_B, jump_address, adder_in, adder_out, counter_in, memory_sel: Std_Logic_Vector (2 downto 0);
    Signal add_sub_sel, load_sel, jump: Std_Logic;
    Signal Clk_slow: STD_LOGIC; --Internal Clock

begin

    --Turn on ony one of the seven segment displays
    Anode_activate <= "0111";
    
    Slow_Clk0: Slow_Clk
        Port Map ( Clk_in => Clk,
                   Clk_out => Clk_slow);

    Register_Bank_0: Register_Bank
    Port Map (Value_in => value_in,
              Reg_EN => reg_en,
              Clk => Clk_slow,
              Reset => Reset,
              Value_out_0 => value_out_0,
              Value_out_1 => value_out_1,
              Value_out_2 => value_out_2,
              Value_out_3 => value_out_3,
              Value_out_4 => value_out_4,
              Value_out_5 => value_out_5,
              Value_out_6 => value_out_6,
              Value_out_7 => value_out_7);
     
     Reg_7_Out <= value_out_7;        
     Mux_8_Way_4_Bit_A: Mux_8_Way_4_Bit
     Port Map (Data_0 => value_out_0,
               Data_1 => value_out_1,
               Data_2 => value_out_2,
               Data_3 => value_out_3,
               Data_4 => value_out_4,
               Data_5 => value_out_5,
               Data_6 => value_out_6,
               Data_7 => value_out_7,
               RegSel => reg_sel_A,  
               Output => mux_out_A);
               
    Mux_8_Way_4_Bit_B: Mux_8_Way_4_Bit
    Port Map (Data_0 => value_out_0,
              Data_1 => value_out_1,
              Data_2 => value_out_2,
              Data_3 => value_out_3,
              Data_4 => value_out_4,
              Data_5 => value_out_5,
              Data_6 => value_out_6,
              Data_7 => value_out_7,
              RegSel => reg_sel_B,  
              Output => mux_out_B);
              
    Mux_2_Way_4_Bit_0: Mux_2_Way_4_Bit
    Port Map (A_in => sum,
              B_in => immediate_val,
              S => load_sel,
              C_out => value_in);
              
    Add_Sub_4bit_0: Add_Sub_4bit
    Port Map (A => mux_out_A,
              B => mux_out_B,
              S => sum,
              Add_Sub_Sel => add_sub_sel,       
              Carry => Overflow,    --To Led
              Zero => Zero);        --To Led
              
    Instruction_Decoder_0: Instruction_Decoder
    Port Map (Instruction => instruction,
              Reg_Check => mux_out_A,
              Reg_Enable => reg_en,
              Load_Select => load_Sel,
              Immediate_Val => immediate_val,
              Reg_Select_A => reg_sel_A,
              Reg_Select_B => reg_sel_B,
              Add_Sub_Select => add_sub_sel,
              Jump_Flag => jump,
              Jump_Address => jump_address);
              
    Adder_3bit_0: Adder_3bit
    Port Map ( A => adder_in,
               B => "001",
               S => adder_out,
               C_in => '0');
               
    Mux_2_Way_3_Bit_0: Mux_2_Way_3_Bit
    Port Map (A_in => adder_out,
              B_in => jump_address,
              S => jump,
              C_out => counter_in);
              
    Program_Counter_0: Program_Counter
    Port Map (D => counter_in,
              Reset => Reset,
              Clk => Clk_slow,
              Q => memory_sel);
              
    adder_in <= memory_sel;
              
    Program_ROM: LUT
    Port Map ( address => memory_sel,
               data => instruction);
               
    LUT_for_7Seg: LUT_16_7
    Port Map (Address => value_out_7,
              Data => S_7Seg);
                    
end Behavioral;

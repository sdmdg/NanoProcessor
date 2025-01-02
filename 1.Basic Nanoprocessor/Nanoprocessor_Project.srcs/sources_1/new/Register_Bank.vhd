----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 05:05:19 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port (
        Value_in    : in  Std_Logic_Vector (3 downto 0);  -- Input values to be written into registers
        Reg_EN      : in  Std_Logic_Vector (2 downto 0);  -- Register enable signals
        Clk         : in  Std_Logic;                      -- Clock signal
        Reset       : in  Std_Logic;                      -- Reset signal
        Value_out_0 : out Std_Logic_Vector (3 downto 0);  -- Output value of register 0
        Value_out_1 : out Std_Logic_Vector (3 downto 0);  -- Output value of register 1
        Value_out_2 : out Std_Logic_Vector (3 downto 0);  -- Output value of register 2
        Value_out_3 : out Std_Logic_Vector (3 downto 0);  -- Output value of register 3
        Value_out_4 : out Std_Logic_Vector (3 downto 0);  -- Output value of register 4
        Value_out_5 : out Std_Logic_Vector (3 downto 0);  -- Output value of register 5
        Value_out_6 : out Std_Logic_Vector (3 downto 0);  -- Output value of register 6
        Value_out_7 : out Std_Logic_Vector (3 downto 0)   -- Output value of register 7
    );
end Register_Bank;

architecture Behavioral of Register_Bank is
    -- Component declarations
    Component Decoder_3_to_8
        Port (
            I  : in  STD_LOGIC_VECTOR (2 downto 0);   -- Input select lines
            EN : in  STD_LOGIC;                       -- Enable signal
            Y  : out STD_LOGIC_VECTOR (7 downto 0)    -- Output selection lines
        );
    End Component;
    
    Component Reg
        Port (
            D     : in  STD_LOGIC_VECTOR (3 downto 0);  -- Input data
            Reset : in  STD_LOGIC;                      -- Reset signal
            En    : in  STD_LOGIC;                      -- Enable signal
            Clk   : in  STD_LOGIC;                      -- Clock signal
            Q     : out STD_LOGIC_VECTOR (3 downto 0)   -- Output data
        );
    End Component;
    
    -- Internal signal declaration
    Signal Y0 : Std_Logic_Vector (7 downto 0);

begin
    -- Decoder instantiation
    Decoder_3_to_8_0 : Decoder_3_to_8
    Port Map (
        I  => Reg_EN,   -- Input select lines from Reg_EN
        EN => '1',      -- Enable signal is always high
        Y  => Y0        -- Output selection lines connected to Y0
    );
              
    -- Register instantiations
    Reg_0 : Reg
    Port Map (
        D     => "0000",  -- Register 0 value is always 0000 and it's a read-only register
        Reset => Reset,   -- Reset signal
        En    => Y0(0),   -- Enable signal from Y0(0)
        Clk   => Clk,     -- Clock signal
        Q     => Value_out_0  -- Output value of register 0
    );
    
    Reg_1 : Reg
    Port Map (
        D     => Value_in,  -- Input data from Value_in
        Reset => Reset,     -- Reset signal
        En    => Y0(1),     -- Enable signal from Y0(1)
        Clk   => Clk,       -- Clock signal
        Q     => Value_out_1  -- Output value of register 1
    );

    Reg_2 : Reg
    Port Map (
        D     => Value_in,  -- Input data from Value_in
        Reset => Reset,     -- Reset signal
        En    => Y0(2),     -- Enable signal from Y0(2)
        Clk   => Clk,       -- Clock signal
        Q     => Value_out_2  -- Output value of register 2
    );

    Reg_3 : Reg
    Port Map (
        D     => Value_in,  -- Input data from Value_in
        Reset => Reset,     -- Reset signal
        En    => Y0(3),     -- Enable signal from Y0(3)
        Clk   => Clk,       -- Clock signal
        Q     => Value_out_3  -- Output value of register 3
    );

    Reg_4 : Reg
    Port Map (
        D     => Value_in,  -- Input data from Value_in
        Reset => Reset,     -- Reset signal
        En    => Y0(4),     -- Enable signal from Y0(4)
        Clk   => Clk,       -- Clock signal
        Q     => Value_out_4  -- Output value of register 4
    );

    Reg_5 : Reg
    Port Map (
        D     => Value_in,  -- Input data from Value_in
        Reset => Reset,     -- Reset signal
        En    => Y0(5),     -- Enable signal from Y0(5)
        Clk   => Clk,       -- Clock signal
        Q     => Value_out_5  -- Output value of register 5
    );

    Reg_6 : Reg
    Port Map (
        D     => Value_in,  -- Input data from Value_in
        Reset => Reset,     -- Reset signal
        En    => Y0(6),     -- Enable signal from Y0(6)
        Clk   => Clk,       -- Clock signal
        Q     => Value_out_6  -- Output value of register 6
    );

    Reg_7 : Reg
    Port Map (
        D     => Value_in,  -- Input data from Value_in
        Reset => Reset,     -- Reset signal
        En    => Y0(7),     -- Enable signal from Y0(7)
        Clk   => Clk,       -- Clock signal
        Q     => Value_out_7  -- Output value of register 7
    );
              
end Behavioral;

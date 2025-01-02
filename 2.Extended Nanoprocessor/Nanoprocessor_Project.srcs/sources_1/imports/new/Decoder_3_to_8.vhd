----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 03:36:30 PM
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);    -- Input vector with 3 bits
           EN : in STD_LOGIC;                       -- Enable input
           Y : out STD_LOGIC_VECTOR (7 downto 0));  -- Input vector with 8 bits
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
    COMPONENT Decoder_2_to_4                        -- Instantiating a 2 to 4 decoder component
        PORT (I: in std_logic_vector;
              EN: in std_logic;
              Y: out std_logic_vector);
     END COMPONENT;
     SIGNAL I0,I1 : std_logic_vector (1 downto 0);  -- Signals for splitting input  
     SIGNAL Y0,Y1 : std_logic_vector (3 downto 0);  -- Signals for storing outputs of the first and second decoders
     SIGNAL EN0,EN1,I2 : std_logic;                 -- Signals for enabling the first and second decoders
        
begin
    Decoder_2_to_4_0: Decoder_2_to_4                -- Instantiation of the first 2 to 4 decoder
    PORT MAP (I => I0,
              EN => EN0,
              Y => Y0);
     
    Decoder_2_to_4_1: Decoder_2_to_4                -- Instantiation of the second 2 to 4 decoder
    PORT MAP (I => I1,
              EN => EN1,
              Y => Y1);
    
    -- Enable signals for the first and second decoders
    EN0 <= NOT(I(2)) AND EN;
    EN1 <= I(2) AND EN;
    
    -- Splitting input I into two parts for the two decoders
    I0 <= I(1 downto 0);
    I1 <= I(1 downto 0);
    I2 <= I(2);
    
    Y(3 downto 0) <= Y0;                            -- Assigning the lower 4 bits of the output from the first decoder
    Y(7 downto 4) <= Y1;                            -- Assigning the upper 4 bits of the output from the second decoder
            
end Behavioral;

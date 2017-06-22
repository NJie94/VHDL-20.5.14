----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:44:27 05/16/2014 
-- Design Name: 
-- Module Name:    clkDivider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DelayTimer is
    Port ( Reset : in  STD_LOGIC;
			  Clk_in : in STD_LOGIC;
			  startTimer : in STD_LOGIC;
			  startCount : out STD_LOGIC);
end DelayTimer;

architecture Behavioral of DelayTimer is

	signal clkTimer : STD_LOGIC := '0';
	signal Counter: integer range 1 to 500000 := 1;
	
begin

	frequency_divider: 
	process( Reset, startTimer, Counter, clkTimer, Clk_in) 
	begin
		if (Reset ='1') then
			Counter <= 1;
		elsif(rising_edge(Clk_in)) then
			if (startTimer = '1') then
				if (Counter = 500000) then
					clkTimer <= NOT(clkTimer);
					Counter <= 1;
				else
					Counter <= Counter + 1;
					clkTimer <= '0';
				end if;
			end if;
		end if;
		startCount <= clkTimer;
	end process;
end architecture Behavioral;



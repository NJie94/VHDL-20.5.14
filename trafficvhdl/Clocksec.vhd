----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:03 05/19/2014 
-- Design Name: 
-- Module Name:    Clock - Behavioral 
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

entity Clocksec is
    Port ( Reset : in  STD_LOGIC;
			  Clk_in : in STD_LOGIC;
           startCount : in  STD_LOGIC;
           delayCount : in  STD_LOGIC_VECTOR (3 downto 0);
           countLED : out  STD_LOGIC_VECTOR (3 downto 0);
           delayFinal : out  STD_LOGIC);
end Clocksec;

architecture Behavioral of Clocksec is

signal lagTime : STD_LOGIC_VECTOR ( 3 downto 0);

begin

	Timer:
	process(startCount, delayCount, lagTime, Reset, Clk_in)
	begin
		if (Reset = '1') then
			delayFinal <= '0';
			lagTime <= "0001";
		elsif (rising_edge(Clk_in)) then
			if(startCount = '1') then
				if (delayCount > lagTime) then
					lagTime <= lagTime + "0001";
					countLED <= lagTime;
					delayFinal <= '0';
				else
					delayFinal <= '1';
					countLED <= lagtime;
					lagTime <= "0001";
				end if;
			end if;
		end if;
	end process;
end architecture Behavioral;



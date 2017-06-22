----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:40:31 05/19/2014 
-- Design Name: 
-- Module Name:    LED_countdown - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_countdown is
    Port ( start_Countdown : in  STD_LOGIC;
           LagLEDs: in STD_LOGIC_VECTOR (3 downto 0);
           LEDs : out  STD_LOGIC_VECTOR (7 downto 0));
end LED_countdown;

architecture Behavioral of LED_countdown is

begin
	LED:
	process(start_Countdown, LagLEDs)
	begin
		LEDs <= "00000000";
		if( start_Countdown = '1') then 
			case LagLEDs is
				when "0001" => LEDs <= "11111111";
				when "0010" => LEDs <= "01111111";
				when "0011" => LEDs <= "00111111";
				when "0100" => LEDs <= "00011111";
				when "0101" => LEDs <= "00001111";
				when "0110" => LEDs <= "00000111";
				when "0111" => LEDs <= "00000011";
				when "1000" => LEDs <= "00000001";
				when others => LEDs <= "XXXXXXXX";
			end case;
		end if;
	end process;
end Behavioral;


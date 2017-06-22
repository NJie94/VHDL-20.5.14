----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:28:22 05/19/2014 
-- Design Name: 
-- Module Name:    statesTraffic - Behavioral 
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

entity statesTraffic is
    Port ( Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           CarEW : in  STD_LOGIC;
           CarNS : in  STD_LOGIC;
           PedEW : in  STD_LOGIC;
           PedNS : in  STD_LOGIC;
           delayFinal : in  STD_LOGIC;
           delayCount : out  STD_LOGIC_VECTOR (3 downto 0);
			  start_Countdown : out STD_LOGIC;
           Counter : out  STD_LOGIC_VECTOR (2 downto 0);
			  startTimer : out STD_LOGIC);
end statesTraffic;

architecture Behavioral of statesTraffic is

type StateType is (EW_Green, EW_GreenPed, EW_Amber, EW_Red, NS_Green, NS_GreenPed, NS_Amber, NS_Red, EW_Green12, NS_Green12);

signal ClearPed : STD_LOGIC;
signal temp_PedEW : STD_LOGIC;
signal temp_PedNS : STD_LOGIC;
signal state, nextState : StateType;
 		
begin

	CombinationalProcess:
	process(Clock, temp_PedEW, temp_PedNS, delayFinal, CarEW, CarNS, PedEW, PedNS, Reset, state, nextState)
	begin
		nextState <= state;
		start_Countdown <= '0';
		startTimer <= '0';
		delayCount <= "0000";
		if( Reset = '1') then
			start_Countdown <= '0';
			startTimer <= '0';
			state <= EW_Green;
			delayCount <= "0000";
		elsif(rising_edge(Clock)) then
			state <= nextState;
			if (ClearPed = '1') then
				temp_PedEW <= '0';
				temp_PedNS <= '0';
			elsif (PedEW = '1') then
				temp_PedEW <= '1';
			elsif (PedNS = '1') then
				temp_PedNS <= '1';
			end if;
		end if;
		
		case state is
			when EW_Green =>
				Counter <= "000";
				ClearPed <= '0';
				if(CarNS = '1' or (temp_PedNS = '1' and CarNS = '1') ) then
					startTimer <= '1';
					start_Countdown <= '1';
					delayCount <= "1000";
					if (delayFinal = '1') then
						nextState <= EW_Amber;
						startTimer <= '0';
						start_Countdown <= '0';
					else
						nextState <= EW_Green;
					end if;
				elsif (temp_PedEW = '1') then
					nextState <= EW_GreenPed;
				else
					nextState <= EW_Green;
				end if;
			when EW_Amber =>
				startTimer <= '1';
				Counter <= "001";
				delayCount <= "0010";
				ClearPed <= '0';
				if (delayFinal = '1') then
					nextState <= EW_Red;
					startTimer <= '0';
				end if;
			when EW_Red =>
				Counter <= "010";
				ClearPed <= '0';
				if(temp_PedNS = '1') then
					startTimer <= '1';
					delayCount <= "0001";
					if (delayFinal = '1') then
						nextState <= NS_GreenPed;
						startTimer <= '0';
					end if;
				else
					startTimer <= '1';
					delayCount <= "0001";
					if (delayFinal = '1') then
						nextState <= NS_Green12;
						startTimer <= '0';
					end if;
				end if;
			when NS_GreenPed =>
				Counter <= "011";
				startTimer <= '1';
				delayCount <= "1100";
				ClearPed <= '1';
				if (delayFinal = '1') then
					nextState <= NS_Green;
					startTimer <= '0';
				end if;
			when NS_Green12 =>
				Counter <= "100";
				startTimer <= '1';
				delayCount <= "1100";
				ClearPed <= '0';
				if (delayFinal = '1') then
					nextState <= NS_Green;
					startTimer <= '0';
				end if;
			when NS_Green =>
				Counter <= "100";
				ClearPEd <= '0';
				if(CarEW = '1' or temp_PedEW = '1') then
					startTimer <= '1';
					start_Countdown <= '1';
					delayCount <= "1000";
					if (delayFinal = '1') then
						nextState <= NS_Amber;
						startTimer <= '0';
						start_Countdown <= '0';
					end if;
				elsif(temp_PedNS = '1') then
					nextState <= NS_GreenPed;
				else
					nextState <= NS_Green;
				end if;
			when NS_Amber =>
				startTimer <= '1';
				Counter <= "101";
				delayCount <= "0010";
				ClearPed <= '0';
				if( delayFinal = '1') then
					nextState <= NS_Red;
					startTimer <= '0';
				end if;
			when NS_Red =>
				Counter <= "110";
				ClearPed <= '0';
				if(temp_PedEW = '1') then
					startTimer <= '1';
					delayCount <= "0001";
					if( delayFinal = '1') then
						nextState <= EW_GreenPed;
						startTimer <= '0';
					end if;
				else
					startTimer <= '1';
					delayCount <= "0001";
					if (delayFinal = '1') then
						nextState <= EW_Green12;
						startTimer <= '0';
					end if;
				end if;
			when EW_GreenPed =>
				Counter <= "111";
				startTimer <= '1';
				delayCount <= "1100";
				ClearPed <= '1';
				if (delayFinal = '1') then
					nextState <= EW_Green;
					startTimer <= '0';
				end if;
			when EW_Green12 =>
				Counter <= "000";
				startTimer <= '1';
				delayCount <="1100";
				ClearPed <= '0';
				if (delayFinal = '1') then
					nextState <= EW_Green;
					startTimer <= '0';
				end if;
		end case;
	end process;
				

end Behavioral;


--================================================================================
-- TrafficTopLevel.vhd
--
-- Traffic light system to control an intersection
--
--
--================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TrafficLevel is
	Port ( 	Reset : in STD_LOGIC;
				Clock : in STD_LOGIC;

				-- Car and pedestrian buttons
				CarEW : in STD_LOGIC; -- Car on EW road
				CarNS : in STD_LOGIC; -- Car on NS road
				PedEW : in STD_LOGIC; -- Pedestrian moving EW (crossing NS road)
				PedNS : in STD_LOGIC; -- Pedestrian moving NS (crossing EW road)

				-- Light control
				LightsEW : out STD_LOGIC_VECTOR (1 downto 0); -- controls EW lights
				LightsNS : out STD_LOGIC_VECTOR (1 downto 0); -- controls NS lights
				LEDs     : out STD_LOGIC_VECTOR (7 downto 0)   -- controles LED Lights
			);
end entity TrafficLevel;

architecture Behavioral of TrafficLevel is

signal delayFinal : STD_LOGIC;
signal delay_Count : STD_LOGIC_VECTOR (3 downto 0);
signal start_CountDown : STD_LOGIC;
signal Counter : STD_LOGIC_VECTOR (2 downto 0);
signal start_Timer : STD_LOGIC;
signal start_Count : STD_LOGIC;
signal count_LED : STD_LOGIC_VECTOR (3 downto 0);


begin
	
	statesTraffic:
	entity work.statesTraffic
		Port Map(Reset => Reset,
					Clock => Clock,
					CarEW => CarEW,
					CarNS => CarNS,
					PedEW => PedEW,
					PedNS => PedNS,
					delayFinal => delayFinal,
					delayCount => delay_Count,
					start_CountDown => start_CountDown,
					Counter => Counter,
					startTimer => start_Timer);
					
	DelayTimer:
	entity work.DelayTimer
		Port Map(Reset => Reset,
					Clk_in => Clock,
					startTimer => start_Timer,
					startCount => start_Count);	

	Trafficlight:
	entity work.Trafficlight
		Port Map(count => Counter,
					LightsEW => LightsEW,
					LightsNS => LightsNS);
					
	LED_countdown:
	entity work.LED_countdown
		Port Map(start_Countdown => start_Countdown,
					LagLEDs => count_LED,
					LEDs => LEDs);
					
	Clocksec:
	entity work.Clocksec
		Port Map(Reset => Reset,
					Clk_in => Clock,
					startCount => start_Count,
					delayCount => delay_Count,
					countLED => count_LED,
					delayFinal => delayFinal);
			
end architecture Behavioral;
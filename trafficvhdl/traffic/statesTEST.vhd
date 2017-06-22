--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:45:20 05/20/2014
-- Design Name:   
-- Module Name:   C:/Users/Y510P/Desktop/TrafficVHDL/Traffic/statesTEST.vhd
-- Project Name:  Traffic
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: statesTraffic
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY statesTEST IS
END statesTEST;
 
ARCHITECTURE behavior OF statesTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT statesTraffic
    PORT(
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         CarEW : IN  std_logic;
         CarNS : IN  std_logic;
         PedEW : IN  std_logic;
         PedNS : IN  std_logic;
         delayFinal : IN  std_logic;
         delayCount : OUT  std_logic_vector(3 downto 0);
         start_Countdown : OUT  std_logic;
         Counter : OUT  std_logic_vector(2 downto 0);
         startTimer : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';
   signal CarEW : std_logic := '0';
   signal CarNS : std_logic := '0';
   signal PedEW : std_logic := '0';
   signal PedNS : std_logic := '0';
   signal delayFinal : std_logic := '0';

 	--Outputs
   signal delayCount : std_logic_vector(3 downto 0);
   signal start_Countdown : std_logic;
   signal Counter : std_logic_vector(2 downto 0);
   signal startTimer : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 2000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: statesTraffic PORT MAP (
          Reset => Reset,
          Clock => Clock,
          CarEW => CarEW,
          CarNS => CarNS,
          PedEW => PedEW,
          PedNS => PedNS,
          delayFinal => delayFinal,
          delayCount => delayCount,
          start_Countdown => start_Countdown,
          Counter => Counter,
          startTimer => startTimer
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '1';
		wait for Clock_period/2;
		Clock <= '0';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Reset <= '1';
		delayFinal <= '0';
      wait for 100 ns;

		Reset <= '0';
		CarEW <= '0';
		CarNS <= '1';
		PedNS <= '1';
		PedEW <= '0';
      -- insert stimulus here 
		delayFinal <= '1';
		wait for 10000ns;
		delayFinal <= '0';
		

      wait;
   end process;

END;

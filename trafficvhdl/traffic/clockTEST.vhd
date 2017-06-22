--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:25:23 05/20/2014
-- Design Name:   
-- Module Name:   C:/Users/Y510P/Desktop/TrafficVHDL/Traffic/clockTEST.vhd
-- Project Name:  Traffic
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Clocksec
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
 
ENTITY clockTEST IS
END clockTEST;
 
ARCHITECTURE behavior OF clockTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Clocksec
    PORT(
         Reset : IN  std_logic;
         startCount : IN  std_logic;
         delayCount : IN  std_logic_vector(3 downto 0);
         countLED : OUT  std_logic_vector(3 downto 0);
         delayFinal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal startCount : std_logic := '0';
   signal delayCount : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal countLED : std_logic_vector(3 downto 0);
   signal delayFinal : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant startCount_period : time := 1000000 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Clocksec PORT MAP (
          Reset => Reset,
          startCount => startCount,
          delayCount => delayCount,
          countLED => countLED,
          delayFinal => delayFinal
        );

   -- Clock process definitions
   startCount_process :process
   begin
		startCount <= '1';
		wait for startCount_period/2;
		startCount <= '0';
		wait for startCount_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin					
		Reset <= '0';
		delayCount <= "1000";
		wait for startCount_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;

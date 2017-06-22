--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:56 05/20/2014
-- Design Name:   
-- Module Name:   C:/Users/Y510P/Desktop/TrafficVHDL/Traffic/trafficTEST.vhd
-- Project Name:  Traffic
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TrafficLevel
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
 
ENTITY trafficTEST IS
END trafficTEST;
 
ARCHITECTURE behavior OF trafficTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TrafficLevel
    PORT(
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         CarEW : IN  std_logic;
         CarNS : IN  std_logic;
         PedEW : IN  std_logic;
         PedNS : IN  std_logic;
         LightsEW : OUT  std_logic_vector(1 downto 0);
         LightsNS : OUT  std_logic_vector(1 downto 0);
         LEDs : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';
   signal CarEW : std_logic := '0';
   signal CarNS : std_logic := '0';
   signal PedEW : std_logic := '0';
   signal PedNS : std_logic := '0';

 	--Outputs
   signal LightsEW : std_logic_vector(1 downto 0);
   signal LightsNS : std_logic_vector(1 downto 0);
   signal LEDs : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 2000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TrafficLevel PORT MAP (
          Reset => Reset,
          Clock => Clock,
          CarEW => CarEW,
          CarNS => CarNS,
          PedEW => PedEW,
          PedNS => PedNS,
          LightsEW => LightsEW,
          LightsNS => LightsNS,
          LEDs => LEDs
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Reset <= '0';
		CarEW <= '0';
		CarNS <= '1';
		PedEW <= '0';
		PedNS <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;

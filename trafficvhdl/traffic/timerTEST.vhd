--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:27:00 05/20/2014
-- Design Name:   
-- Module Name:   C:/Users/Y510P/Desktop/TrafficVHDL/Traffic/timerTEST.vhd
-- Project Name:  Traffic
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DelayTimer
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
 
ENTITY timerTEST IS
END timerTEST;
 
ARCHITECTURE behavior OF timerTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DelayTimer
    PORT(
         Reset : IN  std_logic;
         Clk_in : IN  std_logic;
         startTimer : IN  std_logic;
         startCount : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clk_in : std_logic := '0';
   signal startTimer : std_logic := '0';

 	--Outputs
   signal startCount : std_logic;

   -- Clock period definitions
   constant Clk_in_period : time := 2000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DelayTimer PORT MAP (
          Reset => Reset,
          Clk_in => Clk_in,
          startTimer => startTimer,
          startCount => startCount
        );

   -- Clock process definitions
   Clk_in_process :process
   begin
		Clk_in <= '0';
		wait for Clk_in_period/2;
		Clk_in <= '1';
		wait for Clk_in_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		Reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      Reset <= '0';
		startTimer <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;

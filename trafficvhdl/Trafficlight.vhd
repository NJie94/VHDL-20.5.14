library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Trafficlight is
    Port ( count : in  STD_LOGIC_VECTOR (2 downto 0);
           LightsEW : out  STD_LOGIC_VECTOR (1 downto 0);
           LightsNS : out  STD_LOGIC_VECTOR (1 downto 0));
end Trafficlight;

architecture Behavioral of Trafficlight is

begin

 Light_EW:
   process(count)
   begin
      case count is   
         when "000"  => LightsEW <= "10"; -- east west green
         when "001"  => LightsEW <= "01"; -- east west yellow
         when "010"  => LightsEW <= "00"; -- east west red
         when "011"  => LightsEW <= "00"; -- east west red
         when "100"  => LightsEW <= "00"; -- east west red
         when "101"  => LightsEW <= "00"; -- east west red
			when "110"  => LightsEW <= "00"; -- east west red
         when "111"  => LightsEW <= "11"; -- east west green and ped east west green
         when others => LightsEW <= "XX" ;-- other counts shouldn't occur
			
      end case;
   end process;
	
	Ligth_NS:
   process(count)
   begin
      case count is   
         when "000" => LightsNS <= "00"; -- north south red
         when "001" => LightsNS <= "00"; -- north south red
         when "010" => LightsNS <= "00"; -- north south red
         when "011" => LightsNS <= "11"; -- north south green and ped north south green
         when "100" => LightsNS <= "10"; -- north souht green
         when "101" => LightsNS <= "01"; -- north south yellow
         when "110" => LightsNS <= "00"; -- north south red
         when "111" => LightsNS <= "00"; -- north south red
         when others => LightsNS <= "XX" ;-- other counts shouldn't occur

      end case;
   end process;


end Behavioral;


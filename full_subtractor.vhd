library ieee;
use ieee.std_logic_1164.all;
entity full_subtractor is
   port(full_input1,full_input2,full_Bin:in std_logic;
	     full_D,full_Bout                 :out std_logic);
end full_subtractor;

architecture behavioral of full_subtractor is
   signal temp_sub: std_logic;
	signal temp_Bout1: std_logic;
	signal temp_Bout2: std_logic;
	
	component or_gate_1bit is
      port(in1,in2: in std_logic;
           out3   : out std_logic);
   end component or_gate_1bit;
  
   component half_subtractor is
      port(input1,input2:in std_logic;
	        D,B          :out std_logic);
   end component half_subtractor;

begin

   FS1:half_subtractor port map(full_input1,full_input2,temp_sub,temp_Bout1);
   FS2:half_subtractor port map(temp_sub,full_Bin,full_D,temp_Bout2);
   FS3:or_gate_1bit   port map(temp_Bout1,temp_Bout2,full_Bout);

end behavioral;
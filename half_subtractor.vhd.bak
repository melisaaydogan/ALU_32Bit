library ieee;
use ieee.std_logic_1164.all;
entity half_subtractor is
   port(input1,input2:in std_logic;
	     D,B          :out std_logic);
end half_subtractor;

architecture behavioral of half_subtractor is
   signal not_input1: std_logic;
	
   component xor_gate_1bit is
      port(in1,in2: in std_logic;
           out5   : out std_logic);
   end component xor_gate_1bit;

   component not_gate_1bit is
      port(in1  : in std_logic;
        out7 : out std_logic);
   end component not_gate_1bit;

   component and_gate_1bit is
      port(in1,in2: in std_logic;
           out1   : out std_logic);
   end component and_gate_1bit;

begin

   HS1: xor_gate_1bit port map(input1,input2,D);
   HS2: not_gate_1bit port map(in1=>input1,out7=>not_input1);
   HS3: and_gate_1bit port map(not_input1,input2,B);

end behavioral;
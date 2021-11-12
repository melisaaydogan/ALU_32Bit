library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
   port(input1,input2 :in std_logic;
        sum,carry     :out std_logic);
end half_adder;

architecture behavioral of half_adder is 
   component xor_gate_1bit is
      port(in1,in2: in std_logic;
           out5   : out std_logic);
   end component xor_gate_1bit;
	
	component and_gate_1bit is
      port(in1,in2: in std_logic;
           out1   : out std_logic);
   end component and_gate_1bit;
	
begin

   H1: xor_gate_1bit port map (in1=>input1,in2=>input2,out5=>sum);
	H2: and_gate_1bit port map(in1=>input1,in2=>input2,out1=>carry);
	
end behavioral;
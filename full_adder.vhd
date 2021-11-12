library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
   port(full_input1,full_input2,full_cin:in std_logic;
        full_sum,full_cout              :out std_logic);
end full_adder;

architecture behavioral of full_adder is 
   
	signal temp_sum   :std_logic;
	signal temp_carry1:std_logic;
	signal temp_carry2: std_logic;

	component half_adder is
      port(input1,input2 :in std_logic;
           sum,carry     :out std_logic);
   end component half_adder;
	
	component or_gate_1bit is
      port(in1,in2: in std_logic;
           out3   : out std_logic);
   end component or_gate_1bit;
	
begin
   
   F1: half_adder   port map (full_input1,full_input2,temp_sum,temp_carry1);
	F2: half_adder   port map (temp_sum,full_cin,full_sum,temp_carry2);
	F3: or_gate_1bit port map (temp_carry1, temp_carry2,full_cout);
	
end behavioral;
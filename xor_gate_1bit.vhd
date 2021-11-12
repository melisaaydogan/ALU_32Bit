library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity xor_gate_1bit is
   port(in1,in2: in std_logic;
        out5      : out std_logic);
end xor_gate_1bit;

architecture behavioral of xor_gate_1bit is
   signal  gate5 : std_logic ;
begin
   process(in1,in2,gate5)
	   begin
		     if in2='0' then gate5<=in1;
			  elsif in2='1' then gate5<=not in1;
			  else gate5<='X';
			  end if;
		     out5<= gate5;
	end process;
end behavioral;
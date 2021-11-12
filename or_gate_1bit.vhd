library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity or_gate_1bit is
   port(in1,in2: in std_logic;
        out3    : out std_logic);
end or_gate_1bit;

architecture behavioral of or_gate_1bit is
   signal  gate3 : std_logic;
begin
   process(in1,in2,gate3)
	   begin
		     if    in1='0' then gate3<=in2;
			  elsif in1='1' then gate3<=in1;
			  else  gate3<='X';
			  end if;
		     out3<= gate3;
	end process;
end behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity and_gate_1bit is
   port(in1,in2: in std_logic;
        out1      : out std_logic);
end and_gate_1bit;

architecture behavioral of and_gate_1bit is
   signal  gate1 : std_logic;
begin
   process(in1,in2,gate1)
	   begin
		     if    in2='0' then gate1<='0';
			  elsif in2='1' then gate1<= in1;
			  else  gate1<='X';
			  end if;
		     out1<= gate1;
	end process;
end behavioral;
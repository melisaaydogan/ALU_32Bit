library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity not_gate_1bit is
   port(in1  : in std_logic;
        out7 : out std_logic);
end not_gate_1bit;

architecture behavioral of not_gate_1bit is
   signal  gate7 : std_logic;
begin
   process(in1,gate7)
	   begin
		     if    in1='0' then gate7<='1';
			  elsif in1='1' then gate7<='0';
			  else gate7<='X';
			  end if;

		     out7<= gate7;
		   		  
	end process;
end behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity or_gate is
   generic (N: integer:= 32);
   port(in1,in2: in std_logic_vector(N-1 downto 0);
        out3      : out std_logic_vector(N-1 downto 0));
end or_gate;

architecture behavioral of or_gate is
   signal  gate3 : std_logic_vector(N-1 downto 0);
begin
   process(in1,in2,gate3)
	   begin
		   for I in 0 to N-1 loop
		     if    in1(I)='0' then gate3(I)<=in2(I);
			  elsif in1(I)='1' then gate3(I)<=in1(I);
			  else  gate3(I)<='X';
			  end if;
		     out3(I)<= gate3(I);
		   end loop;
	end process;
end behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity xnor_gate is
   generic (N: integer:= 32);
   port(in1,in2: in std_logic_vector(N-1 downto 0);
        out6      : out std_logic_vector(N-1 downto 0));
end xnor_gate;

architecture behavioral of xnor_gate is
   signal gate6 : std_logic_vector(N-1 downto 0);
begin
   process(in1,in2,gate6)
	   begin
		   for I in 0 to N-1 loop
		     if in2(I)='0' then gate6(I)<=not in1(I);
			  elsif in2(I)='1' then gate6(I)<= in1(I);
			  else gate6(I)<='X';
			  end if;
		     out6(I)<= gate6(I);
		   end loop;
	end process;
end behavioral;
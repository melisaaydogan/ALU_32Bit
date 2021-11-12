library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity xor_gate is
   generic (N: integer:= 32);
   port(in1,in2: in std_logic_vector(N-1 downto 0);
        out5      : out std_logic_vector(N-1 downto 0));
end xor_gate;

architecture behavioral of xor_gate is
   signal  gate5 : std_logic_vector(N-1 downto 0);
begin
   process(in1,in2,gate5)
	   begin
		   for I in 0 to N-1 loop
		     if in2(I)='0' then gate5(I)<=in1(I);
			  elsif in2(I)='1' then gate5(I)<=not in1(I);
			  else gate5(I)<='X';
			  end if;
		     out5(I)<= gate5(I);
		   end loop;
	end process;
end behavioral;
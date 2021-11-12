library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity nor_gate is
   generic (N: integer:= 32);
   port(in1,in2: in std_logic_vector(N-1 downto 0);
        out4     : out std_logic_vector(N-1 downto 0));
end nor_gate;

architecture behavioral of nor_gate is
   signal  gate4 : std_logic_vector(N-1 downto 0);
begin
   process(in1,in2,gate4)
	   begin
		   for I in 0 to N-1 loop
		     if in2(I)='0' then gate4(I)<=not in1(I);
			  elsif in2(I)='1' then gate4(I)<= not in2(I);
			  else gate4(I)<='X';
			  end if;
		     out4(I)<= gate4(I);
		   end loop;
	end process;
end behavioral;
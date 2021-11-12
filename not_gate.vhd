library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity not_gate is
   generic (N: integer:= 32);
   port(in1   : in std_logic_vector(N-1 downto 0);
        out7  : out std_logic_vector(N-1 downto 0)
		 
		  );
end not_gate;

architecture behavioral of not_gate is
   signal  gate7 : std_logic_vector(N-1 downto 0);
begin
  
   process(in1,gate7)
	   begin
		   for I in 0 to N-1 loop
		     if    in1(I)='0' then gate7(I)<='1';
			  elsif in1(I)='1' then gate7(I)<='0';
			  else gate7(I)<='X';
			  end if;

		     out7(I)<= gate7(I);
			  
		   end loop;
		
	end process;
end behavioral;
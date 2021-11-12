library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity comp_4bit is
   port( M : in std_logic_vector(3 downto 0);
         Q : in std_logic_vector(3 downto 0);
			G,L,E: out std_logic
		);
			
end comp_4bit;

architecture behavioral of comp_4bit is


begin
   G  <= (M(3) and (not Q(3))) or 
         ((M(3) xnor Q(3)) and (M(2) and (not Q(2)))) or
		   ((M(3) xnor Q(3)) and (M(2)xnor Q(2)) and (M(1) and (not Q(1))))or
		   ((M(3) xnor Q(3)) and (M(2) xnor Q(2)) and (M(1) xnor Q(1)) and (M(0) and (not Q(0))));
		  
   L<=  (Q(3) and (not M(3))) or 
        ((M(3) xnor Q(3)) and (Q(2) and (not M(2)))) or
		  ((M(3) xnor Q(3)) and (M(2)xnor Q(2)) and Q(1)and (not M(1)))or
		  ((M(3) xnor Q(3)) and (M(2) xnor Q(2)) and (M(1) xnor Q(1)) and (Q(0) and (not M(0))));

   E<=(M(3) xnor Q(3)) and
        (M(2) xnor Q(2)) and 
		  (M(1) xnor Q(1)) and
		  (M(0) xnor Q(0));

end behavioral;
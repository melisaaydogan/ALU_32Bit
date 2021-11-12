library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mod_operator is
   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
			remainder :out std_logic_vector(N downto 0)
	);
end mod_operator;

architecture behavioral of mod_operator is

  shared variable A: std_logic_vector(N downto 0);
  shared variable AQ : std_logic_vector(2*N downto 0);
  shared variable M0 : std_logic_vector(N downto 0);
  shared variable temp_M0 :std_logic_vector(N downto 0);
  signal temp_remainder :std_logic_vector(N downto 0);
begin 

   process(M,Q)
	 begin
	   A := (others=>'0');
	   M0:= '0'& M;
      AQ:= A & Q;
		
		for I in 0 to N-1 loop
		      
		      AQ      := to_stdlogicvector(to_bitvector(std_logic_vector(AQ)) sla 1);
				temp_M0 := (not M0) + 1;
				A       :=AQ(2*N downto N)+temp_M0;
				
				
				if A(N)='0' then
               AQ(0):='1';
					AQ(2*N downto N):=A;
			      
		
		      else
				   AQ(0):='0';
					A:= A + M;
				   AQ(2*N downto N):=A;
				    
				 
			   end if;
				
		
	   end loop;
		
		      temp_remainder<= AQ(2*N downto N);
		
   end process;
	remainder<=temp_remainder;
end behavioral;
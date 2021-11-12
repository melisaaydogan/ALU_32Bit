library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity multiplier is

   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
			product:out std_logic_vector(N-1 downto 0)
	);
end multiplier;

architecture behavioral of multiplier is

   shared variable A    :std_logic_vector(N-1 downto 0);
	shared variable CAQ,CAM :std_logic_vector(2*N downto 0);
	shared variable C    :std_logic;
   shared variable temp,temp_1 :std_logic_vector(N-1 downto 0);

begin
   
	process(M,Q)
	
	   begin
		
		   C :='0';
	      A := (others=>'0');
         CAQ:= C & A & Q;
	    	CAM:= C & A & M;
		
		if Q>=M then
		
		for I in 0 to N-1 loop

				if CAQ(0)='0' then
				
		    		CAQ  := to_stdlogicvector(to_bitvector(std_logic_vector(CAQ)) sra 1);
					
				else
				
					CAQ(2*N downto N):=CAQ(2*N-1 downto N)+ ('0' & M);
					C:= CAQ(2*N);
	            CAQ :=to_stdlogicvector(to_bitvector(std_logic_vector(CAQ)) sra 1);
					 
			   end if;
				
				 product<=CAQ((N-1) downto 0);	
				 
    	end loop;
		
		elsif M>Q then
		
		  for I in 0 to N-1 loop
		  
          	if CAM(0)='0' then
				
		    		CAM  := to_stdlogicvector(to_bitvector(std_logic_vector(CAM)) sra 1);
					
				else
				
					CAM(2*N downto N):=CAM(2*N-1 downto N)+('0' &Q);
					C:= CAM(2*N);
	            CAM :=to_stdlogicvector(to_bitvector(std_logic_vector(CAM)) sra 1);
					 
			   end if;
				product<=CAM((N-1) downto 0);	
				
    	end loop;
		
		   else 
			product<=(others=>'0');
		end if;
	
	end process;
		
end behavioral;
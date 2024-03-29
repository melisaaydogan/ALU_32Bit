library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity comparator is
   generic (N: integer:= 32);
   port( M_32bit : in std_logic_vector(N-1 downto 0);
         Q_32bit : in std_logic_vector(N-1 downto 0);
		   greater,less,equal: out std_logic);
			
end comparator;

architecture behavioral of comparator is

component comp_4bit is
   port( M : in std_logic_vector(3 downto 0);
         Q : in std_logic_vector(3 downto 0);
		   G,L,E: out std_logic
		);
end component comp_4bit;

	signal gt,lt,eq:  std_logic_vector(7 downto 0);
   signal Q_temp1,Q_temp2,Q_temp3,Q_temp4,Q_temp5,Q_temp6,Q_temp7,Q_temp8: std_logic_vector(3 downto 0);
   signal M_temp1,M_temp2,M_temp3,M_temp4,M_temp5,M_temp6,M_temp7,M_temp8 : std_logic_vector(3 downto 0);

begin

M_temp1<=M_32bit(N-1 downto N-4);
M_temp2<=M_32bit(N-5 downto N-8);
M_temp3<=M_32bit(N-9 downto N-12);
M_temp4<=M_32bit(N-13 downto N-16);
M_temp5<=M_32bit(N-17 downto N-20);
M_temp6<=M_32bit(N-21 downto N-24);
M_temp7<=M_32bit(N-25 downto N-28);
M_temp8<=M_32bit(N-29 downto N-32);

Q_temp1<=Q_32bit(N-1 downto N-4);
Q_temp2<=Q_32bit(N-5 downto N-8);
Q_temp3<=Q_32bit(N-9 downto N-12);
Q_temp4<=Q_32bit(N-13 downto N-16);
Q_temp5<=Q_32bit(N-17 downto N-20);
Q_temp6<=Q_32bit(N-21 downto N-24);
Q_temp7<=Q_32bit(N-25 downto N-28);
Q_temp8<=Q_32bit(N-29 downto N-32);

 U1: comp_4bit port map(M=>M_temp1, Q=>Q_temp1, G=> gt(7), L=> lt(7),E=>eq(7));
 U2: comp_4bit port map(M=>M_temp2, Q=>Q_temp2, G=> gt(6), L=> lt(6),E=>eq(6));
 U3: comp_4bit port map(M=>M_temp3, Q=>Q_temp3, G=> gt(5), L=> lt(5),E=>eq(5));
 U4: comp_4bit port map(M=>M_temp4, Q=>Q_temp4, G=> gt(4), L=> lt(4),E=>eq(4));
 U5: comp_4bit port map(M=>M_temp5, Q=>Q_temp5, G=> gt(3), L=> lt(3),E=>eq(3));
 U6: comp_4bit port map(M=>M_temp6, Q=>Q_temp6, G=> gt(2), L=> lt(2),E=>eq(2));
 U7: comp_4bit port map(M=>M_temp7, Q=>Q_temp7, G=> gt(1), L=> lt(1),E=>eq(1));
 U8: comp_4bit port map(M=>M_temp8, Q=>Q_temp8, G=> gt(0), L=> lt(0),E=>eq(0));
 
 process(gt,lt,eq)
 begin
 
 if gt(7)='1' and lt(7)='0' and eq(7)='0' then
   greater<=gt(7);
	equal<=eq(7);
	less<=lt(7);
 elsif gt(7)='0' and lt(7)='1' and eq(7)='0' then
   greater<=gt(7);
	equal<=eq(7);
	less<=lt(7);
 else
 
      if gt(6)='1' and lt(6)='0' and eq(6)='0' then
         greater<=gt(6);
	      equal<=eq(6);
	      less<=lt(6);
      elsif gt(6)='0' and lt(6)='1' and eq(6)='0' then
         greater<=gt(6);
	      equal<=eq(6);
	      less<=lt(6);
		
		else
		
		   if gt(5)='1' and lt(5)='0' and eq(5)='0' then
            greater<=gt(5);
	         equal<=eq(5);
	         less<=lt(5);
         elsif gt(5)='0' and lt(5)='1' and eq(5)='0' then
            greater<=gt(5);
	         equal<=eq(5);
	         less<=lt(5);
			
			else
			
   		   if gt(4)='1' and lt(4)='0' and eq(4)='0'then
               greater<=gt(4);
	            equal<=eq(4);
	            less<=lt(4);
            elsif gt(4)='0' and lt(4)='1' and eq(4)='0' then
               greater<=gt(4);
	            equal<=eq(4);
	            less<=lt(4);
		    	else
				
					if gt(3)='1' and lt(3)='0' and eq(3)='0'then
                  greater<=gt(3);
	               equal<=eq(3);
	               less<=lt(3);
               elsif gt(3)='0' and lt(3)='1' and eq(3)='0'then
                  greater<=gt(3);
	               equal<=eq(3);
	              less<=lt(3);
					else
						if gt(2)='1' and lt(2)='0' and eq(2)='0'then
                     greater<=gt(2);
	                  equal<=eq(2);
	                  less<=lt(2);
                  elsif gt(2)='0' and lt(2)='1' and eq(2)='0' then
                     greater<=gt(2);
	                  equal<=eq(2);
	                 less<=lt(2);
						else
						   if gt(1)='1' and lt(1)='0' and eq(1)='0' then
                        greater<=gt(1);
	                     equal<=eq(1);
	                     less<=lt(1);
                     elsif gt(1)='0' and lt(1)='1' and eq(1)='0' then
                        greater<=gt(1);
	                     equal<=eq(1);
	                     less<=lt(1);
							else
							   if gt(0)='1' and lt(0)='0' and eq(0)='0'then
                           greater<=gt(0);
	                        equal<=eq(0);
	                        less<=lt(0);
                       elsif gt(0)='0' and lt(0)='1' and eq(0)='0' then
                           greater<=gt(0);
	                        equal<=eq(0);
	                        less<=lt(0);
								else
								   greater<=gt(0);
	                        equal<=eq(0);
	                        less<=lt(0);
								end if;
							end if;
                  end if;
               end if;
            end if;
         end if;
      end if;
end if;
																
end process;
end behavioral;
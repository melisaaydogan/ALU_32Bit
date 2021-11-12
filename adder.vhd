library ieee;
use ieee.std_logic_1164.all;

entity adder is
   generic (N: integer:=32);
   port(adder_input1,adder_input2 :in std_logic_vector(N-1 downto 0);
        adder_sum                 :out std_logic_vector(N-1 downto 0);
		  adder_cout                :out std_logic);
end adder;

architecture behavioral of adder is 
   
	signal temp:std_logic_vector(N-2 downto 0);
	
	component full_adder is
      port(full_input1,full_input2,full_cin:in std_logic;
           full_sum,full_cout              :out std_logic);
   end component full_adder;

begin
   A1:for I in 0 to N-1 generate
	      begin
			   A2:if I=0 generate
				    begin
					  first: full_adder port map(full_input1=>adder_input1(I),full_input2=>adder_input2(I),full_cin=>'0',full_sum=>adder_sum(I),full_cout=>temp(I));
					end generate;
          	A3:if I<N-1 and I>0 generate
                begin 
	              middle: full_adder port map(full_input1=>adder_input1(I),full_input2=>adder_input2(I),full_cin=>temp(I-1),full_sum=>adder_sum(I),full_cout=>temp(I));				
               end generate;
			   A4:if I=N-1 generate
		           begin
					   final:full_adder port map(full_input1=>adder_input1(I),full_input2=>adder_input2(I),full_cin=>temp(I-1),full_sum=>adder_sum(I),full_cout=>adder_cout);  
               end generate;
		end generate;
	
end behavioral;
	
library ieee;
use ieee.std_logic_1164.all;
entity subtractor is
   generic (N:integer:=32);
   port(sub_input1,sub_input2:in std_logic_vector(N-1 downto 0);
	     sub_D                :out std_logic_vector(N-1 downto 0);
		  sub_Bout             :out std_logic );
end subtractor;

architecture behavioral of subtractor is
   signal temp: std_logic_vector(N-2 downto 0);
	
   component full_subtractor is
       port(full_input1,full_input2,full_Bin:in std_logic;
	         full_D,full_Bout                :out std_logic);
   end component full_subtractor;

	component or_gate_1bit is
      port(in1,in2: in std_logic;
           out3   : out std_logic);
   end component or_gate_1bit;

begin

   S1:for I in 0 to N-1 generate
	      begin
			   S2:if I=0 generate
				    begin
					  first: full_subtractor port map(full_input1=>sub_input1(I),full_input2=>sub_input2(I),full_Bin=>'0',full_D=>sub_D(I),full_Bout=>temp(I));
					end generate;
          	S3:if I<N-1 and I>0 generate
                begin 
	              middle: full_subtractor port map(full_input1=>sub_input1(I),full_input2=>sub_input2(I),full_Bin=>temp(I-1),full_D=>sub_D(I),full_Bout=>temp(I));				
               end generate;
			   S4:if I=N-1 generate
		           begin
					   final:full_subtractor port map(full_input1=>sub_input1(I),full_input2=>sub_input2(I),full_Bin=>temp(I-1),full_D=>sub_D(I),full_Bout=>sub_Bout);  
               end generate;
		end generate;

end behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity right_rotate is

   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      rr_result:out std_logic_vector(N-1 downto 0));
			
end right_rotate;

architecture behavioral of right_rotate is

component  control is

   generic (N:integer:=32);
   port(Q : in std_logic_vector(N-1 downto 0);
	     Q_control: out std_logic_vector(N downto 0)
			);
			
end component control;

signal Q_new: std_logic_vector(5 downto 0);	
signal Q_control_rr :  std_logic_vector(N downto 0);	
signal rr: std_logic_vector(N-1 downto 0);

begin

U1R: control port map(Q,Q_control_rr);
 Q_new<= Q_control_rr(5 downto 0);

process (M,Q_new)

begin
case Q_new is
when "000000" => 
     rr<=M;  
when "000001" => 
    rr<=M(0) &M(N-1 downto 1);
    
when "000010" =>  
     rr<=M(N-31 downto 0) & M(N-1 downto 2)   ;

when "000011" =>  
    rr<= M(N-30 downto 0) & M(N-1 downto 3) ;

when "000100" =>  
   rr<= M(N-29 downto 0) & M(N-1 downto 4) ;	 
	
when "000101" => 
   rr<= M(N-28 downto 0) & M(N-1 downto 5) ;	 
	  
when "000110" =>  
   rr<= M(N-27 downto 0) & M(N-1 downto 6) ;	 

when "000111" =>  
   rr<= M(N-26 downto 0) & M(N-1 downto 7) ;	 

when "001000" => 
   rr<= M(N-25 downto 0) & M(N-1 downto 8) ;	 
	  
when "001001" => 
   rr<= M(N-24 downto 0) & M(N-1 downto 9) ;	 
	  
when "001010" =>  
   rr<= M(N-23 downto 0) & M(N-1 downto 10) ;	 

when "001011" =>  
   rr<= M(N-22 downto 0) & M(N-1 downto 11) ;	 

when "001100" =>  
   rr<= M(N-21 downto 0) & M(N-1 downto 12) ;	 
	  
when "001101" => 
   rr<= M(N-20 downto 0) & M(N-1 downto 13) ;	 
	  
when "001110" =>  
   rr<= M(N-19 downto 0) & M(N-1 downto 14) ;
	
when "001111" =>  
   rr<= M(N-18 downto 0) & M(N-1 downto 15) ;
  
when "010000" =>  
   rr<= M(N-17 downto 0) & M(N-1 downto 16) ;	
	  
when "010001" => 
   rr<= M(N-16 downto 0) & M(N-1 downto 17) ;	
	  
when "010010" =>  
   rr<= M(N-15 downto 0) & M(N-1 downto 18) ;	

when "010011" =>  
   rr<= M(N-14 downto 0) & M(N-1 downto 19) ;	

when "010100" =>  
   rr<= M(N-13 downto 0) & M(N-1 downto 20) ;	

when "010101" => 
   rr<= M(N-12 downto 0) & M(N-1 downto 21) ;
	  
when "010110" =>  
   rr<= M(N-11 downto 0) & M(N-1 downto 22) ;	

when "010111" =>  
   rr<= M(N-10 downto 0) & M(N-1 downto 23) ;	

when "011000" =>  
   rr<= M(N-9 downto 0) & M(N-1 downto 24) ;	
	  
when "011001" => 
   rr<= M(N-8 downto 0) & M(N-1 downto 25) ;	
	  
when "011010" =>  
   rr<= M(N-7 downto 0) & M(N-1 downto 26) ;	

when "011011" =>  
   rr<= M(N-6 downto 0) & M(N-1 downto 27) ;	

when "011100" =>  
   rr<= M(N-5 downto 0) & M(N-1 downto 28) ;	
  
when "011101" => 
   rr<= M(N-4 downto 0) & M(N-1 downto 29) ;	
	  
when "011110" =>  
   rr<= M(N-3 downto 0) & M(N-1 downto 30) ;	
	
when "011111" =>  
   rr<= M(N-2 downto 0) & M(N-1 downto 31) ;	
	

when others => 
     rr<= (others =>'0');
end case;

 end process;
 rr_result<=rr;
end behavioral;
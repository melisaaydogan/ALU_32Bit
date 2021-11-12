library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity left_rotate is

   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      lr_result:out std_logic_vector(N-1 downto 0));

			
end left_rotate;

architecture behavioral of left_rotate is
component control is

   generic (N:integer:=32);
   port(Q : in std_logic_vector(N-1 downto 0);
	     Q_control: out std_logic_vector(N downto 0)
			);
			
end component control;

signal Q_new: std_logic_vector(5 downto 0);
signal Q_control_lr :  std_logic_vector(N downto 0);	
signal lr: std_logic_vector(N-1 downto 0);



begin
U1L: control port map(Q,Q_control_lr);
Q_new<=Q_control_lr(5 downto 0);

process (M,Q_new)

begin

case Q_new is
when "000000" => 
     lr<=M;  
when "000001" => 
    lr<=M(N-2 downto 0) &M(N-1);
    
when "000010" =>  
    lr<=M(N-3 downto 0) & M(N-1 downto 30)   ;

when "000011" =>  
    lr<= M(N-4 downto 0) & M(N-1 downto 29) ;

when "000100" =>  
    lr<= M(N-5 downto 0) & M(N-1 downto 28) ;	 
	
when "000101" => 
   lr<= M(N-6 downto 0) & M(N-1 downto 27) ;	 
	  
when "000110" =>  
   lr<= M(N-7 downto 0) & M(N-1 downto 26) ;	 

when "000111" =>  
   lr<= M(N-8 downto 0) & M(N-1 downto 25) ;	 

when "001000" => 
   lr<= M(N-9 downto 0) & M(N-1 downto 24) ;	 
	  
when "001001" => 
   lr<= M(N-10 downto 0) & M(N-1 downto 23) ;	 
	  
when "001010" =>  
   lr<= M(N-11 downto 0) & M(N-1 downto 22) ;	 

when "001011" =>  
   lr<= M(N-12 downto 0) & M(N-1 downto 21) ;	 

when "001100" =>  
   lr<= M(N-13 downto 0) & M(N-1 downto 20) ;	 
	  
when "001101" => 
   lr<= M(N-14 downto 0) & M(N-1 downto 19) ;	 
	  
when "001110" =>  
   lr<= M(N-15 downto 0) & M(N-1 downto 18) ;
	
when "001111" =>  
   lr<= M(N-16 downto 0) & M(N-1 downto 17) ;
  
when "010000" =>  
   lr<= M(N-17 downto 0) & M(N-1 downto 16) ;	
	  
when "010001" => 
   lr<= M(N-18 downto 0) & M(N-1 downto 15) ;	
	  
when "010010" =>  
   lr<= M(N-19 downto 0) & M(N-1 downto 14) ;	

when "010011" =>  
   lr<= M(N-20 downto 0) & M(N-1 downto 13) ;	

when "010100" =>  
   lr<= M(N-21 downto 0) & M(N-1 downto 12) ;	

when "010101" => 
   lr<= M(N-22 downto 0) & M(N-1 downto 11) ;
	  
when "010110" =>  
   lr<= M(N-23 downto 0) & M(N-1 downto 10) ;	

when "010111" =>  
   lr<= M(N-24 downto 0) & M(N-1 downto 9) ;	

when "011000" =>  
   lr<= M(N-25 downto 0) & M(N-1 downto 8) ;	
	  
when "011001" => 
   lr<= M(N-26 downto 0) & M(N-1 downto 7) ;	
	  
when "011010" =>  
   lr<= M(N-27 downto 0) & M(N-1 downto 6) ;	

when "011011" =>  
   lr<= M(N-28 downto 0) & M(N-1 downto 5) ;	

when "011100" =>  
   lr<= M(N-29 downto 0) & M(N-1 downto 4) ;	
  
when "011101" => 
   lr<= M(N-30 downto 0) & M(N-1 downto 3) ;	
	  
when "011110" =>  
   lr<= M(N-31 downto 0) & M(N-1 downto 2) ;	



when others => 
     lr<= (others =>'0');
end case;


 end process;
 lr_result<=lr;
end behavioral;
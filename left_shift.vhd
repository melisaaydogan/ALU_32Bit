library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity left_shift is

   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      ls_result:out std_logic_vector(N-1 downto 0));
			
end left_shift;

architecture behavioral of left_shift is
signal Q_new : std_logic_vector(5 downto 0);
signal ls: std_logic_vector(N-1 downto 0);
begin
 Q_new <= Q(5 downto 0);

process (M,Q,Q_new)

begin

case Q_new is
when "000000" => 
     ls<=M;  
when "000001" => 
     ls<=M(N-2 downto 0) & '0'  ;
when "000010" =>  
     ls<=M(N-3 downto 0) & "00"  ;

when "000011" =>  
     ls<=M(N-4 downto 0) & "000";

when "000100" =>  
     ls<=M(N-5 downto 0) & "0000"; 
	  
when "000101" => 
     ls<= M(N-6 downto 0) & "00000";
	  
when "000110" =>  
     ls<= M(N-7 downto 0) & "000000";

when "000111" =>  
     ls<= M(N-8 downto 0) & "0000000"  ;

when "001000" =>  
     ls<= M(N-9 downto 0) & "00000000" ;  
	  
when "001001" => 
     ls<= M(N-10 downto 0) & "000000000"  ;
	  
when "001010" =>  
     ls<=M(N-11 downto 0) & "0000000000"  ;

when "001011" =>  
     ls<= M(N-12 downto 0) & "00000000000"  ;

when "001100" =>  
     ls<=M(N-13 downto 0) & "000000000000"  ; 
	  
when "001101" => 
     ls<= M(N-14 downto 0) & "0000000000000"  ;
	  
when "001110" =>  
     ls<=  M(N-15 downto 0) & "00000000000000" ;

when "001111" =>  
     ls<= M(N-16 downto 0) & "000000000000000" ;

when "010000" =>  
     ls<= M(N-17 downto 0) & "0000000000000000" ;  
	  
when "010001" => 
     ls<=  M(N-18 downto 0) & "00000000000000000" ;
	  
when "010010" =>  
     ls<= M(N-19 downto 0) & "000000000000000000"  ;

when "010011" =>  
     ls<=M(N-20 downto 0) & "0000000000000000000";

when "010100" =>  
     ls<=M(N-21 downto 0) & "00000000000000000000"; 

when "010101" => 
     ls<= M(N-22 downto 0) & "000000000000000000000";
	  
when "010110" =>  
     ls<= M(N-23 downto 0) & "0000000000000000000000";

when "010111" =>  
     ls<= M(N-24 downto 0) & "00000000000000000000000";

when "011000" =>  
     ls<= M(N-25 downto 0) & "000000000000000000000000"  ; 
	  
when "011001" => 
     ls<= M(N-26 downto 0) & "0000000000000000000000000"  ;
	  
when "011010" =>  
     ls<=M(N-27 downto 0) & "00000000000000000000000000" ;

when "011011" =>  
     ls<=M(N-28 downto 0) & "000000000000000000000000000"  ;

when "011100" =>  
     ls<= M(N-29 downto 0) & "0000000000000000000000000000"  ; 
  
when "011101" => 
     ls<=M(N-30 downto 0) & "00000000000000000000000000000"  ;
	  
when "011110" =>  
     ls<=M(N-31 downto 0) & "000000000000000000000000000000"  ;


when others => 
     ls<= (others =>'0');
	
end case;

 end process;
 ls_result<=ls;
end behavioral;
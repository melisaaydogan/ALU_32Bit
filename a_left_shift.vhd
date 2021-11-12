library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity a_left_shift is

   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      lsa_result:out std_logic_vector(N-1 downto 0));

			
end a_left_shift;

architecture behavioral of a_left_shift is
signal Q_new : std_logic_vector(5 downto 0);
signal lsa: std_logic_vector(N-1 downto 0);
begin
 Q_new <= Q(5 downto 0);
 


process (M,Q,Q_new)

begin

if M(0)='0' then 
case Q_new is
when "000000" => 
     lsa<=M;  
when "000001" => 
     lsa<= M(N-2 downto 0) &'0'  ;
when "000010" =>  
     lsa<= M(N-3 downto 0) & "00" ;

when "000011" =>  
     lsa<= M(N-4 downto 0) & "000"  ;

when "000100" =>  
     lsa<= M(N-5 downto 0) & "0000" ; 
	  
when "000101" => 
     lsa<= M(N-6 downto 0) & "00000"  ;
	  
when "000110" =>  
     lsa<= M(N-7 downto 0) & "000000" ;

when "000111" =>  
     lsa<= M(N-8 downto 0) & "0000000" ;

when "001000" =>  
     lsa<= M(N-9 downto 0) & "00000000"  ;  
	  
when "001001" => 
     lsa<= M(N-10 downto 0) & "000000000";
	  
when "001010" =>  
     lsa<= M(N-11 downto 0)& "0000000000"  ;

when "001011" =>  
     lsa<= M(N-12 downto 0)& "00000000000" ;

when "001100" =>  
     lsa<= M(N-13 downto 0)& "000000000000" ; 
	  
when "001101" => 
     lsa<= M(N-14 downto 0)& "0000000000000"  ;
	  
when "001110" =>  
     lsa<= M(N-15 downto 0)&"00000000000000" ;

when "001111" =>  
     lsa<= M(N-16 downto 0)& "000000000000000" ;

when "010000" =>  
     lsa<= M(N-17 downto 0)& "0000000000000000" ;  
	  
when "010001" => 
     lsa<= M(N-18 downto 0)& "00000000000000000"  ;
	  
when "010010" =>  
     lsa<= M(N-19 downto 0)& "000000000000000000" ;

when "010011" =>  
     lsa<= M(N-20 downto 0)& "0000000000000000000"  ;

when "010100" =>  
     lsa<= M(N-21 downto 0)& "00000000000000000000" ; 

when "010101" => 
     lsa<= M(N-22 downto 0)& "000000000000000000000" ;
	  
when "010110" =>  
     lsa<= M(N-23 downto 0)& "0000000000000000000000" ;

when "010111" =>  
     lsa<= M(N-24 downto 0)&"00000000000000000000000" ;

when "011000" =>  
     lsa<=M(N-25 downto 0)& "000000000000000000000000" ; 
	  
when "011001" => 
     lsa<=M(N-26 downto 0)& "0000000000000000000000000" ;
	  
when "011010" =>  
     lsa<=M(N-27 downto 0)& "00000000000000000000000000"  ;

when "011011" =>  
     lsa<=M(N-28 downto 0)& "000000000000000000000000000" ;

when "011100" =>  
     lsa<=M(N-29 downto 0)& "0000000000000000000000000000"  ; 
  
when "011101" => 
     lsa<=M(N-30 downto 0)& "00000000000000000000000000000" ;
	  
when "011110" =>  
     lsa<=M(N-31 downto 0)& "000000000000000000000000000000"  ;





when others => 
     lsa<= (others =>'0');
end case;


else
case Q_new is
when "000000" => 
     lsa<=M;  
when "000001" => 
     lsa<= M(N-2 downto 0) & '1'  ;
when "000010" =>  
     lsa<= M(N-3 downto 0) & "11"  ;

when "000011" =>  
     lsa<= M(N-4 downto 0) & "111" ;

when "000100" =>  
     lsa<= M(N-5 downto 0) & "1111"  ; 
	  
when "000101" => 
     lsa<= M(N-6 downto 0) & "11111"  ;
	  
when "000110" =>  
     lsa<= M(N-7 downto 0) & "111111" ;

when "000111" =>  
     lsa<=M(N-8 downto 0) & "1111111"  ;

when "001000" =>  
     lsa<= M(N-9 downto 0) & "11111111"  ;  
	  
when "001001" => 
     lsa<=M(N-10 downto 0) & "111111111"  ;
	  
when "001010" =>  
     lsa<=M(N-11 downto 0) & "1111111111"  ;

when "001011" =>  
     lsa<=M(N-12 downto 0) & "11111111111"  ;

when "001100" =>  
     lsa<=M(N-13 downto 0) & "111111111111"  ; 
	  
when "001101" => 
     lsa<=M(N-14 downto 0) & "1111111111111"  ;
	  
when "001110" =>  
     lsa<=M(N-15 downto 0) & "11111111111111"  ;

when "001111" =>  
     lsa<=M(N-16 downto 0)& "111111111111111"  ;

when "010000" =>  
     lsa<=M(N-17 downto 0) & "1111111111111111"  ;  
	  
when "010001" => 
     lsa<=M(N-18 downto 0) & "11111111111111111"  ;
	  
when "010010" =>  
     lsa<=M(N-19 downto 0) & "111111111111111111" ;

when "010011" =>  
     lsa<=M(N-20 downto 0) & "1111111111111111111" ;

when "010100" =>  
     lsa<=M(N-21 downto 0) & "11111111111111111111" ; 

when "010101" => 
     lsa<=M(N-22 downto 0) & "111111111111111111111"  ;
	  
when "010110" =>  
     lsa<=M(N-23 downto 0) & "1111111111111111111111"  ;

when "010111" =>  
     lsa<=M(N-24 downto 0) &"11111111111111111111111"  ;

when "011000" =>  
     lsa<=M(N-25 downto 0) & "111111111111111111111111"  ; 
	  
when "011001" => 
     lsa<=M(N-26 downto 0) & "1111111111111111111111111" ;
	  
when "011010" =>  
     lsa<=M(N-27 downto 0) & "11111111111111111111111111" ;

when "011011" =>  
     lsa<= M(N-28 downto 0) & "111111111111111111111111111" ;

when "011100" =>  
     lsa<= M(N-29 downto 0) & "1111111111111111111111111111" ; 
  
when "011101" => 
     lsa<=M(N-30 downto 0) & "11111111111111111111111111111"  ;
	  
when "011110" =>  
     lsa<= M(N-31 downto 0) & "111111111111111111111111111111" ;

when others => lsa<= (others =>'1');

end case;

end if;
 end process;
 lsa_result<=lsa;
end behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity right_shift is

   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      rs_result:out std_logic_vector(N-1 downto 0));
			
end right_shift;

architecture behavioral of right_shift is
signal Q_new : std_logic_vector(5 downto 0);
signal rs: std_logic_vector(N-1 downto 0);
begin
 Q_new <= Q(5 downto 0);

process (M,Q,Q_new)

begin

case Q_new is
when "000000" => 
     rs<=M;  
when "000001" => 
     rs<='0' & M(N-1 downto 1);
when "000010" =>  
     rs<="00" & M(N-1 downto 2);

when "000011" =>  
     rs<="000" & M(N-1 downto 3);

when "000100" =>  
     rs<="0000" & M(N-1 downto 4); 
	  
when "000101" => 
     rs<="00000" & M(N-1 downto 5);
	  
when "000110" =>  
     rs<="000000" & M(N-1 downto 6);

when "000111" =>  
     rs<="0000000" & M(N-1 downto 7);

when "001000" =>  
     rs<="00000000" & M(N-1 downto 8);  
	  
when "001001" => 
     rs<="000000000" & M(N-1 downto 9);
	  
when "001010" =>  
     rs<="0000000000" & M(N-1 downto 10);

when "001011" =>  
     rs<="00000000000" & M(N-1 downto 11);

when "001100" =>  
     rs<="000000000000" & M(N-1 downto 12); 
	  
when "001101" => 
     rs<="0000000000000" & M(N-1 downto 13);
	  
when "001110" =>  
     rs<="00000000000000" & M(N-1 downto 14);

when "001111" =>  
     rs<="000000000000000" & M(N-1 downto 15);

when "010000" =>  
     rs<="0000000000000000" & M(N-1 downto 16);  
	  
when "010001" => 
     rs<="00000000000000000" & M(N-1 downto 17);
	  
when "010010" =>  
     rs<="000000000000000000" & M(N-1 downto 18);

when "010011" =>  
     rs<="0000000000000000000" & M(N-1 downto 19);

when "010100" =>  
     rs<="00000000000000000000" & M(N-1 downto 20); 

when "010101" => 
     rs<="000000000000000000000" & M(N-1 downto 21);
	  
when "010110" =>  
     rs<="0000000000000000000000" & M(N-1 downto 22);

when "010111" =>  
     rs<="00000000000000000000000" & M(N-1 downto 23);

when "011000" =>  
     rs<="000000000000000000000000" & M(N-1 downto 24); 
	  
when "011001" => 
     rs<="0000000000000000000000000" & M(N-1 downto 25);
	  
when "011010" =>  
     rs<="00000000000000000000000000" & M(N-1 downto 26);

when "011011" =>  
     rs<="000000000000000000000000000" & M(N-1 downto 27);

when "011100" =>  
     rs<="0000000000000000000000000000" & M(N-1 downto 28); 
  
when "011101" => 
     rs<="00000000000000000000000000000" & M(N-1 downto 29);
	  
when "011110" =>  
     rs<="000000000000000000000000000000" & M(N-1 downto 30);

when "011111" =>  
     rs<="0000000000000000000000000000000" & M(N-1 downto 31);

when "100000" =>  
     rs<="00000000000000000000000000000000" & M(N-1 downto 32); 

when others => 
     rs<= (others =>'0');
	
end case;
 end process;
 rs_result<=rs;
end behavioral;
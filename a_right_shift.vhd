library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity a_right_shift is

   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      rsa_result:out std_logic_vector(N-1 downto 0));
			
end a_right_shift;

architecture behavioral of a_right_shift is
signal Q_new : std_logic_vector(5 downto 0);
signal rsa: std_logic_vector(N-1 downto 0);
begin
 Q_new <= Q(5 downto 0);
 


process (M,Q,Q_new)

begin

if M(N-1)='0' then 
case Q_new is
when "000000" => 
     rsa<=M;  
when "000001" => 
     rsa<='0' & M(N-1 downto 1);
when "000010" =>  
     rsa<="00" & M(N-1 downto 2);

when "000011" =>  
     rsa<="000" & M(N-1 downto 3);

when "000100" =>  
     rsa<="0000" & M(N-1 downto 4); 
	  
when "000101" => 
     rsa<="00000" & M(N-1 downto 5);
	  
when "000110" =>  
     rsa<="000000" & M(N-1 downto 6);

when "000111" =>  
     rsa<="0000000" & M(N-1 downto 7);

when "001000" =>  
     rsa<="00000000" & M(N-1 downto 8);  
	  
when "001001" => 
     rsa<="000000000" & M(N-1 downto 9);
	  
when "001010" =>  
     rsa<="0000000000" & M(N-1 downto 10);

when "001011" =>  
     rsa<="00000000000" & M(N-1 downto 11);

when "001100" =>  
     rsa<="000000000000" & M(N-1 downto 12); 
	  
when "001101" => 
     rsa<="0000000000000" & M(N-1 downto 13);
	  
when "001110" =>  
     rsa<="00000000000000" & M(N-1 downto 14);

when "001111" =>  
     rsa<="000000000000000" & M(N-1 downto 15);

when "010000" =>  
     rsa<="0000000000000000" & M(N-1 downto 16);  
	  
when "010001" => 
     rsa<="00000000000000000" & M(N-1 downto 17);
	  
when "010010" =>  
     rsa<="000000000000000000" & M(N-1 downto 18);

when "010011" =>  
     rsa<="0000000000000000000" & M(N-1 downto 19);

when "010100" =>  
     rsa<="00000000000000000000" & M(N-1 downto 20); 

when "010101" => 
     rsa<="000000000000000000000" & M(N-1 downto 21);
	  
when "010110" =>  
     rsa<="0000000000000000000000" & M(N-1 downto 22);

when "010111" =>  
     rsa<="00000000000000000000000" & M(N-1 downto 23);

when "011000" =>  
     rsa<="000000000000000000000000" & M(N-1 downto 24); 
	  
when "011001" => 
     rsa<="0000000000000000000000000" & M(N-1 downto 25);
	  
when "011010" =>  
     rsa<="00000000000000000000000000" & M(N-1 downto 26);

when "011011" =>  
     rsa<="000000000000000000000000000" & M(N-1 downto 27);

when "011100" =>  
     rsa<="0000000000000000000000000000" & M(N-1 downto 28); 
  
when "011101" => 
     rsa<="00000000000000000000000000000" & M(N-1 downto 29);
	  
when "011110" =>  
     rsa<="000000000000000000000000000000" & M(N-1 downto 30);

when "011111" =>  
     rsa<="0000000000000000000000000000000" & M(N-1 downto 31);



when others => 
     rsa<= (others =>'0');
end case;


else
case Q_new is
when "000000" => 
     rsa<=M;  
when "000001" => 
     rsa<='1' & M(N-1 downto 1);
when "000010" =>  
     rsa<="11" & M(N-1 downto 2);

when "000011" =>  
     rsa<="111" & M(N-1 downto 3);

when "000100" =>  
     rsa<="1111" & M(N-1 downto 4); 
	  
when "000101" => 
     rsa<="11111" & M(N-1 downto 5);
	  
when "000110" =>  
     rsa<="111111" & M(N-1 downto 6);

when "000111" =>  
     rsa<="1111111" & M(N-1 downto 7);

when "001000" =>  
     rsa<="11111111" & M(N-1 downto 8);  
	  
when "001001" => 
     rsa<="111111111" & M(N-1 downto 9);
	  
when "001010" =>  
     rsa<="1111111111" & M(N-1 downto 10);

when "001011" =>  
     rsa<="11111111111" & M(N-1 downto 11);

when "001100" =>  
     rsa<="111111111111" & M(N-1 downto 12); 
	  
when "001101" => 
     rsa<="1111111111111" & M(N-1 downto 13);
	  
when "001110" =>  
     rsa<="11111111111111" & M(N-1 downto 14);

when "001111" =>  
     rsa<="111111111111111" & M(N-1 downto 15);

when "010000" =>  
     rsa<="1111111111111111" & M(N-1 downto 16);  
	  
when "010001" => 
     rsa<="11111111111111111" & M(N-1 downto 17);
	  
when "010010" =>  
     rsa<="111111111111111111" & M(N-1 downto 18);

when "010011" =>  
     rsa<="1111111111111111111" & M(N-1 downto 19);

when "010100" =>  
     rsa<="11111111111111111111" & M(N-1 downto 20); 

when "010101" => 
     rsa<="111111111111111111111" & M(N-1 downto 21);
	  
when "010110" =>  
     rsa<="1111111111111111111111" & M(N-1 downto 22);

when "010111" =>  
     rsa<="11111111111111111111111" & M(N-1 downto 23);

when "011000" =>  
     rsa<="111111111111111111111111" & M(N-1 downto 24); 
	  
when "011001" => 
     rsa<="1111111111111111111111111" & M(N-1 downto 25);
	  
when "011010" =>  
     rsa<="11111111111111111111111111" & M(N-1 downto 26);

when "011011" =>  
     rsa<="111111111111111111111111111" & M(N-1 downto 27);

when "011100" =>  
     rsa<="1111111111111111111111111111" & M(N-1 downto 28); 
  
when "011101" => 
     rsa<="11111111111111111111111111111" & M(N-1 downto 29);
	  
when "011110" =>  
     rsa<="111111111111111111111111111111" & M(N-1 downto 30);

when "011111" =>  
     rsa<="1111111111111111111111111111111" & M(N-1 downto 31);



when others => rsa<= (others =>'1');

end case;


end if;
 end process;
 rsa_result<=rsa;
end behavioral;
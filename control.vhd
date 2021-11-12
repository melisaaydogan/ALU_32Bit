library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity control is

   generic (N:integer:=32);
   port(Q : in std_logic_vector(N-1 downto 0);
	     Q_control: out std_logic_vector(N downto 0)
			);
			
end control;
architecture behavioral of control is

component comparator is
   generic (N: integer:= 32);
   port( M_32bit : in std_logic_vector(N-1 downto 0);
         Q_32bit : in std_logic_vector(N-1 downto 0);
		   greater,less,equal: out std_logic);
			
end component comparator;

component mod_operator is
   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
			remainder :out std_logic_vector(N downto 0)
	);
end component mod_operator;

constant divisor: std_logic_vector(31 downto 0) :="00000000000000000000000000100000";
signal Q_new1: std_logic_vector(N downto 0);
begin
   
c1: mod_operator port map(divisor,Q,Q_new1);
Q_control<= Q_new1;

 end behavioral;
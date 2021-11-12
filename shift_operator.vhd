library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity shift_operator is

   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
		   rr:out std_logic_vector(N-1 downto 0);
		   rl:out std_logic_vector(N-1 downto 0);
		   ls:out std_logic_vector(N-1 downto 0);
			rs:out std_logic_vector(N-1 downto 0);
			lsa:out std_logic_vector(N-1 downto 0);
			rsa:out std_logic_vector(N-1 downto 0);
			rr_kon,rl_kon,ls_kon,rs_kon,lsa_kon,rsa_kon : out std_logic_vector(N-1 downto 0));
			
end shift_operator;

architecture behavioral of shift_operator is


begin
process (M)
begin
 rs<='0' & M(N-1 downto 1);       rs_kon<= to_stdlogicvector(to_bitvector(std_logic_vector(M)) srl 1);
 ls<= M(N-2 downto 0 ) &'0';      ls_kon<= to_stdlogicvector(to_bitvector(std_logic_vector(M)) sll 1);
 rr<=M(0)& M(N-1 downto 1);       rr_kon<= to_stdlogicvector(to_bitvector(std_logic_vector(M)) ror 1);
 rl<=M(N-2 downto 0) & M(N-1);    rl_kon<= to_stdlogicvector(to_bitvector(std_logic_vector(M)) rol 1);
 rsa<= M(N-1) & M(N-1 downto 1);  rsa_kon<=to_stdlogicvector(to_bitvector(std_logic_vector(M)) sra 1);
 lsa<=M(N-2 downto 0) & M(0);      lsa_kon<=to_stdlogicvector(to_bitvector(std_logic_vector(M)) sla 1);
 end process;
end behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity alu_32bit is
   generic (N: integer :=32);
	port    (alu_in1,alu_in2 : in std_logic_vector(N-1 downto 0); 
            alu_out_result  : out std_logic_vector(N-1 downto 0);
		      CF_a,CF_s       : out std_logic;
				clk,reset       : in std_logic;
		      alu_remainder   : out std_logic_vector(N downto 0);
            selection       : in std_logic_vector(4 downto 0)
 );
end alu_32bit;

architecture behavioral of alu_32bit is

-- AND kapısı komponenti : and operatörü
component and_gate is
   generic (N: integer:= 32);
   port    (in1,in2   : in std_logic_vector(N-1 downto 0);
            out1      : out std_logic_vector(N-1 downto 0));
end component and_gate;

--NAND kapısı  komponenti : nand operatörü
component nand_gate is
   generic (N: integer:= 32);
   port    (in1,in2   : in std_logic_vector(N-1 downto 0);
            out2      : out std_logic_vector(N-1 downto 0));
end component nand_gate;

--OR kapısı komponenti : or operatörü
component or_gate is
   generic (N: integer:= 32);
   port    (in1,in2   : in std_logic_vector(N-1 downto 0);
            out3      : out std_logic_vector(N-1 downto 0));
end component or_gate;

--NOR kapısı komponenti : nor operatörü
component nor_gate is
   generic (N: integer:= 32);
   port    (in1,in2   : in std_logic_vector(N-1 downto 0);
            out4      : out std_logic_vector(N-1 downto 0));
end component nor_gate;

--XOR kapısı komponenti : xor operatötü
component xor_gate is
   generic (N: integer:= 32);
   port    (in1,in2   : in std_logic_vector(N-1 downto 0);
            out5      : out std_logic_vector(N-1 downto 0));
end component xor_gate;

--XNOR kapısı komponenti : xnor operatörü
component xnor_gate is
   generic (N: integer:= 32);
   port    (in1,in2   : in std_logic_vector(N-1 downto 0);
            out6      : out std_logic_vector(N-1 downto 0));
end component xnor_gate;

--NOT kapısı komponenti : not operatörü
component not_gate is
   generic (N: integer:= 32);
   port    (in1       : in std_logic_vector(N-1 downto 0);
            out7      : out std_logic_vector(N-1 downto 0));
end component not_gate;

--ADDER komponenti : + operatörü
component adder is
   generic (N: integer:=32);
   port    (adder_input1,adder_input2 : in std_logic_vector(N-1 downto 0);
            adder_sum                 : out std_logic_vector(N-1 downto 0);
		      adder_cout                : out std_logic);
end component adder;

--SUBTRACTOR komponenti : - operatörü
component subtractor is
   generic (N:integer:=32);
   port    (sub_input1,sub_input2 : in std_logic_vector(N-1 downto 0);
	         sub_D                 : out std_logic_vector(N-1 downto 0);
		      sub_Bout              : out std_logic );
end component subtractor;

--MULTIPLIER komponenti : * operatörü
component multiplier is
   generic (N:integer:=32);
   port    (M        : in std_logic_vector(N-1 downto 0);
	         Q        : in std_logic_vector(N-1 downto 0);
			   product  : out std_logic_vector(N-1 downto 0));
end component multiplier;

--DIVIDER komponenti : / operatörü
component divider is
   generic (N:integer:=32);
   port    (M        : in std_logic_vector(N-1 downto 0);
	         Q        : in std_logic_vector(N-1 downto 0);
			   quotient : out std_logic_vector(N-1 downto 0);
			   remainder: out std_logic_vector(N downto 0));
end component divider;

--MOD_OPERATOR komponenti : mod operatörü
component mod_operator is
   generic (N :integer:=32);
   port    (M         : in std_logic_vector(N-1 downto 0);
	         Q         : in std_logic_vector(N-1 downto 0);
			   remainder : out std_logic_vector(N downto 0));
end component mod_operator;

--COMPARATOR komponenti : > , = , < operatörleri
component comparator is
   generic (N : integer:= 32);
   port    (M_32bit    : in std_logic_vector(N-1 downto 0);
            Q_32bit    : in std_logic_vector(N-1 downto 0);
		      greater,less,equal: out std_logic);
			
end component comparator;

--RIGHT_SHIFT komponenti : srl operatörü
component  right_shift is
   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      rs_result:out std_logic_vector(N-1 downto 0));	
end component right_shift;

--LEFT_SHIFT komponenti : sll operatörü
component left_shift is
   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      ls_result:out std_logic_vector(N-1 downto 0));		
end component left_shift;

--RIGHT_ROTATE komponenti : ror operatörü
component right_rotate is
   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      rr_result:out std_logic_vector(N-1 downto 0));	
end component right_rotate;

--LEFT_ROTATE komponenti : rol operatörü
component left_rotate is
   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      lr_result:out std_logic_vector(N-1 downto 0));
end component left_rotate;

--A_RIGHT_SHIFT komponenti : sra operatörü
component a_right_shift is
   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      rsa_result:out std_logic_vector(N-1 downto 0));	
end component a_right_shift;

--A_LEFT_SHIFT komponenti : sla operatörü
component a_left_shift is
   generic (N:integer:=32);
   port( M : in std_logic_vector(N-1 downto 0);
	      Q : in std_logic_vector(N-1 downto 0);
	      lsa_result:out std_logic_vector(N-1 downto 0));	
end component a_left_shift;

--Tanımlanan sinyalleri komponentlerin çıkış değerlerini atama için kullanacağız
 signal alu_out1,alu_out2,alu_out3,alu_out4,alu_out5,alu_out6,alu_out7,alu_out8,alu_out9,alu_out10,alu_out11,alu_out12,alu_out13,alu_out14,alu_out15,alu_out16,alu_out17: std_logic_vector(N-1 downto 0);
 
 --Toplama işlemindeki elde için alu_cout tanımlandı. Çıkarma işlemindeki borç için ise alu_bout tanımlandı
 signal alu_cout,alu_bout: std_logic;
 
 --Comparator işlemindeki 3 çıkışı atamak için 3 sinyal tanımlandı
 signal alu_great,alu_less,alu_equal: std_logic;
 
 --Bölme işleminden kalan için alu_remainder1 tanımlandı. Mod işleminin sonucu için ise alu_remainder2 tanımlandı
 signal alu_remainder1,alu_remainder2:  std_logic_vector(N downto 0);

 --Carry FLag değeleri için iki değişken tanımlandı
 signal CF_subtractor,CF_adder: std_logic;
 
 --Bölümden kalan değeri atamak için değişken tanımlandı
 signal alu_remainder_divider : std_logic_vector(N downto 0);
 
 --Çıkış değerini atamak için değişken tanımlandı
 signal alu_out               : std_logic_vector(N-1 downto 0);
 
begin

--and_gate komponentindeki girişler ve çıkış tanımlandı
 M1:  and_gate       port map(alu_in1, alu_in2, alu_out1);
 
 --nand_gate komponentindeki girişler ve çıkış tanımlandı
 M2:  nand_gate      port map(alu_in1, alu_in2, alu_out2);
 
 --or_gate komponentindeki girişler ve çıkış tanımlandı
 M3:  or_gate        port map(alu_in1, alu_in2, alu_out3);
 
 --nor_gate komponentindeki girişler ve çıkış tanımlandı
 M4:  nor_gate       port map(alu_in1, alu_in2, alu_out4);
 
 --xor_gate komponentindeki girişler ve çıkış tanımlandı
 M5:  xor_gate       port map(alu_in1, alu_in2, alu_out5);
 
 --xnor_gate komponentindeki girişler ve çıkış tanımlandı
 M6:  xnor_gate      port map(alu_in1, alu_in2, alu_out6);
 
 --not_gate komponentindeki giriş ve çıkış tanımlandı
 M7:  not_gate       port map(alu_in1, alu_out7);
 
 --adder komponentindeki girişler ve çıkışlar tanımlandı
 M8:  adder          port map(alu_in1, alu_in2, alu_out8,alu_cout);
 
 --subtractor komponentindeki girişler ve çıkışlar tanımlandı
 M9:  subtractor     port map(alu_in1, alu_in2, alu_out9,alu_bout);
 
 --multiplier komponentindeki girişler ve çıkış tanımlandı
 M10: multiplier     port map(alu_in1, alu_in2, alu_out10);
 
 --divider komponentindeki girişler ve çıkışlar tanımlandı
 M11: divider        port map(alu_in2,alu_in1,alu_out11,alu_remainder1);
 
 --mod_operator komponentindeki girişler ve çıkış tanımlandı
 M12: mod_operator   port map(alu_in2,alu_in1,alu_remainder2);
 
 --comparator komponentindeki girişler ve çıkışlar tanımlandı
 M13: comparator     port map(alu_in1,alu_in2,alu_great,alu_less,alu_equal);
 
 --right_shift komponentindeki giriş ve çıkış tanımlandı
 M14: right_shift    port map(alu_in1,alu_in2,alu_out12);
 
 --left_shift komponentindeki giriş ve çıkış tanımlandı
 M15: left_shift     port map(alu_in1,alu_in2,alu_out13);
 
 --right_rotate komponentindeki giriş ve çıkış tanımlandı
 M16: right_rotate   port map(alu_in1,alu_in2,alu_out14);
 
 --left_rotate komponentindeki giriş ve çıkış tanımlandı
 M17: left_rotate    port map(alu_in1,alu_in2,alu_out15);
 
 --a_right_shift komponentindeki giriş ve çıkış tanımlandı
 M18: a_right_shift  port map(alu_in1,alu_in2,alu_out16);
 
 --a_left_shift komponentindeki giriş ve çıkış tanımlandı
 M19: a_left_shift   port map(alu_in1,alu_in2,alu_out17);
 
 --process ile yapılacak işlemlerin hangi değerlere göre hassaslaşacağı belirlendi
 process(clk,reset,selection,alu_out1,alu_out2,alu_out3,alu_out4,alu_out5,alu_out6,alu_out7,alu_out8,alu_out9,alu_out10,alu_out11,alu_out12,alu_out13,alu_out14,alu_out15,alu_out16,alu_out17,alu_cout,alu_bout,alu_great,alu_less,alu_equal,alu_remainder1,alu_remainder2)
 begin
 --Eğer reset 1 ise tüm çıkış değerleri 0 olacak
 if reset='1' then
      alu_out<=(others=>'0') ;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
		
 --Eğer reset 1 den farklı ise çıkış değerlerine işlemlerin sonucu atanacak 
 else 
 --selection ile her işlem bir seçime atandı
 case selection is
   
	-- selection "00000" seçildiğinde and işlemi yapılacak
   when "00000"=>
      alu_out<=  alu_out1;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
   
   -- selection "00001" seçildiğinde nand işlemi yapılacak
	when "00001"=>
	   alu_out<=  alu_out2; 
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');	
		
	-- selection "00010" seçildiğinde or işlemi yapılacak
	when "00010"=>
	   alu_out<=  alu_out3;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');	
		
	-- selection "00011" seçildiğinde nor işlemi yapılacak
	when "00011"=>
      alu_out<=  alu_out4;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');	
		
	-- selection "00100" seçildiğinde xor işlemi yapılacak
	when "00100"=>
      alu_out<=  alu_out5;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');	
		
   -- selection "00101" seçildiğinde xnor işlemi yapılacak
	when "00101"=>
      alu_out<=  alu_out6;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');	
		
	-- selection "00110" seçildiğinde not işlemi yapılacak		
	when "00110"=>
      alu_out<= alu_out7;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
		
	-- selection "00111" seçildiğinde adder işlemi yapılacak
	when "00111"=>
      alu_out<=  alu_out8;
    	CF_adder<=alu_cout;
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	
	-- selection "01000" seçildiğinde subtractor işlemi yapılacak
	when "01000"=>
      alu_out<= alu_out9;
		CF_subtractor<= alu_bout;
	   CF_adder<='0';
		alu_remainder_divider<= (others=>'0');
		
	-- selection "01001" seçildiğinde multiplier işlemi yapılacak
	when "01001"=>
      alu_out<= alu_out10;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
		
	-- selection "01010" seçildiğinde divider işlemi yapılacak
	when "01010"=>
      alu_out<=  alu_out11;
	   alu_remainder_divider<=alu_remainder1;
	   CF_adder<= '0';
		CF_subtractor<= '0';
		
	-- selection "01011" seçildiğinde mod işlemi yapılacak		
	when "01011"=>
      alu_out<=(others=>'0');
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<=alu_remainder2;
		
	-- selection "01100" seçildiğinde comparator işlemi yapılacak
	when "01100"=>
      alu_out<= "00000000000000000000000000000" & alu_great & alu_equal & alu_less ;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	
	-- selection "01101" seçildiğinde right_shift işlemi yapılacak		
	when "01101"=>
      alu_out<= alu_out12;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	
	-- selection "01110" seçildiğinde left_shift işlemi yapılacak
	when "01110"=>
      alu_out<=alu_out13;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	
	-- selection "01111" seçildiğinde right_rotate işlemi yapılacak
	when "01111"=>
      alu_out<= alu_out14;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	
	-- selection "10000" seçildiğinde left_rotate işlemi yapılacak
	when "10000"=>
      alu_out<=alu_out15;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	
	-- selection "10001" seçildiğinde a_right_shift işlemi yapılacak
	when "10001"=>
      alu_out<= alu_out16;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	
	-- selection "10010" seçildiğinde a_left_shift işlemi yapılacak
	when "10010"=>
      alu_out<=  alu_out17;
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	--selection yukarıda tanımlanan değerlerden farklı seçildiğinde çıkışın tüm bitlerini 0 yapacak
	when others=>
      alu_out<=(others=>'0');
		CF_adder<= '0';
		CF_subtractor<= '0';
		alu_remainder_divider<= (others=>'0');
	--case sonlandırıldı
   end case;
	--if sonlandırıldı
	end if;
--process sonlandırıldı
end process;
--değişkenler çıkışlara atandı
alu_out_result<= alu_out;
CF_s<= CF_subtractor;
CF_a<= CF_adder;
alu_remainder<=alu_remainder_divider;

-- architecture sonlandırıldı	
end behavioral;
		
		
		


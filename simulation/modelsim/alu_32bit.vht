LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alu_32bit_vhd_tst IS
END alu_32bit_vhd_tst;
ARCHITECTURE alu_32bit_arch OF alu_32bit_vhd_tst IS
CONSTANT clk_period:TIME:= 100 NS;                                                 
SIGNAL alu_in1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL alu_in2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL alu_out_result : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL alu_remainder : STD_LOGIC_VECTOR(32 DOWNTO 0);
SIGNAL CF_a : STD_LOGIC;
SIGNAL CF_s : STD_LOGIC;
SIGNAL clk : STD_LOGIC ;
SIGNAL reset : STD_LOGIC :='0' ;
SIGNAL selection : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT alu_32bit
	PORT (
	alu_in1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	alu_in2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	alu_out_result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	alu_remainder : OUT STD_LOGIC_VECTOR(32 DOWNTO 0);
	CF_a : OUT STD_LOGIC;
	CF_s : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	selection : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : alu_32bit
	PORT MAP (
-- list connections between master ports and signals
	alu_in1 => alu_in1,
	alu_in2 => alu_in2,
	alu_out_result => alu_out_result,
	alu_remainder => alu_remainder,
	CF_a => CF_a,
	CF_s => CF_s,
	clk => clk,
	reset => reset,
	selection => selection
	);
	
process
begin

clk<='1';
wait for clk_period/2;

clk<='0';
wait for clk_period/2;

end process;

init : PROCESS                                                                                
BEGIN                                                        
   --clk<= not clk after 1900 ns;  
  -- reset<= not reset after 1900 ns;  
   alu_in1<= "11000001000000011000000000101001";
   alu_in2<= "00000000000000000000000000001011";
	
	selection<="00000";
   wait for 100 ns;
	selection<="00001";
	wait for 100 ns;
   selection<="00010";
	wait for 100 ns;
	selection<="00011";
	wait for 100 ns;
   selection<="00100";
	wait for 100 ns;
   selection<="00101";
	wait for 100 ns;
   selection<="00110";
	wait for 100 ns;
	selection<="00111";
	wait for 100 ns;
	selection<="01000";
	wait for 100 ns;
	selection<="01001";
	wait for 100 ns;	
	selection<="01010";
	wait for 100 ns;
	selection<="01011";
	wait for 100 ns;	
	selection<="01100";
	wait for 100 ns;	
	selection<="01101";
	wait for 100 ns;
	selection<="01110";
	wait for 100 ns;	
	selection<="01111";
	wait for 100 ns;
	selection<="10000";
	wait for 100 ns;
	selection<="10001";
	wait for 100 ns;
	selection<="10010";                           
WAIT;                                                       
END PROCESS init; 
                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END alu_32bit_arch;

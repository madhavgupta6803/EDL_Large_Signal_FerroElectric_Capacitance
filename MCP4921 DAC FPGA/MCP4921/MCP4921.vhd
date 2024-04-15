-- MCP3008 --14/10/2020 --Amit Shetye
Library ieee;
Use ieee.std_logic_1164.All;
Use ieee.numeric_std.All;
Use ieee.std_logic_unsigned.All;

	Entity MCP4921 Is
		Port
		(   	clk_50MHz 	: In std_logic;
				reset 		: In std_logic;
	
				Dout 		: Out std_logic;
				CS	 		: Out std_logic;
				Sclk 		: Out std_logic;
				LDAC 		: Out std_logic
				--clk1_KHz	: Out std_logic
				--output	 	: Out std_logic_vector(9 downto 0)
		);				
	End MCP4921;

Architecture behave Of MCP4921 is

	signal CLK_25MHz	: std_logic:='0';
	signal clk_1KHz	: std_logic:='0';
	signal count	: std_logic_vector (7 downto 0):7
	= x"00";
	signal point_count: std_logic_vector (7 downto 0):= x"00";
	signal op_bit	: std_logic_vector (15 downto 0):= x"0000";
	signal bit_count: std_logic_vector (7 downto 0):= x"0F";
	signal counter	: std_logic_vector (7 downto 0):= x"00";
	signal count_1KHz: std_logic_vector (15 downto 0):= x"0000";
	--signal rx_buf	: std_logic_vector (9 downto 0):= b"0000000000";
	
	TYPE SINE IS ARRAY (23 DOWNTO 0) OF STD_LOGIC_VECTOR(11 DOWNTO 0);
	--SIGNAL POINT: SINE :=(x"800",x"BFF",x"EEE",x"FFF",x"EEE",x"BFF",x"800",x"400",x"111",x"000",x"111",x"400");
	
	SIGNAL POINT: SINE :=(X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF", X"FFF");

Begin	
	
	Sclk <= CLK_25MHz;
	
Sclock: process(clk_50MHz)
	begin									 		 
		if (clk_50MHz'event and clk_50MHz = '1') then
			--if(count = x"2f") then
				CLK_25MHz <= not CLK_25MHz;
			--	count <= x"00";
			--else
				--count <= count+'1';	
			--end if;
		end if;	
	end process	;
	
	process(CLK_25MHz)
	begin
		if(CLK_25MHz'event and CLK_25MHz = '0') then
			if(reset = '1')	then
				counter <= x"00";
				Dout 	<= '1';	
				CS	 	<= '1';
				LDAC	<= '1';
				op_bit(15 downto 12)<= x"3";
				bit_count <= x"0F";

			elsif(counter = x"00" ) then
				Dout 	<= '1';
				CS	 	<= '1';	
				LDAC	<= '1';	
				if(count_1KHz = x"0068") then		-- 0068<-10k
					counter <= x"01";
					count_1KHz <=  x"0000";
					point_count <= point_count + '1';
					
					if(point_count>= x"00" and point_count<= x"16") then
						op_bit(11 downto 00)<=  POINT(to_integer (unsigned (point_count)));

					elsif(point_count = x"17") then
						op_bit(11 downto 00)<=  POINT(23);
						point_count <= x"00";
					end if;
					
				else
					count_1KHz <= count_1KHz + '1';		
				end if;
					
					
				
			elsif(counter = x"01" ) then
				if(bit_count<= x"0F" and bit_count>= x"00") then
					Dout	<= op_bit(to_integer(unsigned (bit_count)));
					bit_count <= bit_count - '1';
					CS	 	<= '0';	
					LDAC	<= '1';
					
				elsif(bit_count = x"FF") then
					counter <= x"02";
					bit_count <=x"0F";
					Dout 	<= '1';
					CS	 	<= '1';
					LDAC	<= '1';
				end if;
				
			elsif(counter = x"02" ) then		-- load DAC = 0 
				counter <= x"00";
				Dout 	<= '1';	
				CS	 	<= '1';
				LDAC	<= '0';
				
			end if;	
			
		end if;				
	end process	;				 			 		 -- represent behavior
		
End Architecture behave;					
					
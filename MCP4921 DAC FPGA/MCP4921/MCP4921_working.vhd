-- MCP3008 --14/10/2020 --Amit Shetye
Library ieee;
Use ieee.std_logic_1164.All;
Use ieee.numeric_std.All;
Use ieee.std_logic_unsigned.All;

	Entity MCP4921 Is
		Port
		(   	clk_50MHz 	: In std_logic;
				reset 		: In std_logic;
				Din 		: In std_logic_vector(11 downto 0);
	
				Dout 		: Out std_logic;
				CS	 		: Out std_logic;
				Sclk 		: Out std_logic;
				LDAC 		: Out std_logic;
				clk1_KHz	: Out std_logic
				--output	 	: Out std_logic_vector(9 downto 0)
		);				
	End MCP4921;

Architecture behave Of MCP4921 is

	signal clk_int	: std_logic:='0';
	signal clk_1KHz	: std_logic:='0';
	signal count	: std_logic_vector (7 downto 0):= x"00";
	signal point_count: std_logic_vector (7 downto 0):= x"00";
	signal op_bit	: std_logic_vector (15 downto 0):= x"0000";
	signal bit_count: std_logic_vector (7 downto 0):= x"0F";
	signal counter	: std_logic_vector (7 downto 0):= x"00";
	signal count_1KHz: std_logic_vector (15 downto 0):= x"0000";
	signal rx_buf	: std_logic_vector (9 downto 0):= b"0000000000";
	
	TYPE SINE IS ARRAY (23 DOWNTO 0) OF STD_LOGIC_VECTOR(11 DOWNTO 0);
	--SIGNAL POINT: SINE :=(x"800",x"BFF",x"EEE",x"FFF",x"EEE",x"BFF",x"800",x"400",x"111",x"000",x"111",x"400");
	
	SIGNAL POINT: SINE :=(X"045",x"111",X"257",x"400",X"5ED",x"800",x"A11",x"BFF",X"DA7",x"EEE",X"FB9",x"FFF",X"FB9",x"EEE",X"DA7",x"BFF",x"A11",x"800",X"5ED",X"400",X"257",x"111",X"045",x"000");

Begin	
	
	Sclk <= clk_int;
	clk1_KHz<=clk_1KHz;
	
Sclock: process(clk_50MHz)
	begin									 		 
		if (clk_50MHz'event and clk_50MHz = '1') then
			if(count = x"01") then
				clk_int <= not clk_int;
				count <=  x"00";
			else
				count <= count + '1';	
			end if;
		end if;	
	end process	;	
	
wave_freq:process(clk_50MHz)
	begin									 		 
		if (clk_50MHz'event and clk_50MHz = '1') then
			if(count_1KHz = x"0068") then		-- 0068<-10k
				clk_1KHz <= not clk_1KHz;
				count_1KHz <=  x"0000";
			else
				count_1KHz <= count_1KHz + '1';	
			end if;
		end if;	
	end process	;
	
	process(clk_1KHz)
	begin									 		 
		if (clk_1KHz'event and clk_1KHz = '1') then
				if(point_count>= x"00" and point_count<= x"16") then
					op_bit(11 downto 00)<=  POINT(to_integer (unsigned (point_count)));
					point_count <= point_count + '1';
					
				elsif(point_count = x"17") then
					op_bit(11 downto 00)<=  POINT(01);
					point_count <= x"00";
					
				end if;
		end if;		
	end process;
	
	process(clk_int)
	begin
		if(clk_int'event and clk_int = '0') then
			if(reset = '0')	then
				counter <= x"00";
				Dout 	<= '1';	
				CS	 	<= '1';
				LDAC	<= '1';
				op_bit(15 downto 12)	<= x"3";
				--op_bit(11 downto 00)	<= Din;
				
			elsif(counter = x"00" ) then		--reset
				counter <= counter + '1';
				Dout 	<= '1';	
				CS	 	<= '1';	
				LDAC	<= '1';
				op_bit(15 downto 12)	<= x"3";
				--op_bit(11 downto 00)	<= Din;
				
			elsif(counter = x"01" ) then
				if(bit_count<= x"0F" and bit_count>= x"00") then
					Dout	<= op_bit(to_integer(unsigned (bit_count)));
					bit_count <= bit_count - '1';
					CS	 	<= '0';	
					LDAC	<= '1';
					
				elsif(bit_count = x"FF") then
					counter <= x"02";
					bit_count <=x"0F";
					CS	 	<= '1';
					LDAC	<= '1';
				end if;
				
			elsif(counter = x"02" ) then		-- load DAC = 0 
				counter <= x"03";
				Dout 	<= '1';	
				CS	 	<= '1';
				LDAC	<= '0';
				
			elsif(counter = x"03" ) then		-- load DAC = 0 
				counter <= x"00";
				Dout 	<= '1';	
				CS	 	<= '1';
				LDAC	<= '1';
				
			end if;	
			
		end if;				
	end process	;				 			 		 -- represent behavior
		
End Architecture behave;					
					
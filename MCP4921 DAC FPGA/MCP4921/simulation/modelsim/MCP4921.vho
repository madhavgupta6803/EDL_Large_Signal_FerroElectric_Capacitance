-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "04/02/2024 17:05:05"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MCP4921 IS
    PORT (
	clk_50MHz : IN std_logic;
	reset : IN std_logic;
	Dout : OUT std_logic;
	CS : OUT std_logic;
	Sclk : OUT std_logic;
	LDAC : OUT std_logic
	);
END MCP4921;

-- Design Ports Information
-- Dout	=>  Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CS	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- Sclk	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LDAC	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- reset	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk_50MHz	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF MCP4921 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50MHz : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_Dout : std_logic;
SIGNAL ww_CS : std_logic;
SIGNAL ww_Sclk : std_logic;
SIGNAL ww_LDAC : std_logic;
SIGNAL \CLK_25MHz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Dout~output_o\ : std_logic;
SIGNAL \CS~output_o\ : std_logic;
SIGNAL \Sclk~output_o\ : std_logic;
SIGNAL \LDAC~output_o\ : std_logic;
SIGNAL \clk_50MHz~input_o\ : std_logic;
SIGNAL \CLK_25MHz~0_combout\ : std_logic;
SIGNAL \CLK_25MHz~q\ : std_logic;
SIGNAL \CLK_25MHz~clkctrl_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \bit_count~0_combout\ : std_logic;
SIGNAL \bit_count~7_combout\ : std_logic;
SIGNAL \bit_count~1_combout\ : std_logic;
SIGNAL \bit_count~4_combout\ : std_logic;
SIGNAL \bit_count~2_combout\ : std_logic;
SIGNAL \bit_count~5_combout\ : std_logic;
SIGNAL \bit_count~3_combout\ : std_logic;
SIGNAL \bit_count~6_combout\ : std_logic;
SIGNAL \bit_count~8_combout\ : std_logic;
SIGNAL \Dout~1_combout\ : std_logic;
SIGNAL \Equal4~1_combout\ : std_logic;
SIGNAL \counter~2_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \count_1KHz~1_combout\ : std_logic;
SIGNAL \counter~3_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \count_1KHz~0_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \count_1KHz~2_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \count_1KHz~3_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \Add1~21\ : std_logic;
SIGNAL \Add1~22_combout\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~24_combout\ : std_logic;
SIGNAL \Add1~25\ : std_logic;
SIGNAL \Add1~26_combout\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~28_combout\ : std_logic;
SIGNAL \Add1~29\ : std_logic;
SIGNAL \Add1~30_combout\ : std_logic;
SIGNAL \Equal1~3_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~4_combout\ : std_logic;
SIGNAL \counter~4_combout\ : std_logic;
SIGNAL \counter~5_combout\ : std_logic;
SIGNAL \op_bit[12]~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \op_bit[0]~3_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \point_count~4_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \point_count~5_combout\ : std_logic;
SIGNAL \op_bit[0]~1_combout\ : std_logic;
SIGNAL \op_bit[0]~2_combout\ : std_logic;
SIGNAL \Dout~2_combout\ : std_logic;
SIGNAL \Dout~3_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \Dout~0_combout\ : std_logic;
SIGNAL \Dout~4_combout\ : std_logic;
SIGNAL \Dout~reg0_q\ : std_logic;
SIGNAL \CS~0_combout\ : std_logic;
SIGNAL \CS~1_combout\ : std_logic;
SIGNAL \CS~reg0_q\ : std_logic;
SIGNAL \LDAC~0_combout\ : std_logic;
SIGNAL \LDAC~1_combout\ : std_logic;
SIGNAL \LDAC~reg0_q\ : std_logic;
SIGNAL bit_count : std_logic_vector(7 DOWNTO 0);
SIGNAL counter : std_logic_vector(7 DOWNTO 0);
SIGNAL op_bit : std_logic_vector(15 DOWNTO 0);
SIGNAL count_1KHz : std_logic_vector(15 DOWNTO 0);
SIGNAL point_count : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_CLK_25MHz~clkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_50MHz <= clk_50MHz;
ww_reset <= reset;
Dout <= ww_Dout;
CS <= ww_CS;
Sclk <= ww_Sclk;
LDAC <= ww_LDAC;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK_25MHz~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK_25MHz~q\);
\ALT_INV_CLK_25MHz~clkctrl_outclk\ <= NOT \CLK_25MHz~clkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X1_Y34_N2
\Dout~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dout~reg0_q\,
	devoe => ww_devoe,
	o => \Dout~output_o\);

-- Location: IOOBUF_X1_Y34_N9
\CS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CS~reg0_q\,
	devoe => ww_devoe,
	o => \CS~output_o\);

-- Location: IOOBUF_X11_Y34_N2
\Sclk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CLK_25MHz~q\,
	devoe => ww_devoe,
	o => \Sclk~output_o\);

-- Location: IOOBUF_X7_Y34_N16
\LDAC~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDAC~reg0_q\,
	devoe => ww_devoe,
	o => \LDAC~output_o\);

-- Location: IOIBUF_X27_Y0_N22
\clk_50MHz~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50MHz,
	o => \clk_50MHz~input_o\);

-- Location: LCCOMB_X27_Y1_N18
\CLK_25MHz~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CLK_25MHz~0_combout\ = !\CLK_25MHz~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CLK_25MHz~q\,
	combout => \CLK_25MHz~0_combout\);

-- Location: FF_X27_Y1_N17
CLK_25MHz : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50MHz~input_o\,
	asdata => \CLK_25MHz~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CLK_25MHz~q\);

-- Location: CLKCTRL_G16
\CLK_25MHz~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK_25MHz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK_25MHz~clkctrl_outclk\);

-- Location: IOIBUF_X7_Y34_N1
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X6_Y30_N12
\bit_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~0_combout\ = (!\reset~input_o\ & (((counter(1)) # (!\Equal4~1_combout\)) # (!counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => counter(1),
	datac => \reset~input_o\,
	datad => \Equal4~1_combout\,
	combout => \bit_count~0_combout\);

-- Location: LCCOMB_X6_Y30_N8
\bit_count~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~7_combout\ = (!\reset~input_o\ & (\bit_count~6_combout\ $ (bit_count(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_count~6_combout\,
	datab => \reset~input_o\,
	datac => bit_count(0),
	combout => \bit_count~7_combout\);

-- Location: FF_X6_Y30_N9
\bit_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \bit_count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_count(0));

-- Location: LCCOMB_X6_Y30_N10
\bit_count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~1_combout\ = (counter(0) & (!counter(1) & (bit_count(0) & bit_count(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => counter(1),
	datac => bit_count(0),
	datad => bit_count(1),
	combout => \bit_count~1_combout\);

-- Location: LCCOMB_X6_Y30_N20
\bit_count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~4_combout\ = (\bit_count~0_combout\ & (bit_count(2) $ (((\bit_count~1_combout\ & !bit_count(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_count~1_combout\,
	datab => bit_count(4),
	datac => bit_count(2),
	datad => \bit_count~0_combout\,
	combout => \bit_count~4_combout\);

-- Location: FF_X6_Y30_N21
\bit_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \bit_count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_count(2));

-- Location: LCCOMB_X6_Y30_N28
\bit_count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~2_combout\ = (bit_count(2) & \bit_count~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bit_count(2),
	datad => \bit_count~1_combout\,
	combout => \bit_count~2_combout\);

-- Location: LCCOMB_X6_Y30_N14
\bit_count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~5_combout\ = (\bit_count~0_combout\ & (bit_count(3) $ (((!bit_count(4) & \bit_count~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_count~0_combout\,
	datab => bit_count(4),
	datac => bit_count(3),
	datad => \bit_count~2_combout\,
	combout => \bit_count~5_combout\);

-- Location: FF_X6_Y30_N15
\bit_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \bit_count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_count(3));

-- Location: LCCOMB_X6_Y30_N2
\bit_count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~3_combout\ = (\bit_count~0_combout\ & ((bit_count(4)) # ((bit_count(3) & \bit_count~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_count~0_combout\,
	datab => bit_count(3),
	datac => bit_count(4),
	datad => \bit_count~2_combout\,
	combout => \bit_count~3_combout\);

-- Location: FF_X6_Y30_N3
\bit_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \bit_count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_count(4));

-- Location: LCCOMB_X6_Y30_N30
\bit_count~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~6_combout\ = (counter(0) & (!counter(1) & !bit_count(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => counter(1),
	datad => bit_count(4),
	combout => \bit_count~6_combout\);

-- Location: LCCOMB_X6_Y30_N6
\bit_count~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_count~8_combout\ = (\bit_count~0_combout\ & (bit_count(1) $ (((\bit_count~6_combout\ & bit_count(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bit_count~6_combout\,
	datab => bit_count(0),
	datac => bit_count(1),
	datad => \bit_count~0_combout\,
	combout => \bit_count~8_combout\);

-- Location: FF_X6_Y30_N7
\bit_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \bit_count~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_count(1));

-- Location: LCCOMB_X6_Y30_N22
\Dout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dout~1_combout\ = (!bit_count(3) & !bit_count(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bit_count(3),
	datad => bit_count(2),
	combout => \Dout~1_combout\);

-- Location: LCCOMB_X6_Y30_N18
\Equal4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal4~1_combout\ = (!bit_count(1) & (!bit_count(0) & (\Dout~1_combout\ & bit_count(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_count(1),
	datab => bit_count(0),
	datac => \Dout~1_combout\,
	datad => bit_count(4),
	combout => \Equal4~1_combout\);

-- Location: LCCOMB_X5_Y30_N24
\counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter~2_combout\ = (counter(0) & (!\reset~input_o\ & ((counter(1)) # (\Equal4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => \reset~input_o\,
	datac => counter(1),
	datad => \Equal4~1_combout\,
	combout => \counter~2_combout\);

-- Location: FF_X5_Y30_N25
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: LCCOMB_X3_Y30_N0
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = count_1KHz(0) $ (VCC)
-- \Add1~1\ = CARRY(count_1KHz(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X2_Y30_N6
\count_1KHz~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1KHz~1_combout\ = (\Add1~0_combout\ & !\Equal1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~0_combout\,
	datac => \Equal1~4_combout\,
	combout => \count_1KHz~1_combout\);

-- Location: LCCOMB_X5_Y30_N0
\counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter~3_combout\ = (!counter(0) & (!\reset~input_o\ & !counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datac => \reset~input_o\,
	datad => counter(1),
	combout => \counter~3_combout\);

-- Location: FF_X2_Y30_N7
\count_1KHz[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \count_1KHz~1_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(0));

-- Location: LCCOMB_X3_Y30_N2
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (count_1KHz(1) & (!\Add1~1\)) # (!count_1KHz(1) & ((\Add1~1\) # (GND)))
-- \Add1~3\ = CARRY((!\Add1~1\) # (!count_1KHz(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: FF_X3_Y30_N3
\count_1KHz[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~2_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(1));

-- Location: LCCOMB_X3_Y30_N4
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (count_1KHz(2) & (\Add1~3\ $ (GND))) # (!count_1KHz(2) & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((count_1KHz(2) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: FF_X3_Y30_N5
\count_1KHz[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~4_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(2));

-- Location: LCCOMB_X3_Y30_N6
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (count_1KHz(3) & (!\Add1~5\)) # (!count_1KHz(3) & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!count_1KHz(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X2_Y30_N16
\count_1KHz~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1KHz~0_combout\ = (!\Equal1~4_combout\ & \Add1~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal1~4_combout\,
	datad => \Add1~6_combout\,
	combout => \count_1KHz~0_combout\);

-- Location: FF_X2_Y30_N17
\count_1KHz[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \count_1KHz~0_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(3));

-- Location: LCCOMB_X3_Y30_N8
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (count_1KHz(4) & (\Add1~7\ $ (GND))) # (!count_1KHz(4) & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((count_1KHz(4) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: FF_X3_Y30_N9
\count_1KHz[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~8_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(4));

-- Location: LCCOMB_X3_Y30_N10
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (count_1KHz(5) & (!\Add1~9\)) # (!count_1KHz(5) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!count_1KHz(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X2_Y30_N28
\count_1KHz~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1KHz~2_combout\ = (!\Equal1~4_combout\ & \Add1~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datac => \Add1~10_combout\,
	combout => \count_1KHz~2_combout\);

-- Location: FF_X2_Y30_N29
\count_1KHz[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \count_1KHz~2_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(5));

-- Location: LCCOMB_X3_Y30_N12
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (count_1KHz(6) & (\Add1~11\ $ (GND))) # (!count_1KHz(6) & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((count_1KHz(6) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X2_Y30_N14
\count_1KHz~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_1KHz~3_combout\ = (!\Equal1~4_combout\ & \Add1~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datac => \Add1~12_combout\,
	combout => \count_1KHz~3_combout\);

-- Location: FF_X2_Y30_N15
\count_1KHz[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \count_1KHz~3_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(6));

-- Location: LCCOMB_X3_Y30_N14
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (count_1KHz(7) & (!\Add1~13\)) # (!count_1KHz(7) & ((\Add1~13\) # (GND)))
-- \Add1~15\ = CARRY((!\Add1~13\) # (!count_1KHz(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(7),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: FF_X3_Y30_N15
\count_1KHz[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~14_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(7));

-- Location: LCCOMB_X3_Y30_N16
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (count_1KHz(8) & (\Add1~15\ $ (GND))) # (!count_1KHz(8) & (!\Add1~15\ & VCC))
-- \Add1~17\ = CARRY((count_1KHz(8) & !\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(8),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: FF_X3_Y30_N17
\count_1KHz[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~16_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(8));

-- Location: LCCOMB_X3_Y30_N18
\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (count_1KHz(9) & (!\Add1~17\)) # (!count_1KHz(9) & ((\Add1~17\) # (GND)))
-- \Add1~19\ = CARRY((!\Add1~17\) # (!count_1KHz(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(9),
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: FF_X3_Y30_N19
\count_1KHz[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~18_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(9));

-- Location: LCCOMB_X3_Y30_N20
\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (count_1KHz(10) & (\Add1~19\ $ (GND))) # (!count_1KHz(10) & (!\Add1~19\ & VCC))
-- \Add1~21\ = CARRY((count_1KHz(10) & !\Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(10),
	datad => VCC,
	cin => \Add1~19\,
	combout => \Add1~20_combout\,
	cout => \Add1~21\);

-- Location: FF_X3_Y30_N21
\count_1KHz[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~20_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(10));

-- Location: LCCOMB_X3_Y30_N22
\Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~22_combout\ = (count_1KHz(11) & (!\Add1~21\)) # (!count_1KHz(11) & ((\Add1~21\) # (GND)))
-- \Add1~23\ = CARRY((!\Add1~21\) # (!count_1KHz(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(11),
	datad => VCC,
	cin => \Add1~21\,
	combout => \Add1~22_combout\,
	cout => \Add1~23\);

-- Location: FF_X3_Y30_N23
\count_1KHz[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~22_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(11));

-- Location: LCCOMB_X3_Y30_N24
\Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~24_combout\ = (count_1KHz(12) & (\Add1~23\ $ (GND))) # (!count_1KHz(12) & (!\Add1~23\ & VCC))
-- \Add1~25\ = CARRY((count_1KHz(12) & !\Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(12),
	datad => VCC,
	cin => \Add1~23\,
	combout => \Add1~24_combout\,
	cout => \Add1~25\);

-- Location: FF_X3_Y30_N25
\count_1KHz[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~24_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(12));

-- Location: LCCOMB_X3_Y30_N26
\Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~26_combout\ = (count_1KHz(13) & (!\Add1~25\)) # (!count_1KHz(13) & ((\Add1~25\) # (GND)))
-- \Add1~27\ = CARRY((!\Add1~25\) # (!count_1KHz(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(13),
	datad => VCC,
	cin => \Add1~25\,
	combout => \Add1~26_combout\,
	cout => \Add1~27\);

-- Location: FF_X3_Y30_N27
\count_1KHz[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~26_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(13));

-- Location: LCCOMB_X3_Y30_N28
\Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~28_combout\ = (count_1KHz(14) & (\Add1~27\ $ (GND))) # (!count_1KHz(14) & (!\Add1~27\ & VCC))
-- \Add1~29\ = CARRY((count_1KHz(14) & !\Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count_1KHz(14),
	datad => VCC,
	cin => \Add1~27\,
	combout => \Add1~28_combout\,
	cout => \Add1~29\);

-- Location: FF_X3_Y30_N29
\count_1KHz[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~28_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(14));

-- Location: LCCOMB_X3_Y30_N30
\Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~30_combout\ = count_1KHz(15) $ (\Add1~29\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(15),
	cin => \Add1~29\,
	combout => \Add1~30_combout\);

-- Location: FF_X3_Y30_N31
\count_1KHz[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add1~30_combout\,
	ena => \counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_1KHz(15));

-- Location: LCCOMB_X4_Y30_N26
\Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~3_combout\ = (!count_1KHz(13) & (!count_1KHz(14) & (!count_1KHz(12) & !count_1KHz(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(13),
	datab => count_1KHz(14),
	datac => count_1KHz(12),
	datad => count_1KHz(15),
	combout => \Equal1~3_combout\);

-- Location: LCCOMB_X4_Y30_N4
\Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (!count_1KHz(8) & (!count_1KHz(9) & (!count_1KHz(10) & !count_1KHz(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(8),
	datab => count_1KHz(9),
	datac => count_1KHz(10),
	datad => count_1KHz(11),
	combout => \Equal1~2_combout\);

-- Location: LCCOMB_X4_Y30_N22
\Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!count_1KHz(7) & (!count_1KHz(4) & (count_1KHz(6) & count_1KHz(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(7),
	datab => count_1KHz(4),
	datac => count_1KHz(6),
	datad => count_1KHz(5),
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X4_Y30_N24
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!count_1KHz(1) & (!count_1KHz(2) & (!count_1KHz(0) & count_1KHz(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_1KHz(1),
	datab => count_1KHz(2),
	datac => count_1KHz(0),
	datad => count_1KHz(3),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X4_Y30_N0
\Equal1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~4_combout\ = (\Equal1~3_combout\ & (\Equal1~2_combout\ & (\Equal1~1_combout\ & \Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~3_combout\,
	datab => \Equal1~2_combout\,
	datac => \Equal1~1_combout\,
	datad => \Equal1~0_combout\,
	combout => \Equal1~4_combout\);

-- Location: LCCOMB_X5_Y30_N16
\counter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter~4_combout\ = (counter(0) & (!counter(1) & ((\Equal4~1_combout\)))) # (!counter(0) & ((counter(1)) # ((\Equal1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => counter(1),
	datac => \Equal1~4_combout\,
	datad => \Equal4~1_combout\,
	combout => \counter~4_combout\);

-- Location: LCCOMB_X5_Y30_N12
\counter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter~5_combout\ = (!\reset~input_o\ & ((counter(0) & ((!\counter~4_combout\))) # (!counter(0) & (!counter(1) & \counter~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(1),
	datab => \reset~input_o\,
	datac => counter(0),
	datad => \counter~4_combout\,
	combout => \counter~5_combout\);

-- Location: FF_X5_Y30_N13
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \counter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: LCCOMB_X5_Y30_N20
\op_bit[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \op_bit[12]~0_combout\ = (\reset~input_o\) # (op_bit(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => op_bit(12),
	combout => \op_bit[12]~0_combout\);

-- Location: FF_X5_Y30_N21
\op_bit[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \op_bit[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => op_bit(12));

-- Location: LCCOMB_X4_Y30_N6
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = point_count(0) $ (VCC)
-- \Add0~1\ = CARRY(point_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => point_count(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X4_Y30_N30
\op_bit[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \op_bit[0]~3_combout\ = (!\reset~input_o\ & (!counter(1) & (!counter(0) & \Equal1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => counter(1),
	datac => counter(0),
	datad => \Equal1~4_combout\,
	combout => \op_bit[0]~3_combout\);

-- Location: FF_X4_Y30_N7
\point_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add0~0_combout\,
	ena => \op_bit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => point_count(0));

-- Location: LCCOMB_X4_Y30_N8
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (point_count(1) & (!\Add0~1\)) # (!point_count(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!point_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => point_count(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: FF_X4_Y30_N9
\point_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add0~2_combout\,
	ena => \op_bit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => point_count(1));

-- Location: LCCOMB_X4_Y30_N10
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (point_count(2) & (\Add0~3\ $ (GND))) # (!point_count(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((point_count(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => point_count(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: FF_X4_Y30_N11
\point_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add0~4_combout\,
	ena => \op_bit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => point_count(2));

-- Location: LCCOMB_X4_Y30_N12
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (point_count(3) & (!\Add0~5\)) # (!point_count(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!point_count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => point_count(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X4_Y30_N14
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (point_count(4) & (\Add0~7\ $ (GND))) # (!point_count(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((point_count(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => point_count(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X5_Y30_N28
\Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (point_count(1) & (point_count(4) & (point_count(0) & point_count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => point_count(1),
	datab => point_count(4),
	datac => point_count(0),
	datad => point_count(2),
	combout => \Equal2~1_combout\);

-- Location: LCCOMB_X4_Y30_N2
\point_count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \point_count~4_combout\ = (\Add0~8_combout\ & (((point_count(3)) # (!\Equal2~1_combout\)) # (!\Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => point_count(3),
	datac => \Add0~8_combout\,
	datad => \Equal2~1_combout\,
	combout => \point_count~4_combout\);

-- Location: FF_X4_Y30_N3
\point_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \point_count~4_combout\,
	ena => \op_bit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => point_count(4));

-- Location: LCCOMB_X4_Y30_N16
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (point_count(5) & (!\Add0~9\)) # (!point_count(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!point_count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => point_count(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: FF_X4_Y30_N17
\point_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add0~10_combout\,
	ena => \op_bit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => point_count(5));

-- Location: LCCOMB_X4_Y30_N18
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (point_count(6) & (\Add0~11\ $ (GND))) # (!point_count(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((point_count(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => point_count(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: FF_X4_Y30_N19
\point_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add0~12_combout\,
	ena => \op_bit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => point_count(6));

-- Location: LCCOMB_X4_Y30_N20
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = \Add0~13\ $ (point_count(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => point_count(7),
	cin => \Add0~13\,
	combout => \Add0~14_combout\);

-- Location: FF_X4_Y30_N21
\point_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Add0~14_combout\,
	ena => \op_bit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => point_count(7));

-- Location: LCCOMB_X5_Y30_N30
\Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!point_count(6) & (!point_count(5) & !point_count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => point_count(6),
	datac => point_count(5),
	datad => point_count(7),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X4_Y30_N28
\point_count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \point_count~5_combout\ = (\Add0~6_combout\ & (((point_count(3)) # (!\Equal2~1_combout\)) # (!\Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \Equal2~1_combout\,
	datac => point_count(3),
	datad => \Add0~6_combout\,
	combout => \point_count~5_combout\);

-- Location: FF_X4_Y30_N29
\point_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \point_count~5_combout\,
	ena => \op_bit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => point_count(3));

-- Location: LCCOMB_X5_Y30_N18
\op_bit[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \op_bit[0]~1_combout\ = (\Equal2~0_combout\ & (((!point_count(4) & !\Equal2~1_combout\)) # (!point_count(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => point_count(3),
	datab => point_count(4),
	datac => \Equal2~0_combout\,
	datad => \Equal2~1_combout\,
	combout => \op_bit[0]~1_combout\);

-- Location: LCCOMB_X5_Y30_N14
\op_bit[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \op_bit[0]~2_combout\ = (op_bit(0)) # ((\Equal1~4_combout\ & (\counter~3_combout\ & \op_bit[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datab => \counter~3_combout\,
	datac => op_bit(0),
	datad => \op_bit[0]~1_combout\,
	combout => \op_bit[0]~2_combout\);

-- Location: FF_X5_Y30_N15
\op_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \op_bit[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => op_bit(0));

-- Location: LCCOMB_X5_Y30_N8
\Dout~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dout~2_combout\ = (\Dout~1_combout\ & (bit_count(1) & (op_bit(12)))) # (!\Dout~1_combout\ & (((op_bit(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_count(1),
	datab => op_bit(12),
	datac => op_bit(0),
	datad => \Dout~1_combout\,
	combout => \Dout~2_combout\);

-- Location: LCCOMB_X5_Y30_N26
\Dout~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dout~3_combout\ = (!counter(1) & (\Dout~2_combout\ & !bit_count(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(1),
	datac => \Dout~2_combout\,
	datad => bit_count(4),
	combout => \Dout~3_combout\);

-- Location: LCCOMB_X6_Y30_N4
\Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (!bit_count(1) & (!bit_count(3) & (!bit_count(0) & !bit_count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_count(1),
	datab => bit_count(3),
	datac => bit_count(0),
	datad => bit_count(2),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X5_Y30_N2
\Dout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dout~0_combout\ = (counter(1) & (((\Dout~reg0_q\)))) # (!counter(1) & (bit_count(4) & ((\Equal4~0_combout\) # (\Dout~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~0_combout\,
	datab => counter(1),
	datac => \Dout~reg0_q\,
	datad => bit_count(4),
	combout => \Dout~0_combout\);

-- Location: LCCOMB_X5_Y30_N4
\Dout~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dout~4_combout\ = ((\reset~input_o\) # ((\Dout~3_combout\) # (\Dout~0_combout\))) # (!counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => \reset~input_o\,
	datac => \Dout~3_combout\,
	datad => \Dout~0_combout\,
	combout => \Dout~4_combout\);

-- Location: FF_X5_Y30_N5
\Dout~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \Dout~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Dout~reg0_q\);

-- Location: LCCOMB_X5_Y30_N22
\CS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CS~0_combout\ = (counter(1) & (((\CS~reg0_q\)))) # (!counter(1) & (bit_count(4) & ((\CS~reg0_q\) # (\Equal4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bit_count(4),
	datab => counter(1),
	datac => \CS~reg0_q\,
	datad => \Equal4~0_combout\,
	combout => \CS~0_combout\);

-- Location: LCCOMB_X5_Y30_N6
\CS~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CS~1_combout\ = (\CS~0_combout\) # ((\reset~input_o\) # (!counter(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CS~0_combout\,
	datac => \reset~input_o\,
	datad => counter(0),
	combout => \CS~1_combout\);

-- Location: FF_X5_Y30_N7
\CS~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \CS~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CS~reg0_q\);

-- Location: LCCOMB_X6_Y30_N16
\LDAC~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDAC~0_combout\ = (!counter(1) & (((\Equal4~0_combout\) # (!bit_count(4))) # (!counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => counter(1),
	datac => \Equal4~0_combout\,
	datad => bit_count(4),
	combout => \LDAC~0_combout\);

-- Location: LCCOMB_X6_Y30_N24
\LDAC~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LDAC~1_combout\ = (\reset~input_o\) # ((\LDAC~0_combout\) # ((counter(0) & \LDAC~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => \reset~input_o\,
	datac => \LDAC~reg0_q\,
	datad => \LDAC~0_combout\,
	combout => \LDAC~1_combout\);

-- Location: FF_X6_Y30_N25
\LDAC~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_25MHz~clkctrl_outclk\,
	d => \LDAC~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LDAC~reg0_q\);

ww_Dout <= \Dout~output_o\;

ww_CS <= \CS~output_o\;

ww_Sclk <= \Sclk~output_o\;

ww_LDAC <= \LDAC~output_o\;
END structure;



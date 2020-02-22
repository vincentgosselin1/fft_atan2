-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
-- CREATED		"Sat Feb 15 17:22:21 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY fft_atan2_v1 IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		valid :  IN  STD_LOGIC;
		sop :  IN  STD_LOGIC;
		eop :  IN  STD_LOGIC;
		real :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		rad :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		source_imag :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		source_real :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END fft_atan2_v1;

ARCHITECTURE bdf_type OF fft_atan2_v1 IS 

COMPONENT fft_burst_16x1024_v1
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 sink_valid : IN STD_LOGIC;
		 sink_sop : IN STD_LOGIC;
		 sink_eop : IN STD_LOGIC;
		 inverse : IN STD_LOGIC;
		 source_ready : IN STD_LOGIC;
		 sink_error : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 sink_imag : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 sink_real : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 sink_ready : OUT STD_LOGIC;
		 source_valid : OUT STD_LOGIC;
		 source_sop : OUT STD_LOGIC;
		 source_eop : OUT STD_LOGIC;
		 source_error : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 source_exp : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 source_imag : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 source_real : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT cordic_atan2_v1
	PORT(areset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 x : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	RESETn :  STD_LOGIC;
SIGNAL	source_imag_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	source_real_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(0 TO 1);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(0 TO 15);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_0 <= '0';
SYNTHESIZED_WIRE_1 <= '1';
SYNTHESIZED_WIRE_2 <= "00";
SYNTHESIZED_WIRE_3 <= "0000000000000000";



b2v_inst : fft_burst_16x1024_v1
PORT MAP(clk => CLK,
		 reset_n => RESETn,
		 sink_valid => valid,
		 sink_sop => sop,
		 sink_eop => eop,
		 inverse => SYNTHESIZED_WIRE_0,
		 source_ready => SYNTHESIZED_WIRE_1,
		 sink_error => SYNTHESIZED_WIRE_2,
		 sink_imag => SYNTHESIZED_WIRE_3,
		 sink_real => real,
		 source_valid => SYNTHESIZED_WIRE_4,
		 source_imag => source_imag_ALTERA_SYNTHESIZED,
		 source_real => source_real_ALTERA_SYNTHESIZED);


b2v_inst2 : cordic_atan2_v1
PORT MAP(areset => RESET,
		 clk => CLK,
		 en => SYNTHESIZED_WIRE_4,
		 x => source_real_ALTERA_SYNTHESIZED,
		 y => source_imag_ALTERA_SYNTHESIZED,
		 q => rad);



RESETn <= NOT(RESET);





source_imag <= source_imag_ALTERA_SYNTHESIZED;
source_real <= source_real_ALTERA_SYNTHESIZED;

END bdf_type;
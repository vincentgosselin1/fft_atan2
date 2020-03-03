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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/03/2020 15:36:10"
                                                            
-- Vhdl Test Bench template for design  :  fft_atan2_v1
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY fft_atan2_v1_vhd_tst IS
END fft_atan2_v1_vhd_tst;
ARCHITECTURE fft_atan2_v1_arch OF fft_atan2_v1_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL b : STD_LOGIC;
SIGNAL c : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL eop : STD_LOGIC;
SIGNAL mag : STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL mag2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL rad : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RESET : STD_LOGIC;
SIGNAL sink_ready : STD_LOGIC;
SIGNAL sop : STD_LOGIC;
SIGNAL source_imag : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL source_real : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL source_valid : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL TRIGGER : STD_LOGIC;
SIGNAL valid : STD_LOGIC;
COMPONENT fft_atan2_v1
	PORT (
	a : IN STD_LOGIC;
	b : IN STD_LOGIC;
	c : OUT STD_LOGIC;
	CLK : IN STD_LOGIC;
	eop : IN STD_LOGIC;
	mag : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
	mag2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	rad : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	RESET : IN STD_LOGIC;
	sink_ready : OUT STD_LOGIC;
	sop : IN STD_LOGIC;
	source_imag : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	source_real : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	source_valid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	TRIGGER : IN STD_LOGIC;
	valid : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : fft_atan2_v1
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	c => c,
	CLK => CLK,
	eop => eop,
	mag => mag,
	mag2 => mag2,
	rad => rad,
	RESET => RESET,
	sink_ready => sink_ready,
	sop => sop,
	source_imag => source_imag,
	source_real => source_real,
	source_valid => source_valid,
	TRIGGER => TRIGGER,
	valid => valid
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;

clock_running : PROCESS

	--constant init.
	constant clock_period : time := 5 ns;

--	--clock running
	BEGIN
	CLK <='1';
	wait for clock_period/2;
	CLK <='0';
	wait for clock_period/2;

END PROCESS clock_running;

                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list
		--Start of testbench main process.
	a <= '0';
	b <= '1';
	trigger <= '0';
	sop <= '0';
	eop <= '0'; 
	valid <= '0';

	RESET <= '1';
	--Load the vector IN 
	wait for 20 ns;

	trigger <= '1';

	a <= '1';

	--valid <= '1'; 
	--wait for 5 ns;

	--writing into fft starts.
	RESET <= '0';

	wait for 20 ns;
	sop <= '1';
	eop <= '0'; 
	valid <= '1';

	wait for 5 ns;
	sop <= '0';

	wait for 5110 ns;
	eop <= '1'; 
	wait for 5 ns;
	eop <= '0'; 
	--valid <= '0';

	
	
	
	
WAIT;                                                        
END PROCESS always;                                          
END fft_atan2_v1_arch;

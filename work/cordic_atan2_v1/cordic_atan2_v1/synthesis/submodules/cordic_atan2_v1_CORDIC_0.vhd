-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.1 (Release Build #590)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from cordic_atan2_v1_CORDIC_0
-- VHDL created on Sun Feb 16 18:11:48 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity cordic_atan2_v1_CORDIC_0 is
    port (
        x : in std_logic_vector(15 downto 0);  -- sfix16_en15
        y : in std_logic_vector(15 downto 0);  -- sfix16_en15
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(15 downto 0);  -- sfix16_en13
        clk : in std_logic;
        areset : in std_logic
    );
end cordic_atan2_v1_CORDIC_0;

architecture normal of cordic_atan2_v1_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_atan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal signX_uid7_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid8_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid9_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absXE_uid10_atan2Test_a : STD_LOGIC_VECTOR (17 downto 0);
    signal absXE_uid10_atan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal absXE_uid10_atan2Test_o : STD_LOGIC_VECTOR (17 downto 0);
    signal absXE_uid10_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absXE_uid10_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal invSignY_uid11_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absYE_uid12_atan2Test_a : STD_LOGIC_VECTOR (17 downto 0);
    signal absYE_uid12_atan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal absYE_uid12_atan2Test_o : STD_LOGIC_VECTOR (17 downto 0);
    signal absYE_uid12_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absYE_uid12_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal absX_uid13_atan2Test_in : STD_LOGIC_VECTOR (15 downto 0);
    signal absX_uid13_atan2Test_b : STD_LOGIC_VECTOR (15 downto 0);
    signal absY_uid14_atan2Test_in : STD_LOGIC_VECTOR (15 downto 0);
    signal absY_uid14_atan2Test_b : STD_LOGIC_VECTOR (15 downto 0);
    signal yNotZero_uid15_atan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotZero_uid15_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yZero_uid16_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid17_atan2Test_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid17_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xZero_uid18_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_0_uid22_atan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_1_uid23_atan2Test_a : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_1_uid23_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_1_uid23_atan2Test_o : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_1_uid23_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid24_atan2Test_a : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid24_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid24_atan2Test_o : STD_LOGIC_VECTOR (16 downto 0);
    signal yip1E_1_uid24_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeB_uid25_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal lowRangeB_uid25_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal highBBits_uid26_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1_uid28_atan2Test_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_uid31_atan2Test_in : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_uid31_atan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xMSB_uid32_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_1_uid36_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal invSignOfSelectionSignal_uid37_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2NA_uid39_atan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2sumAHighB_uid40_atan2Test_a : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_2sumAHighB_uid40_atan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_2sumAHighB_uid40_atan2Test_o : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_2sumAHighB_uid40_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2sumAHighB_uid40_atan2Test_q : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2NA_uid42_atan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1E_2sumAHighB_uid43_atan2Test_a : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid43_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid43_atan2Test_o : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_2sumAHighB_uid43_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2sumAHighB_uid43_atan2Test_q : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_2CostZeroPaddingA_uid45_atan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_2NA_uid46_atan2Test_q : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_2sumAHighB_uid47_atan2Test_a : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_2sumAHighB_uid47_atan2Test_b : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_2sumAHighB_uid47_atan2Test_o : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_2sumAHighB_uid47_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2sumAHighB_uid47_atan2Test_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_2_uid48_atan2Test_in : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_2_uid48_atan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_2_uid49_atan2Test_in : STD_LOGIC_VECTOR (17 downto 0);
    signal yip1_2_uid49_atan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid50_atan2Test_in : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid50_atan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xMSB_uid51_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_2_uid55_atan2Test_q : STD_LOGIC_VECTOR (27 downto 0);
    signal invSignOfSelectionSignal_uid56_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3NA_uid58_atan2Test_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_3sumAHighB_uid59_atan2Test_a : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_3sumAHighB_uid59_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_3sumAHighB_uid59_atan2Test_o : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_3sumAHighB_uid59_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3sumAHighB_uid59_atan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3NA_uid61_atan2Test_q : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_3sumAHighB_uid62_atan2Test_a : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid62_atan2Test_b : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid62_atan2Test_o : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_3sumAHighB_uid62_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3sumAHighB_uid62_atan2Test_q : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_3NA_uid65_atan2Test_q : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_3sumAHighB_uid66_atan2Test_a : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_3sumAHighB_uid66_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_3sumAHighB_uid66_atan2Test_o : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_3sumAHighB_uid66_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3sumAHighB_uid66_atan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_3_uid67_atan2Test_in : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_3_uid67_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_3_uid68_atan2Test_in : STD_LOGIC_VECTOR (18 downto 0);
    signal yip1_3_uid68_atan2Test_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid69_atan2Test_in : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_uid69_atan2Test_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xMSB_uid70_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_3_uid74_atan2Test_q : STD_LOGIC_VECTOR (28 downto 0);
    signal invSignOfSelectionSignal_uid75_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4CostZeroPaddingA_uid76_atan2Test_q : STD_LOGIC_VECTOR (2 downto 0);
    signal xip1E_4NA_uid77_atan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_4sumAHighB_uid78_atan2Test_a : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_4sumAHighB_uid78_atan2Test_b : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_4sumAHighB_uid78_atan2Test_o : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_4sumAHighB_uid78_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4sumAHighB_uid78_atan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4NA_uid80_atan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1E_4sumAHighB_uid81_atan2Test_a : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4sumAHighB_uid81_atan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4sumAHighB_uid81_atan2Test_o : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4sumAHighB_uid81_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4sumAHighB_uid81_atan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_4NA_uid84_atan2Test_q : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_4sumAHighB_uid85_atan2Test_a : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_4sumAHighB_uid85_atan2Test_b : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_4sumAHighB_uid85_atan2Test_o : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_4sumAHighB_uid85_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4sumAHighB_uid85_atan2Test_q : STD_LOGIC_VECTOR (33 downto 0);
    signal xip1_4_uid86_atan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_4_uid86_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_4_uid87_atan2Test_in : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1_4_uid87_atan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_uid88_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid88_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xMSB_uid89_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_4_uid93_atan2Test_q : STD_LOGIC_VECTOR (29 downto 0);
    signal invSignOfSelectionSignal_uid94_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5CostZeroPaddingA_uid95_atan2Test_q : STD_LOGIC_VECTOR (3 downto 0);
    signal xip1E_5NA_uid96_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_5sumAHighB_uid97_atan2Test_a : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_5sumAHighB_uid97_atan2Test_b : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_5sumAHighB_uid97_atan2Test_o : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_5sumAHighB_uid97_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5sumAHighB_uid97_atan2Test_q : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_5NA_uid99_atan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5sumAHighB_uid100_atan2Test_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_5sumAHighB_uid100_atan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_5sumAHighB_uid100_atan2Test_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_5sumAHighB_uid100_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5sumAHighB_uid100_atan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_5NA_uid103_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_5sumAHighB_uid104_atan2Test_a : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_5sumAHighB_uid104_atan2Test_b : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_5sumAHighB_uid104_atan2Test_o : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_5sumAHighB_uid104_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5sumAHighB_uid104_atan2Test_q : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1_5_uid105_atan2Test_in : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1_5_uid105_atan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1_5_uid106_atan2Test_in : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1_5_uid106_atan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_uid107_atan2Test_in : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_uid107_atan2Test_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xMSB_uid108_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_5_uid112_atan2Test_q : STD_LOGIC_VECTOR (30 downto 0);
    signal invSignOfSelectionSignal_uid113_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6CostZeroPaddingA_uid114_atan2Test_q : STD_LOGIC_VECTOR (4 downto 0);
    signal xip1E_6NA_uid115_atan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1E_6sumAHighB_uid116_atan2Test_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6sumAHighB_uid116_atan2Test_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6sumAHighB_uid116_atan2Test_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6sumAHighB_uid116_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6sumAHighB_uid116_atan2Test_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_6NA_uid118_atan2Test_q : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_6sumAHighB_uid119_atan2Test_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid119_atan2Test_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid119_atan2Test_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_6sumAHighB_uid119_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6sumAHighB_uid119_atan2Test_q : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_6NA_uid122_atan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_6sumAHighB_uid123_atan2Test_a : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_6sumAHighB_uid123_atan2Test_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_6sumAHighB_uid123_atan2Test_o : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_6sumAHighB_uid123_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6sumAHighB_uid123_atan2Test_q : STD_LOGIC_VECTOR (37 downto 0);
    signal xip1_6_uid124_atan2Test_in : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_6_uid124_atan2Test_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yip1_6_uid125_atan2Test_in : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_6_uid125_atan2Test_b : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_uid126_atan2Test_in : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_uid126_atan2Test_b : STD_LOGIC_VECTOR (36 downto 0);
    signal xMSB_uid127_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid131_atan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal twoToMiSiYip_uid132_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal cstArcTan2Mi_6_uid133_atan2Test_q : STD_LOGIC_VECTOR (31 downto 0);
    signal invSignOfSelectionSignal_uid134_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7NA_uid136_atan2Test_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1E_7sumAHighB_uid137_atan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_7sumAHighB_uid137_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_7sumAHighB_uid137_atan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_7sumAHighB_uid137_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7sumAHighB_uid137_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_7NA_uid139_atan2Test_q : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_7sumAHighB_uid140_atan2Test_a : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7sumAHighB_uid140_atan2Test_b : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7sumAHighB_uid140_atan2Test_o : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_7sumAHighB_uid140_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7sumAHighB_uid140_atan2Test_q : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_7NA_uid143_atan2Test_q : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_7sumAHighB_uid144_atan2Test_a : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_7sumAHighB_uid144_atan2Test_b : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_7sumAHighB_uid144_atan2Test_o : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_7sumAHighB_uid144_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7sumAHighB_uid144_atan2Test_q : STD_LOGIC_VECTOR (39 downto 0);
    signal xip1_7_uid145_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_7_uid145_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_7_uid146_atan2Test_in : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1_7_uid146_atan2Test_b : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_uid147_atan2Test_in : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid147_atan2Test_b : STD_LOGIC_VECTOR (38 downto 0);
    signal xMSB_uid148_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid152_atan2Test_b : STD_LOGIC_VECTOR (25 downto 0);
    signal twoToMiSiYip_uid153_atan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cstArcTan2Mi_7_uid154_atan2Test_q : STD_LOGIC_VECTOR (32 downto 0);
    signal invSignOfSelectionSignal_uid155_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_atan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_8_uid156_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_8_uid156_atan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_8_uid156_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_8_uid157_atan2Test_a : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_8_uid157_atan2Test_b : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_8_uid157_atan2Test_o : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_8_uid157_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid157_atan2Test_q : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_8NA_uid160_atan2Test_q : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_8sumAHighB_uid161_atan2Test_a : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_8sumAHighB_uid161_atan2Test_b : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_8sumAHighB_uid161_atan2Test_o : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_8sumAHighB_uid161_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8sumAHighB_uid161_atan2Test_q : STD_LOGIC_VECTOR (41 downto 0);
    signal xip1_8_uid162_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_8_uid162_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_8_uid163_atan2Test_in : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1_8_uid163_atan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_uid164_atan2Test_in : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_uid164_atan2Test_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xMSB_uid165_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid169_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiYip_uid170_atan2Test_b : STD_LOGIC_VECTOR (18 downto 0);
    signal cstArcTan2Mi_8_uid171_atan2Test_q : STD_LOGIC_VECTOR (33 downto 0);
    signal invSignOfSelectionSignal_uid172_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid173_atan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_9_uid173_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_9_uid173_atan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_9_uid173_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid173_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_9_uid174_atan2Test_a : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_9_uid174_atan2Test_b : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_9_uid174_atan2Test_o : STD_LOGIC_VECTOR (28 downto 0);
    signal yip1E_9_uid174_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid174_atan2Test_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_9NA_uid177_atan2Test_q : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_9sumAHighB_uid178_atan2Test_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_9sumAHighB_uid178_atan2Test_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_9sumAHighB_uid178_atan2Test_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_9sumAHighB_uid178_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9sumAHighB_uid178_atan2Test_q : STD_LOGIC_VECTOR (43 downto 0);
    signal xip1_9_uid179_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_9_uid179_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_9_uid180_atan2Test_in : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1_9_uid180_atan2Test_b : STD_LOGIC_VECTOR (25 downto 0);
    signal xMSB_uid182_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid186_atan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal twoToMiSiYip_uid187_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal cstArcTan2Mi_9_uid188_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal invSignOfSelectionSignal_uid189_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid190_atan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_10_uid190_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_10_uid190_atan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_10_uid190_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid190_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_10_uid191_atan2Test_a : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1E_10_uid191_atan2Test_b : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1E_10_uid191_atan2Test_o : STD_LOGIC_VECTOR (27 downto 0);
    signal yip1E_10_uid191_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid191_atan2Test_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1_10_uid196_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_10_uid196_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_10_uid197_atan2Test_in : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1_10_uid197_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xMSB_uid199_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid203_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal twoToMiSiYip_uid204_atan2Test_b : STD_LOGIC_VECTOR (14 downto 0);
    signal cstArcTan2Mi_10_uid205_atan2Test_q : STD_LOGIC_VECTOR (35 downto 0);
    signal invSignOfSelectionSignal_uid206_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid207_atan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_11_uid207_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_11_uid207_atan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_11_uid207_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid207_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_11_uid208_atan2Test_a : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid208_atan2Test_b : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid208_atan2Test_o : STD_LOGIC_VECTOR (26 downto 0);
    signal yip1E_11_uid208_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid208_atan2Test_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_11_uid213_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_11_uid213_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_11_uid214_atan2Test_in : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1_11_uid214_atan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal xMSB_uid216_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid220_atan2Test_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid221_atan2Test_b : STD_LOGIC_VECTOR (12 downto 0);
    signal cstArcTan2Mi_11_uid222_atan2Test_q : STD_LOGIC_VECTOR (36 downto 0);
    signal invSignOfSelectionSignal_uid223_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid224_atan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_12_uid224_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_12_uid224_atan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_12_uid224_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid224_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_12_uid225_atan2Test_a : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_12_uid225_atan2Test_b : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_12_uid225_atan2Test_o : STD_LOGIC_VECTOR (25 downto 0);
    signal yip1E_12_uid225_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid225_atan2Test_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_12_uid230_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_12_uid230_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_12_uid231_atan2Test_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_12_uid231_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid233_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid237_atan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid238_atan2Test_b : STD_LOGIC_VECTOR (10 downto 0);
    signal cstArcTan2Mi_12_uid239_atan2Test_q : STD_LOGIC_VECTOR (37 downto 0);
    signal invSignOfSelectionSignal_uid240_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid241_atan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_13_uid241_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_13_uid241_atan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_13_uid241_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid241_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_13_uid242_atan2Test_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_13_uid242_atan2Test_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_13_uid242_atan2Test_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_13_uid242_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_13_uid242_atan2Test_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_13_uid247_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_13_uid247_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_13_uid248_atan2Test_in : STD_LOGIC_VECTOR (21 downto 0);
    signal yip1_13_uid248_atan2Test_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xMSB_uid250_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid254_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid255_atan2Test_b : STD_LOGIC_VECTOR (8 downto 0);
    signal cstArcTan2Mi_13_uid256_atan2Test_q : STD_LOGIC_VECTOR (38 downto 0);
    signal invSignOfSelectionSignal_uid257_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid258_atan2Test_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_14_uid258_atan2Test_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_14_uid258_atan2Test_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_14_uid258_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid258_atan2Test_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_14_uid259_atan2Test_a : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_14_uid259_atan2Test_b : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_14_uid259_atan2Test_o : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_14_uid259_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_14_uid259_atan2Test_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_14_uid264_atan2Test_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_14_uid264_atan2Test_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_14_uid265_atan2Test_in : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1_14_uid265_atan2Test_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid267_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid271_atan2Test_b : STD_LOGIC_VECTOR (18 downto 0);
    signal cstArcTan2Mi_14_uid273_atan2Test_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_15_uid276_atan2Test_a : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_15_uid276_atan2Test_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_15_uid276_atan2Test_o : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_15_uid276_atan2Test_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_15_uid276_atan2Test_q : STD_LOGIC_VECTOR (21 downto 0);
    signal invSignOfSelectionSignal_uid277_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_15_uid282_atan2Test_in : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1_15_uid282_atan2Test_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid284_atan2Test_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstArcTan2Mi_15_uid290_atan2Test_q : STD_LOGIC_VECTOR (40 downto 0);
    signal invSignOfSelectionSignal_uid294_atan2Test_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_uid300_atan2Test_in : STD_LOGIC_VECTOR (56 downto 0);
    signal aip1E_uid300_atan2Test_b : STD_LOGIC_VECTOR (56 downto 0);
    signal alphaPreRnd_uid301_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal alphaPostRndhigh_uid307_atan2Test_a : STD_LOGIC_VECTOR (16 downto 0);
    signal alphaPostRndhigh_uid307_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal alphaPostRndhigh_uid307_atan2Test_o : STD_LOGIC_VECTOR (16 downto 0);
    signal alphaPostRndhigh_uid307_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal alphaPostRnd_uid308_atan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal atanRes_uid309_atan2Test_in : STD_LOGIC_VECTOR (16 downto 0);
    signal atanRes_uid309_atan2Test_b : STD_LOGIC_VECTOR (16 downto 0);
    signal cstZeroOutFormat_uid310_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal constPiP2uE_uid311_atan2Test_q : STD_LOGIC_VECTOR (15 downto 0);
    signal constPio2P2u_mergedSignalTM_uid314_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal concXZeroYZero_uid316_atan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal atanResPostExc_uid317_atan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal atanResPostExc_uid317_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal concSigns_uid318_atan2Test_q : STD_LOGIC_VECTOR (1 downto 0);
    signal constPiP2u_uid319_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal constPi_uid320_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal constantZeroOutFormat_uid321_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal constantZeroOutFormatP2u_uid322_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal firstOperand_uid324_atan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal firstOperand_uid324_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal secondOperand_uid325_atan2Test_s : STD_LOGIC_VECTOR (1 downto 0);
    signal secondOperand_uid325_atan2Test_q : STD_LOGIC_VECTOR (16 downto 0);
    signal outResExtended_uid326_atan2Test_a : STD_LOGIC_VECTOR (17 downto 0);
    signal outResExtended_uid326_atan2Test_b : STD_LOGIC_VECTOR (17 downto 0);
    signal outResExtended_uid326_atan2Test_o : STD_LOGIC_VECTOR (17 downto 0);
    signal outResExtended_uid326_atan2Test_q : STD_LOGIC_VECTOR (17 downto 0);
    signal atanResPostRR_uid327_atan2Test_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_a : STD_LOGIC_VECTOR (3 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_b : STD_LOGIC_VECTOR (3 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_o : STD_LOGIC_VECTOR (3 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_a : STD_LOGIC_VECTOR (7 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_b : STD_LOGIC_VECTOR (7 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_o : STD_LOGIC_VECTOR (7 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_a : STD_LOGIC_VECTOR (9 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_b : STD_LOGIC_VECTOR (9 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_o : STD_LOGIC_VECTOR (9 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_a : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_b : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_o : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_a : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_o : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_a : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_o : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitJoin_for_q_q : STD_LOGIC_VECTOR (57 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel0_1_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (2 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel1_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (4 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel1_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (7 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (7 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (6 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel1_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (9 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (9 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (8 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel1_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel1_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeA_uid305_atan2Test_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid305_atan2Test_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_1_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_q_1_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist9_atanRes_uid309_atan2Test_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist10_invSignOfSelectionSignal_uid294_atan2Test_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_xMSB_uid284_atan2Test_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_invSignOfSelectionSignal_uid277_atan2Test_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_twoToMiSiXip_uid271_atan2Test_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist14_yip1_14_uid265_atan2Test_b_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal redist15_invSignOfSelectionSignal_uid257_atan2Test_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_yip1_13_uid248_atan2Test_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist17_xip1_13_uid247_atan2Test_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist18_invSignOfSelectionSignal_uid240_atan2Test_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_yip1_12_uid231_atan2Test_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist20_xip1_12_uid230_atan2Test_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist21_invSignOfSelectionSignal_uid223_atan2Test_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_yip1_11_uid214_atan2Test_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist23_xip1_11_uid213_atan2Test_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist24_invSignOfSelectionSignal_uid206_atan2Test_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_yip1_10_uid197_atan2Test_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist26_xip1_10_uid196_atan2Test_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist27_invSignOfSelectionSignal_uid189_atan2Test_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_yip1_9_uid180_atan2Test_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist29_xip1_9_uid179_atan2Test_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist30_aip1E_uid164_atan2Test_b_1_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist31_yip1_8_uid163_atan2Test_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist32_xip1_8_uid162_atan2Test_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist33_aip1E_uid147_atan2Test_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist34_yip1_7_uid146_atan2Test_b_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist35_xip1_7_uid145_atan2Test_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist36_aip1E_uid126_atan2Test_b_1_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist37_yip1_6_uid125_atan2Test_b_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist38_xip1_6_uid124_atan2Test_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist39_aip1E_uid107_atan2Test_b_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal redist40_yip1_5_uid106_atan2Test_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist41_xip1_5_uid105_atan2Test_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist42_aip1E_uid88_atan2Test_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist43_yip1_4_uid87_atan2Test_b_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal redist44_xip1_4_uid86_atan2Test_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist45_aip1E_uid69_atan2Test_b_1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal redist46_yip1_3_uid68_atan2Test_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist47_xip1_3_uid67_atan2Test_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist48_aip1E_uid50_atan2Test_b_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist49_yip1_2_uid49_atan2Test_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist50_xip1_2_uid48_atan2Test_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist51_xNotZero_uid17_atan2Test_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_yNotZero_uid15_atan2Test_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_absY_uid14_atan2Test_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist54_absX_uid13_atan2Test_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist55_signY_uid8_atan2Test_b_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_signX_uid7_atan2Test_b_19_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- constPi_uid320_atan2Test(CONSTANT,319)
    constPi_uid320_atan2Test_q <= "11001001000100000";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- constPiP2uE_uid311_atan2Test(CONSTANT,310)
    constPiP2uE_uid311_atan2Test_q <= "1100100100010010";

    -- constPio2P2u_mergedSignalTM_uid314_atan2Test(BITJOIN,313)@19
    constPio2P2u_mergedSignalTM_uid314_atan2Test_q <= GND_q & constPiP2uE_uid311_atan2Test_q;

    -- cstZeroOutFormat_uid310_atan2Test(CONSTANT,309)
    cstZeroOutFormat_uid310_atan2Test_q <= "00000000000000010";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- alphaPostRndhigh_uid307_atan2Test(ADD,306)@18
    alphaPostRndhigh_uid307_atan2Test_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid305_atan2Test_merged_bit_select_c);
    alphaPostRndhigh_uid307_atan2Test_b <= STD_LOGIC_VECTOR("0000000000000000" & VCC_q);
    alphaPostRndhigh_uid307_atan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(alphaPostRndhigh_uid307_atan2Test_a) + UNSIGNED(alphaPostRndhigh_uid307_atan2Test_b));
    alphaPostRndhigh_uid307_atan2Test_q <= alphaPostRndhigh_uid307_atan2Test_o(16 downto 0);

    -- xMSB_uid267_atan2Test(BITSELECT,266)@15
    xMSB_uid267_atan2Test_b <= STD_LOGIC_VECTOR(redist14_yip1_14_uid265_atan2Test_b_1_q(20 downto 20));

    -- xMSB_uid233_atan2Test(BITSELECT,232)@13
    xMSB_uid233_atan2Test_b <= STD_LOGIC_VECTOR(redist19_yip1_12_uid231_atan2Test_b_1_q(22 downto 22));

    -- xMSB_uid199_atan2Test(BITSELECT,198)@11
    xMSB_uid199_atan2Test_b <= STD_LOGIC_VECTOR(redist25_yip1_10_uid197_atan2Test_b_1_q(24 downto 24));

    -- xMSB_uid165_atan2Test(BITSELECT,164)@9
    xMSB_uid165_atan2Test_b <= STD_LOGIC_VECTOR(redist31_yip1_8_uid163_atan2Test_b_1_q(26 downto 26));

    -- signX_uid7_atan2Test(BITSELECT,6)@0
    signX_uid7_atan2Test_b <= STD_LOGIC_VECTOR(x(15 downto 15));

    -- invSignX_uid9_atan2Test(LOGICAL,8)@0
    invSignX_uid9_atan2Test_q <= not (signX_uid7_atan2Test_b);

    -- constantZero_uid6_atan2Test(CONSTANT,5)
    constantZero_uid6_atan2Test_q <= "0000000000000000";

    -- absXE_uid10_atan2Test(ADDSUB,9)@0
    absXE_uid10_atan2Test_s <= invSignX_uid9_atan2Test_q;
    absXE_uid10_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => constantZero_uid6_atan2Test_q(15)) & constantZero_uid6_atan2Test_q));
    absXE_uid10_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => x(15)) & x));
    absXE_uid10_atan2Test_combproc: PROCESS (absXE_uid10_atan2Test_a, absXE_uid10_atan2Test_b, absXE_uid10_atan2Test_s)
    BEGIN
        IF (absXE_uid10_atan2Test_s = "1") THEN
            absXE_uid10_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(absXE_uid10_atan2Test_a) + SIGNED(absXE_uid10_atan2Test_b));
        ELSE
            absXE_uid10_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(absXE_uid10_atan2Test_a) - SIGNED(absXE_uid10_atan2Test_b));
        END IF;
    END PROCESS;
    absXE_uid10_atan2Test_q <= absXE_uid10_atan2Test_o(16 downto 0);

    -- absX_uid13_atan2Test(BITSELECT,12)@0
    absX_uid13_atan2Test_in <= absXE_uid10_atan2Test_q(15 downto 0);
    absX_uid13_atan2Test_b <= absX_uid13_atan2Test_in(15 downto 0);

    -- redist54_absX_uid13_atan2Test_b_1(DELAY,633)
    redist54_absX_uid13_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => absX_uid13_atan2Test_b, xout => redist54_absX_uid13_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- signY_uid8_atan2Test(BITSELECT,7)@0
    signY_uid8_atan2Test_b <= STD_LOGIC_VECTOR(y(15 downto 15));

    -- invSignY_uid11_atan2Test(LOGICAL,10)@0
    invSignY_uid11_atan2Test_q <= not (signY_uid8_atan2Test_b);

    -- absYE_uid12_atan2Test(ADDSUB,11)@0
    absYE_uid12_atan2Test_s <= invSignY_uid11_atan2Test_q;
    absYE_uid12_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => constantZero_uid6_atan2Test_q(15)) & constantZero_uid6_atan2Test_q));
    absYE_uid12_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => y(15)) & y));
    absYE_uid12_atan2Test_combproc: PROCESS (absYE_uid12_atan2Test_a, absYE_uid12_atan2Test_b, absYE_uid12_atan2Test_s)
    BEGIN
        IF (absYE_uid12_atan2Test_s = "1") THEN
            absYE_uid12_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(absYE_uid12_atan2Test_a) + SIGNED(absYE_uid12_atan2Test_b));
        ELSE
            absYE_uid12_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(absYE_uid12_atan2Test_a) - SIGNED(absYE_uid12_atan2Test_b));
        END IF;
    END PROCESS;
    absYE_uid12_atan2Test_q <= absYE_uid12_atan2Test_o(16 downto 0);

    -- absY_uid14_atan2Test(BITSELECT,13)@0
    absY_uid14_atan2Test_in <= absYE_uid12_atan2Test_q(15 downto 0);
    absY_uid14_atan2Test_b <= absY_uid14_atan2Test_in(15 downto 0);

    -- redist53_absY_uid14_atan2Test_b_1(DELAY,632)
    redist53_absY_uid14_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => absY_uid14_atan2Test_b, xout => redist53_absY_uid14_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_1_uid24_atan2Test(SUB,23)@1 + 1
    yip1E_1_uid24_atan2Test_a <= STD_LOGIC_VECTOR("0" & redist53_absY_uid14_atan2Test_b_1_q);
    yip1E_1_uid24_atan2Test_b <= STD_LOGIC_VECTOR("0" & redist54_absX_uid13_atan2Test_b_1_q);
    yip1E_1_uid24_atan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yip1E_1_uid24_atan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                yip1E_1_uid24_atan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1_uid24_atan2Test_a) - UNSIGNED(yip1E_1_uid24_atan2Test_b));
            END IF;
        END IF;
    END PROCESS;
    yip1E_1_uid24_atan2Test_q <= yip1E_1_uid24_atan2Test_o(16 downto 0);

    -- xMSB_uid32_atan2Test(BITSELECT,31)@2
    xMSB_uid32_atan2Test_b <= STD_LOGIC_VECTOR(yip1E_1_uid24_atan2Test_q(16 downto 16));

    -- xip1E_1_uid23_atan2Test(ADD,22)@1 + 1
    xip1E_1_uid23_atan2Test_a <= STD_LOGIC_VECTOR("0" & redist54_absX_uid13_atan2Test_b_1_q);
    xip1E_1_uid23_atan2Test_b <= STD_LOGIC_VECTOR("0" & redist53_absY_uid14_atan2Test_b_1_q);
    xip1E_1_uid23_atan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xip1E_1_uid23_atan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                xip1E_1_uid23_atan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(xip1E_1_uid23_atan2Test_a) + UNSIGNED(xip1E_1_uid23_atan2Test_b));
            END IF;
        END IF;
    END PROCESS;
    xip1E_1_uid23_atan2Test_q <= xip1E_1_uid23_atan2Test_o(16 downto 0);

    -- yip1E_2NA_uid42_atan2Test(BITJOIN,41)@2
    yip1E_2NA_uid42_atan2Test_q <= yip1E_1_uid24_atan2Test_q & GND_q;

    -- yip1E_2sumAHighB_uid43_atan2Test(ADDSUB,42)@2
    yip1E_2sumAHighB_uid43_atan2Test_s <= xMSB_uid32_atan2Test_b;
    yip1E_2sumAHighB_uid43_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => yip1E_2NA_uid42_atan2Test_q(17)) & yip1E_2NA_uid42_atan2Test_q));
    yip1E_2sumAHighB_uid43_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_1_uid23_atan2Test_q));
    yip1E_2sumAHighB_uid43_atan2Test_combproc: PROCESS (yip1E_2sumAHighB_uid43_atan2Test_a, yip1E_2sumAHighB_uid43_atan2Test_b, yip1E_2sumAHighB_uid43_atan2Test_s)
    BEGIN
        IF (yip1E_2sumAHighB_uid43_atan2Test_s = "1") THEN
            yip1E_2sumAHighB_uid43_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid43_atan2Test_a) + SIGNED(yip1E_2sumAHighB_uid43_atan2Test_b));
        ELSE
            yip1E_2sumAHighB_uid43_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2sumAHighB_uid43_atan2Test_a) - SIGNED(yip1E_2sumAHighB_uid43_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_2sumAHighB_uid43_atan2Test_q <= yip1E_2sumAHighB_uid43_atan2Test_o(18 downto 0);

    -- yip1_2_uid49_atan2Test(BITSELECT,48)@2
    yip1_2_uid49_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_2sumAHighB_uid43_atan2Test_q(17 downto 0));
    yip1_2_uid49_atan2Test_b <= STD_LOGIC_VECTOR(yip1_2_uid49_atan2Test_in(17 downto 0));

    -- redist49_yip1_2_uid49_atan2Test_b_1(DELAY,628)
    redist49_yip1_2_uid49_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_2_uid49_atan2Test_b, xout => redist49_yip1_2_uid49_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid51_atan2Test(BITSELECT,50)@3
    xMSB_uid51_atan2Test_b <= STD_LOGIC_VECTOR(redist49_yip1_2_uid49_atan2Test_b_1_q(17 downto 17));

    -- invSignOfSelectionSignal_uid37_atan2Test(LOGICAL,36)@2
    invSignOfSelectionSignal_uid37_atan2Test_q <= not (xMSB_uid32_atan2Test_b);

    -- xip1E_2NA_uid39_atan2Test(BITJOIN,38)@2
    xip1E_2NA_uid39_atan2Test_q <= xip1E_1_uid23_atan2Test_q & GND_q;

    -- xip1E_2sumAHighB_uid40_atan2Test(ADDSUB,39)@2
    xip1E_2sumAHighB_uid40_atan2Test_s <= invSignOfSelectionSignal_uid37_atan2Test_q;
    xip1E_2sumAHighB_uid40_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_2NA_uid39_atan2Test_q));
    xip1E_2sumAHighB_uid40_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => yip1E_1_uid24_atan2Test_q(16)) & yip1E_1_uid24_atan2Test_q));
    xip1E_2sumAHighB_uid40_atan2Test_combproc: PROCESS (xip1E_2sumAHighB_uid40_atan2Test_a, xip1E_2sumAHighB_uid40_atan2Test_b, xip1E_2sumAHighB_uid40_atan2Test_s)
    BEGIN
        IF (xip1E_2sumAHighB_uid40_atan2Test_s = "1") THEN
            xip1E_2sumAHighB_uid40_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid40_atan2Test_a) + SIGNED(xip1E_2sumAHighB_uid40_atan2Test_b));
        ELSE
            xip1E_2sumAHighB_uid40_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2sumAHighB_uid40_atan2Test_a) - SIGNED(xip1E_2sumAHighB_uid40_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_2sumAHighB_uid40_atan2Test_q <= xip1E_2sumAHighB_uid40_atan2Test_o(19 downto 0);

    -- xip1_2_uid48_atan2Test(BITSELECT,47)@2
    xip1_2_uid48_atan2Test_in <= xip1E_2sumAHighB_uid40_atan2Test_q(17 downto 0);
    xip1_2_uid48_atan2Test_b <= xip1_2_uid48_atan2Test_in(17 downto 0);

    -- redist50_xip1_2_uid48_atan2Test_b_1(DELAY,629)
    redist50_xip1_2_uid48_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_2_uid48_atan2Test_b, xout => redist50_xip1_2_uid48_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_2CostZeroPaddingA_uid45_atan2Test(CONSTANT,44)
    aip1E_2CostZeroPaddingA_uid45_atan2Test_q <= "00";

    -- yip1E_3NA_uid61_atan2Test(BITJOIN,60)@3
    yip1E_3NA_uid61_atan2Test_q <= redist49_yip1_2_uid49_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- yip1E_3sumAHighB_uid62_atan2Test(ADDSUB,61)@3
    yip1E_3sumAHighB_uid62_atan2Test_s <= xMSB_uid51_atan2Test_b;
    yip1E_3sumAHighB_uid62_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => yip1E_3NA_uid61_atan2Test_q(19)) & yip1E_3NA_uid61_atan2Test_q));
    yip1E_3sumAHighB_uid62_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist50_xip1_2_uid48_atan2Test_b_1_q));
    yip1E_3sumAHighB_uid62_atan2Test_combproc: PROCESS (yip1E_3sumAHighB_uid62_atan2Test_a, yip1E_3sumAHighB_uid62_atan2Test_b, yip1E_3sumAHighB_uid62_atan2Test_s)
    BEGIN
        IF (yip1E_3sumAHighB_uid62_atan2Test_s = "1") THEN
            yip1E_3sumAHighB_uid62_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid62_atan2Test_a) + SIGNED(yip1E_3sumAHighB_uid62_atan2Test_b));
        ELSE
            yip1E_3sumAHighB_uid62_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3sumAHighB_uid62_atan2Test_a) - SIGNED(yip1E_3sumAHighB_uid62_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_3sumAHighB_uid62_atan2Test_q <= yip1E_3sumAHighB_uid62_atan2Test_o(20 downto 0);

    -- yip1_3_uid68_atan2Test(BITSELECT,67)@3
    yip1_3_uid68_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_3sumAHighB_uid62_atan2Test_q(18 downto 0));
    yip1_3_uid68_atan2Test_b <= STD_LOGIC_VECTOR(yip1_3_uid68_atan2Test_in(18 downto 0));

    -- redist46_yip1_3_uid68_atan2Test_b_1(DELAY,625)
    redist46_yip1_3_uid68_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_3_uid68_atan2Test_b, xout => redist46_yip1_3_uid68_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid70_atan2Test(BITSELECT,69)@4
    xMSB_uid70_atan2Test_b <= STD_LOGIC_VECTOR(redist46_yip1_3_uid68_atan2Test_b_1_q(18 downto 18));

    -- invSignOfSelectionSignal_uid56_atan2Test(LOGICAL,55)@3
    invSignOfSelectionSignal_uid56_atan2Test_q <= not (xMSB_uid51_atan2Test_b);

    -- xip1E_3NA_uid58_atan2Test(BITJOIN,57)@3
    xip1E_3NA_uid58_atan2Test_q <= redist50_xip1_2_uid48_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- xip1E_3sumAHighB_uid59_atan2Test(ADDSUB,58)@3
    xip1E_3sumAHighB_uid59_atan2Test_s <= invSignOfSelectionSignal_uid56_atan2Test_q;
    xip1E_3sumAHighB_uid59_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_3NA_uid58_atan2Test_q));
    xip1E_3sumAHighB_uid59_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 18 => redist49_yip1_2_uid49_atan2Test_b_1_q(17)) & redist49_yip1_2_uid49_atan2Test_b_1_q));
    xip1E_3sumAHighB_uid59_atan2Test_combproc: PROCESS (xip1E_3sumAHighB_uid59_atan2Test_a, xip1E_3sumAHighB_uid59_atan2Test_b, xip1E_3sumAHighB_uid59_atan2Test_s)
    BEGIN
        IF (xip1E_3sumAHighB_uid59_atan2Test_s = "1") THEN
            xip1E_3sumAHighB_uid59_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid59_atan2Test_a) + SIGNED(xip1E_3sumAHighB_uid59_atan2Test_b));
        ELSE
            xip1E_3sumAHighB_uid59_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3sumAHighB_uid59_atan2Test_a) - SIGNED(xip1E_3sumAHighB_uid59_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_3sumAHighB_uid59_atan2Test_q <= xip1E_3sumAHighB_uid59_atan2Test_o(21 downto 0);

    -- xip1_3_uid67_atan2Test(BITSELECT,66)@3
    xip1_3_uid67_atan2Test_in <= xip1E_3sumAHighB_uid59_atan2Test_q(19 downto 0);
    xip1_3_uid67_atan2Test_b <= xip1_3_uid67_atan2Test_in(19 downto 0);

    -- redist47_xip1_3_uid67_atan2Test_b_1(DELAY,626)
    redist47_xip1_3_uid67_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_3_uid67_atan2Test_b, xout => redist47_xip1_3_uid67_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_4CostZeroPaddingA_uid76_atan2Test(CONSTANT,75)
    xip1E_4CostZeroPaddingA_uid76_atan2Test_q <= "000";

    -- yip1E_4NA_uid80_atan2Test(BITJOIN,79)@4
    yip1E_4NA_uid80_atan2Test_q <= redist46_yip1_3_uid68_atan2Test_b_1_q & xip1E_4CostZeroPaddingA_uid76_atan2Test_q;

    -- yip1E_4sumAHighB_uid81_atan2Test(ADDSUB,80)@4
    yip1E_4sumAHighB_uid81_atan2Test_s <= xMSB_uid70_atan2Test_b;
    yip1E_4sumAHighB_uid81_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => yip1E_4NA_uid80_atan2Test_q(21)) & yip1E_4NA_uid80_atan2Test_q));
    yip1E_4sumAHighB_uid81_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist47_xip1_3_uid67_atan2Test_b_1_q));
    yip1E_4sumAHighB_uid81_atan2Test_combproc: PROCESS (yip1E_4sumAHighB_uid81_atan2Test_a, yip1E_4sumAHighB_uid81_atan2Test_b, yip1E_4sumAHighB_uid81_atan2Test_s)
    BEGIN
        IF (yip1E_4sumAHighB_uid81_atan2Test_s = "1") THEN
            yip1E_4sumAHighB_uid81_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid81_atan2Test_a) + SIGNED(yip1E_4sumAHighB_uid81_atan2Test_b));
        ELSE
            yip1E_4sumAHighB_uid81_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4sumAHighB_uid81_atan2Test_a) - SIGNED(yip1E_4sumAHighB_uid81_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_4sumAHighB_uid81_atan2Test_q <= yip1E_4sumAHighB_uid81_atan2Test_o(22 downto 0);

    -- yip1_4_uid87_atan2Test(BITSELECT,86)@4
    yip1_4_uid87_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_4sumAHighB_uid81_atan2Test_q(20 downto 0));
    yip1_4_uid87_atan2Test_b <= STD_LOGIC_VECTOR(yip1_4_uid87_atan2Test_in(20 downto 0));

    -- redist43_yip1_4_uid87_atan2Test_b_1(DELAY,622)
    redist43_yip1_4_uid87_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 21, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid87_atan2Test_b, xout => redist43_yip1_4_uid87_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid89_atan2Test(BITSELECT,88)@5
    xMSB_uid89_atan2Test_b <= STD_LOGIC_VECTOR(redist43_yip1_4_uid87_atan2Test_b_1_q(20 downto 20));

    -- invSignOfSelectionSignal_uid75_atan2Test(LOGICAL,74)@4
    invSignOfSelectionSignal_uid75_atan2Test_q <= not (xMSB_uid70_atan2Test_b);

    -- xip1E_4NA_uid77_atan2Test(BITJOIN,76)@4
    xip1E_4NA_uid77_atan2Test_q <= redist47_xip1_3_uid67_atan2Test_b_1_q & xip1E_4CostZeroPaddingA_uid76_atan2Test_q;

    -- xip1E_4sumAHighB_uid78_atan2Test(ADDSUB,77)@4
    xip1E_4sumAHighB_uid78_atan2Test_s <= invSignOfSelectionSignal_uid75_atan2Test_q;
    xip1E_4sumAHighB_uid78_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_4NA_uid77_atan2Test_q));
    xip1E_4sumAHighB_uid78_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 19 => redist46_yip1_3_uid68_atan2Test_b_1_q(18)) & redist46_yip1_3_uid68_atan2Test_b_1_q));
    xip1E_4sumAHighB_uid78_atan2Test_combproc: PROCESS (xip1E_4sumAHighB_uid78_atan2Test_a, xip1E_4sumAHighB_uid78_atan2Test_b, xip1E_4sumAHighB_uid78_atan2Test_s)
    BEGIN
        IF (xip1E_4sumAHighB_uid78_atan2Test_s = "1") THEN
            xip1E_4sumAHighB_uid78_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid78_atan2Test_a) + SIGNED(xip1E_4sumAHighB_uid78_atan2Test_b));
        ELSE
            xip1E_4sumAHighB_uid78_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4sumAHighB_uid78_atan2Test_a) - SIGNED(xip1E_4sumAHighB_uid78_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_4sumAHighB_uid78_atan2Test_q <= xip1E_4sumAHighB_uid78_atan2Test_o(24 downto 0);

    -- xip1_4_uid86_atan2Test(BITSELECT,85)@4
    xip1_4_uid86_atan2Test_in <= xip1E_4sumAHighB_uid78_atan2Test_q(22 downto 0);
    xip1_4_uid86_atan2Test_b <= xip1_4_uid86_atan2Test_in(22 downto 0);

    -- redist44_xip1_4_uid86_atan2Test_b_1(DELAY,623)
    redist44_xip1_4_uid86_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid86_atan2Test_b, xout => redist44_xip1_4_uid86_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_5CostZeroPaddingA_uid95_atan2Test(CONSTANT,94)
    xip1E_5CostZeroPaddingA_uid95_atan2Test_q <= "0000";

    -- yip1E_5NA_uid99_atan2Test(BITJOIN,98)@5
    yip1E_5NA_uid99_atan2Test_q <= redist43_yip1_4_uid87_atan2Test_b_1_q & xip1E_5CostZeroPaddingA_uid95_atan2Test_q;

    -- yip1E_5sumAHighB_uid100_atan2Test(ADDSUB,99)@5
    yip1E_5sumAHighB_uid100_atan2Test_s <= xMSB_uid89_atan2Test_b;
    yip1E_5sumAHighB_uid100_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => yip1E_5NA_uid99_atan2Test_q(24)) & yip1E_5NA_uid99_atan2Test_q));
    yip1E_5sumAHighB_uid100_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist44_xip1_4_uid86_atan2Test_b_1_q));
    yip1E_5sumAHighB_uid100_atan2Test_combproc: PROCESS (yip1E_5sumAHighB_uid100_atan2Test_a, yip1E_5sumAHighB_uid100_atan2Test_b, yip1E_5sumAHighB_uid100_atan2Test_s)
    BEGIN
        IF (yip1E_5sumAHighB_uid100_atan2Test_s = "1") THEN
            yip1E_5sumAHighB_uid100_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid100_atan2Test_a) + SIGNED(yip1E_5sumAHighB_uid100_atan2Test_b));
        ELSE
            yip1E_5sumAHighB_uid100_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5sumAHighB_uid100_atan2Test_a) - SIGNED(yip1E_5sumAHighB_uid100_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_5sumAHighB_uid100_atan2Test_q <= yip1E_5sumAHighB_uid100_atan2Test_o(25 downto 0);

    -- yip1_5_uid106_atan2Test(BITSELECT,105)@5
    yip1_5_uid106_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_5sumAHighB_uid100_atan2Test_q(23 downto 0));
    yip1_5_uid106_atan2Test_b <= STD_LOGIC_VECTOR(yip1_5_uid106_atan2Test_in(23 downto 0));

    -- redist40_yip1_5_uid106_atan2Test_b_1(DELAY,619)
    redist40_yip1_5_uid106_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid106_atan2Test_b, xout => redist40_yip1_5_uid106_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid108_atan2Test(BITSELECT,107)@6
    xMSB_uid108_atan2Test_b <= STD_LOGIC_VECTOR(redist40_yip1_5_uid106_atan2Test_b_1_q(23 downto 23));

    -- invSignOfSelectionSignal_uid94_atan2Test(LOGICAL,93)@5
    invSignOfSelectionSignal_uid94_atan2Test_q <= not (xMSB_uid89_atan2Test_b);

    -- xip1E_5NA_uid96_atan2Test(BITJOIN,95)@5
    xip1E_5NA_uid96_atan2Test_q <= redist44_xip1_4_uid86_atan2Test_b_1_q & xip1E_5CostZeroPaddingA_uid95_atan2Test_q;

    -- xip1E_5sumAHighB_uid97_atan2Test(ADDSUB,96)@5
    xip1E_5sumAHighB_uid97_atan2Test_s <= invSignOfSelectionSignal_uid94_atan2Test_q;
    xip1E_5sumAHighB_uid97_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_5NA_uid96_atan2Test_q));
    xip1E_5sumAHighB_uid97_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 21 => redist43_yip1_4_uid87_atan2Test_b_1_q(20)) & redist43_yip1_4_uid87_atan2Test_b_1_q));
    xip1E_5sumAHighB_uid97_atan2Test_combproc: PROCESS (xip1E_5sumAHighB_uid97_atan2Test_a, xip1E_5sumAHighB_uid97_atan2Test_b, xip1E_5sumAHighB_uid97_atan2Test_s)
    BEGIN
        IF (xip1E_5sumAHighB_uid97_atan2Test_s = "1") THEN
            xip1E_5sumAHighB_uid97_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid97_atan2Test_a) + SIGNED(xip1E_5sumAHighB_uid97_atan2Test_b));
        ELSE
            xip1E_5sumAHighB_uid97_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5sumAHighB_uid97_atan2Test_a) - SIGNED(xip1E_5sumAHighB_uid97_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_5sumAHighB_uid97_atan2Test_q <= xip1E_5sumAHighB_uid97_atan2Test_o(28 downto 0);

    -- xip1_5_uid105_atan2Test(BITSELECT,104)@5
    xip1_5_uid105_atan2Test_in <= xip1E_5sumAHighB_uid97_atan2Test_q(26 downto 0);
    xip1_5_uid105_atan2Test_b <= xip1_5_uid105_atan2Test_in(26 downto 0);

    -- redist41_xip1_5_uid105_atan2Test_b_1(DELAY,620)
    redist41_xip1_5_uid105_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid105_atan2Test_b, xout => redist41_xip1_5_uid105_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_6CostZeroPaddingA_uid114_atan2Test(CONSTANT,113)
    xip1E_6CostZeroPaddingA_uid114_atan2Test_q <= "00000";

    -- yip1E_6NA_uid118_atan2Test(BITJOIN,117)@6
    yip1E_6NA_uid118_atan2Test_q <= redist40_yip1_5_uid106_atan2Test_b_1_q & xip1E_6CostZeroPaddingA_uid114_atan2Test_q;

    -- yip1E_6sumAHighB_uid119_atan2Test(ADDSUB,118)@6
    yip1E_6sumAHighB_uid119_atan2Test_s <= xMSB_uid108_atan2Test_b;
    yip1E_6sumAHighB_uid119_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => yip1E_6NA_uid118_atan2Test_q(28)) & yip1E_6NA_uid118_atan2Test_q));
    yip1E_6sumAHighB_uid119_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist41_xip1_5_uid105_atan2Test_b_1_q));
    yip1E_6sumAHighB_uid119_atan2Test_combproc: PROCESS (yip1E_6sumAHighB_uid119_atan2Test_a, yip1E_6sumAHighB_uid119_atan2Test_b, yip1E_6sumAHighB_uid119_atan2Test_s)
    BEGIN
        IF (yip1E_6sumAHighB_uid119_atan2Test_s = "1") THEN
            yip1E_6sumAHighB_uid119_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid119_atan2Test_a) + SIGNED(yip1E_6sumAHighB_uid119_atan2Test_b));
        ELSE
            yip1E_6sumAHighB_uid119_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6sumAHighB_uid119_atan2Test_a) - SIGNED(yip1E_6sumAHighB_uid119_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_6sumAHighB_uid119_atan2Test_q <= yip1E_6sumAHighB_uid119_atan2Test_o(29 downto 0);

    -- yip1_6_uid125_atan2Test(BITSELECT,124)@6
    yip1_6_uid125_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_6sumAHighB_uid119_atan2Test_q(27 downto 0));
    yip1_6_uid125_atan2Test_b <= STD_LOGIC_VECTOR(yip1_6_uid125_atan2Test_in(27 downto 0));

    -- redist37_yip1_6_uid125_atan2Test_b_1(DELAY,616)
    redist37_yip1_6_uid125_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_6_uid125_atan2Test_b, xout => redist37_yip1_6_uid125_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid127_atan2Test(BITSELECT,126)@7
    xMSB_uid127_atan2Test_b <= STD_LOGIC_VECTOR(redist37_yip1_6_uid125_atan2Test_b_1_q(27 downto 27));

    -- invSignOfSelectionSignal_uid113_atan2Test(LOGICAL,112)@6
    invSignOfSelectionSignal_uid113_atan2Test_q <= not (xMSB_uid108_atan2Test_b);

    -- xip1E_6NA_uid115_atan2Test(BITJOIN,114)@6
    xip1E_6NA_uid115_atan2Test_q <= redist41_xip1_5_uid105_atan2Test_b_1_q & xip1E_6CostZeroPaddingA_uid114_atan2Test_q;

    -- xip1E_6sumAHighB_uid116_atan2Test(ADDSUB,115)@6
    xip1E_6sumAHighB_uid116_atan2Test_s <= invSignOfSelectionSignal_uid113_atan2Test_q;
    xip1E_6sumAHighB_uid116_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_6NA_uid115_atan2Test_q));
    xip1E_6sumAHighB_uid116_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 24 => redist40_yip1_5_uid106_atan2Test_b_1_q(23)) & redist40_yip1_5_uid106_atan2Test_b_1_q));
    xip1E_6sumAHighB_uid116_atan2Test_combproc: PROCESS (xip1E_6sumAHighB_uid116_atan2Test_a, xip1E_6sumAHighB_uid116_atan2Test_b, xip1E_6sumAHighB_uid116_atan2Test_s)
    BEGIN
        IF (xip1E_6sumAHighB_uid116_atan2Test_s = "1") THEN
            xip1E_6sumAHighB_uid116_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid116_atan2Test_a) + SIGNED(xip1E_6sumAHighB_uid116_atan2Test_b));
        ELSE
            xip1E_6sumAHighB_uid116_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6sumAHighB_uid116_atan2Test_a) - SIGNED(xip1E_6sumAHighB_uid116_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_6sumAHighB_uid116_atan2Test_q <= xip1E_6sumAHighB_uid116_atan2Test_o(33 downto 0);

    -- xip1_6_uid124_atan2Test(BITSELECT,123)@6
    xip1_6_uid124_atan2Test_in <= xip1E_6sumAHighB_uid116_atan2Test_q(31 downto 0);
    xip1_6_uid124_atan2Test_b <= xip1_6_uid124_atan2Test_in(31 downto 0);

    -- redist38_xip1_6_uid124_atan2Test_b_1(DELAY,617)
    redist38_xip1_6_uid124_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_6_uid124_atan2Test_b, xout => redist38_xip1_6_uid124_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid131_atan2Test(BITSELECT,130)@7
    twoToMiSiXip_uid131_atan2Test_b <= redist38_xip1_6_uid124_atan2Test_b_1_q(31 downto 5);

    -- yip1E_7NA_uid139_atan2Test(BITJOIN,138)@7
    yip1E_7NA_uid139_atan2Test_q <= redist37_yip1_6_uid125_atan2Test_b_1_q & GND_q;

    -- yip1E_7sumAHighB_uid140_atan2Test(ADDSUB,139)@7
    yip1E_7sumAHighB_uid140_atan2Test_s <= xMSB_uid127_atan2Test_b;
    yip1E_7sumAHighB_uid140_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => yip1E_7NA_uid139_atan2Test_q(28)) & yip1E_7NA_uid139_atan2Test_q));
    yip1E_7sumAHighB_uid140_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid131_atan2Test_b));
    yip1E_7sumAHighB_uid140_atan2Test_combproc: PROCESS (yip1E_7sumAHighB_uid140_atan2Test_a, yip1E_7sumAHighB_uid140_atan2Test_b, yip1E_7sumAHighB_uid140_atan2Test_s)
    BEGIN
        IF (yip1E_7sumAHighB_uid140_atan2Test_s = "1") THEN
            yip1E_7sumAHighB_uid140_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7sumAHighB_uid140_atan2Test_a) + SIGNED(yip1E_7sumAHighB_uid140_atan2Test_b));
        ELSE
            yip1E_7sumAHighB_uid140_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7sumAHighB_uid140_atan2Test_a) - SIGNED(yip1E_7sumAHighB_uid140_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_7sumAHighB_uid140_atan2Test_q <= yip1E_7sumAHighB_uid140_atan2Test_o(29 downto 0);

    -- yip1_7_uid146_atan2Test(BITSELECT,145)@7
    yip1_7_uid146_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_7sumAHighB_uid140_atan2Test_q(27 downto 0));
    yip1_7_uid146_atan2Test_b <= STD_LOGIC_VECTOR(yip1_7_uid146_atan2Test_in(27 downto 0));

    -- redist34_yip1_7_uid146_atan2Test_b_1(DELAY,613)
    redist34_yip1_7_uid146_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_7_uid146_atan2Test_b, xout => redist34_yip1_7_uid146_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid148_atan2Test(BITSELECT,147)@8
    xMSB_uid148_atan2Test_b <= STD_LOGIC_VECTOR(redist34_yip1_7_uid146_atan2Test_b_1_q(27 downto 27));

    -- invSignOfSelectionSignal_uid155_atan2Test(LOGICAL,154)@8
    invSignOfSelectionSignal_uid155_atan2Test_q <= not (xMSB_uid148_atan2Test_b);

    -- twoToMiSiYip_uid153_atan2Test(BITSELECT,152)@8
    twoToMiSiYip_uid153_atan2Test_b <= STD_LOGIC_VECTOR(redist34_yip1_7_uid146_atan2Test_b_1_q(27 downto 7));

    -- invSignOfSelectionSignal_uid134_atan2Test(LOGICAL,133)@7
    invSignOfSelectionSignal_uid134_atan2Test_q <= not (xMSB_uid127_atan2Test_b);

    -- twoToMiSiYip_uid132_atan2Test(BITSELECT,131)@7
    twoToMiSiYip_uid132_atan2Test_b <= STD_LOGIC_VECTOR(redist37_yip1_6_uid125_atan2Test_b_1_q(27 downto 5));

    -- xip1E_7NA_uid136_atan2Test(BITJOIN,135)@7
    xip1E_7NA_uid136_atan2Test_q <= redist38_xip1_6_uid124_atan2Test_b_1_q & GND_q;

    -- xip1E_7sumAHighB_uid137_atan2Test(ADDSUB,136)@7
    xip1E_7sumAHighB_uid137_atan2Test_s <= invSignOfSelectionSignal_uid134_atan2Test_q;
    xip1E_7sumAHighB_uid137_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & xip1E_7NA_uid136_atan2Test_q));
    xip1E_7sumAHighB_uid137_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 23 => twoToMiSiYip_uid132_atan2Test_b(22)) & twoToMiSiYip_uid132_atan2Test_b));
    xip1E_7sumAHighB_uid137_atan2Test_combproc: PROCESS (xip1E_7sumAHighB_uid137_atan2Test_a, xip1E_7sumAHighB_uid137_atan2Test_b, xip1E_7sumAHighB_uid137_atan2Test_s)
    BEGIN
        IF (xip1E_7sumAHighB_uid137_atan2Test_s = "1") THEN
            xip1E_7sumAHighB_uid137_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7sumAHighB_uid137_atan2Test_a) + SIGNED(xip1E_7sumAHighB_uid137_atan2Test_b));
        ELSE
            xip1E_7sumAHighB_uid137_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7sumAHighB_uid137_atan2Test_a) - SIGNED(xip1E_7sumAHighB_uid137_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_7sumAHighB_uid137_atan2Test_q <= xip1E_7sumAHighB_uid137_atan2Test_o(34 downto 0);

    -- xip1_7_uid145_atan2Test(BITSELECT,144)@7
    xip1_7_uid145_atan2Test_in <= xip1E_7sumAHighB_uid137_atan2Test_q(32 downto 0);
    xip1_7_uid145_atan2Test_b <= xip1_7_uid145_atan2Test_in(32 downto 0);

    -- redist35_xip1_7_uid145_atan2Test_b_1(DELAY,614)
    redist35_xip1_7_uid145_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_7_uid145_atan2Test_b, xout => redist35_xip1_7_uid145_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_8_uid156_atan2Test(ADDSUB,155)@8
    xip1E_8_uid156_atan2Test_s <= invSignOfSelectionSignal_uid155_atan2Test_q;
    xip1E_8_uid156_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist35_xip1_7_uid145_atan2Test_b_1_q));
    xip1E_8_uid156_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 21 => twoToMiSiYip_uid153_atan2Test_b(20)) & twoToMiSiYip_uid153_atan2Test_b));
    xip1E_8_uid156_atan2Test_combproc: PROCESS (xip1E_8_uid156_atan2Test_a, xip1E_8_uid156_atan2Test_b, xip1E_8_uid156_atan2Test_s)
    BEGIN
        IF (xip1E_8_uid156_atan2Test_s = "1") THEN
            xip1E_8_uid156_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_atan2Test_a) + SIGNED(xip1E_8_uid156_atan2Test_b));
        ELSE
            xip1E_8_uid156_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_atan2Test_a) - SIGNED(xip1E_8_uid156_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_8_uid156_atan2Test_q <= xip1E_8_uid156_atan2Test_o(34 downto 0);

    -- xip1_8_uid162_atan2Test(BITSELECT,161)@8
    xip1_8_uid162_atan2Test_in <= xip1E_8_uid156_atan2Test_q(32 downto 0);
    xip1_8_uid162_atan2Test_b <= xip1_8_uid162_atan2Test_in(32 downto 0);

    -- redist32_xip1_8_uid162_atan2Test_b_1(DELAY,611)
    redist32_xip1_8_uid162_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_8_uid162_atan2Test_b, xout => redist32_xip1_8_uid162_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid169_atan2Test(BITSELECT,168)@9
    twoToMiSiXip_uid169_atan2Test_b <= redist32_xip1_8_uid162_atan2Test_b_1_q(32 downto 8);

    -- twoToMiSiXip_uid152_atan2Test(BITSELECT,151)@8
    twoToMiSiXip_uid152_atan2Test_b <= redist35_xip1_7_uid145_atan2Test_b_1_q(32 downto 7);

    -- yip1E_8_uid157_atan2Test(ADDSUB,156)@8
    yip1E_8_uid157_atan2Test_s <= xMSB_uid148_atan2Test_b;
    yip1E_8_uid157_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => redist34_yip1_7_uid146_atan2Test_b_1_q(27)) & redist34_yip1_7_uid146_atan2Test_b_1_q));
    yip1E_8_uid157_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid152_atan2Test_b));
    yip1E_8_uid157_atan2Test_combproc: PROCESS (yip1E_8_uid157_atan2Test_a, yip1E_8_uid157_atan2Test_b, yip1E_8_uid157_atan2Test_s)
    BEGIN
        IF (yip1E_8_uid157_atan2Test_s = "1") THEN
            yip1E_8_uid157_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_atan2Test_a) + SIGNED(yip1E_8_uid157_atan2Test_b));
        ELSE
            yip1E_8_uid157_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_atan2Test_a) - SIGNED(yip1E_8_uid157_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_8_uid157_atan2Test_q <= yip1E_8_uid157_atan2Test_o(28 downto 0);

    -- yip1_8_uid163_atan2Test(BITSELECT,162)@8
    yip1_8_uid163_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_8_uid157_atan2Test_q(26 downto 0));
    yip1_8_uid163_atan2Test_b <= STD_LOGIC_VECTOR(yip1_8_uid163_atan2Test_in(26 downto 0));

    -- redist31_yip1_8_uid163_atan2Test_b_1(DELAY,610)
    redist31_yip1_8_uid163_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_8_uid163_atan2Test_b, xout => redist31_yip1_8_uid163_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_9_uid174_atan2Test(ADDSUB,173)@9
    yip1E_9_uid174_atan2Test_s <= xMSB_uid165_atan2Test_b;
    yip1E_9_uid174_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => redist31_yip1_8_uid163_atan2Test_b_1_q(26)) & redist31_yip1_8_uid163_atan2Test_b_1_q));
    yip1E_9_uid174_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid169_atan2Test_b));
    yip1E_9_uid174_atan2Test_combproc: PROCESS (yip1E_9_uid174_atan2Test_a, yip1E_9_uid174_atan2Test_b, yip1E_9_uid174_atan2Test_s)
    BEGIN
        IF (yip1E_9_uid174_atan2Test_s = "1") THEN
            yip1E_9_uid174_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid174_atan2Test_a) + SIGNED(yip1E_9_uid174_atan2Test_b));
        ELSE
            yip1E_9_uid174_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid174_atan2Test_a) - SIGNED(yip1E_9_uid174_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_9_uid174_atan2Test_q <= yip1E_9_uid174_atan2Test_o(27 downto 0);

    -- yip1_9_uid180_atan2Test(BITSELECT,179)@9
    yip1_9_uid180_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_9_uid174_atan2Test_q(25 downto 0));
    yip1_9_uid180_atan2Test_b <= STD_LOGIC_VECTOR(yip1_9_uid180_atan2Test_in(25 downto 0));

    -- redist28_yip1_9_uid180_atan2Test_b_1(DELAY,607)
    redist28_yip1_9_uid180_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_9_uid180_atan2Test_b, xout => redist28_yip1_9_uid180_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid182_atan2Test(BITSELECT,181)@10
    xMSB_uid182_atan2Test_b <= STD_LOGIC_VECTOR(redist28_yip1_9_uid180_atan2Test_b_1_q(25 downto 25));

    -- invSignOfSelectionSignal_uid189_atan2Test(LOGICAL,188)@10
    invSignOfSelectionSignal_uid189_atan2Test_q <= not (xMSB_uid182_atan2Test_b);

    -- twoToMiSiYip_uid187_atan2Test(BITSELECT,186)@10
    twoToMiSiYip_uid187_atan2Test_b <= STD_LOGIC_VECTOR(redist28_yip1_9_uid180_atan2Test_b_1_q(25 downto 9));

    -- invSignOfSelectionSignal_uid172_atan2Test(LOGICAL,171)@9
    invSignOfSelectionSignal_uid172_atan2Test_q <= not (xMSB_uid165_atan2Test_b);

    -- twoToMiSiYip_uid170_atan2Test(BITSELECT,169)@9
    twoToMiSiYip_uid170_atan2Test_b <= STD_LOGIC_VECTOR(redist31_yip1_8_uid163_atan2Test_b_1_q(26 downto 8));

    -- xip1E_9_uid173_atan2Test(ADDSUB,172)@9
    xip1E_9_uid173_atan2Test_s <= invSignOfSelectionSignal_uid172_atan2Test_q;
    xip1E_9_uid173_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist32_xip1_8_uid162_atan2Test_b_1_q));
    xip1E_9_uid173_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 19 => twoToMiSiYip_uid170_atan2Test_b(18)) & twoToMiSiYip_uid170_atan2Test_b));
    xip1E_9_uid173_atan2Test_combproc: PROCESS (xip1E_9_uid173_atan2Test_a, xip1E_9_uid173_atan2Test_b, xip1E_9_uid173_atan2Test_s)
    BEGIN
        IF (xip1E_9_uid173_atan2Test_s = "1") THEN
            xip1E_9_uid173_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid173_atan2Test_a) + SIGNED(xip1E_9_uid173_atan2Test_b));
        ELSE
            xip1E_9_uid173_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid173_atan2Test_a) - SIGNED(xip1E_9_uid173_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_9_uid173_atan2Test_q <= xip1E_9_uid173_atan2Test_o(34 downto 0);

    -- xip1_9_uid179_atan2Test(BITSELECT,178)@9
    xip1_9_uid179_atan2Test_in <= xip1E_9_uid173_atan2Test_q(32 downto 0);
    xip1_9_uid179_atan2Test_b <= xip1_9_uid179_atan2Test_in(32 downto 0);

    -- redist29_xip1_9_uid179_atan2Test_b_1(DELAY,608)
    redist29_xip1_9_uid179_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_9_uid179_atan2Test_b, xout => redist29_xip1_9_uid179_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_10_uid190_atan2Test(ADDSUB,189)@10
    xip1E_10_uid190_atan2Test_s <= invSignOfSelectionSignal_uid189_atan2Test_q;
    xip1E_10_uid190_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist29_xip1_9_uid179_atan2Test_b_1_q));
    xip1E_10_uid190_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 17 => twoToMiSiYip_uid187_atan2Test_b(16)) & twoToMiSiYip_uid187_atan2Test_b));
    xip1E_10_uid190_atan2Test_combproc: PROCESS (xip1E_10_uid190_atan2Test_a, xip1E_10_uid190_atan2Test_b, xip1E_10_uid190_atan2Test_s)
    BEGIN
        IF (xip1E_10_uid190_atan2Test_s = "1") THEN
            xip1E_10_uid190_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid190_atan2Test_a) + SIGNED(xip1E_10_uid190_atan2Test_b));
        ELSE
            xip1E_10_uid190_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid190_atan2Test_a) - SIGNED(xip1E_10_uid190_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_10_uid190_atan2Test_q <= xip1E_10_uid190_atan2Test_o(34 downto 0);

    -- xip1_10_uid196_atan2Test(BITSELECT,195)@10
    xip1_10_uid196_atan2Test_in <= xip1E_10_uid190_atan2Test_q(32 downto 0);
    xip1_10_uid196_atan2Test_b <= xip1_10_uid196_atan2Test_in(32 downto 0);

    -- redist26_xip1_10_uid196_atan2Test_b_1(DELAY,605)
    redist26_xip1_10_uid196_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_10_uid196_atan2Test_b, xout => redist26_xip1_10_uid196_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid203_atan2Test(BITSELECT,202)@11
    twoToMiSiXip_uid203_atan2Test_b <= redist26_xip1_10_uid196_atan2Test_b_1_q(32 downto 10);

    -- twoToMiSiXip_uid186_atan2Test(BITSELECT,185)@10
    twoToMiSiXip_uid186_atan2Test_b <= redist29_xip1_9_uid179_atan2Test_b_1_q(32 downto 9);

    -- yip1E_10_uid191_atan2Test(ADDSUB,190)@10
    yip1E_10_uid191_atan2Test_s <= xMSB_uid182_atan2Test_b;
    yip1E_10_uid191_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => redist28_yip1_9_uid180_atan2Test_b_1_q(25)) & redist28_yip1_9_uid180_atan2Test_b_1_q));
    yip1E_10_uid191_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid186_atan2Test_b));
    yip1E_10_uid191_atan2Test_combproc: PROCESS (yip1E_10_uid191_atan2Test_a, yip1E_10_uid191_atan2Test_b, yip1E_10_uid191_atan2Test_s)
    BEGIN
        IF (yip1E_10_uid191_atan2Test_s = "1") THEN
            yip1E_10_uid191_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid191_atan2Test_a) + SIGNED(yip1E_10_uid191_atan2Test_b));
        ELSE
            yip1E_10_uid191_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid191_atan2Test_a) - SIGNED(yip1E_10_uid191_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_10_uid191_atan2Test_q <= yip1E_10_uid191_atan2Test_o(26 downto 0);

    -- yip1_10_uid197_atan2Test(BITSELECT,196)@10
    yip1_10_uid197_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_10_uid191_atan2Test_q(24 downto 0));
    yip1_10_uid197_atan2Test_b <= STD_LOGIC_VECTOR(yip1_10_uid197_atan2Test_in(24 downto 0));

    -- redist25_yip1_10_uid197_atan2Test_b_1(DELAY,604)
    redist25_yip1_10_uid197_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_10_uid197_atan2Test_b, xout => redist25_yip1_10_uid197_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_11_uid208_atan2Test(ADDSUB,207)@11
    yip1E_11_uid208_atan2Test_s <= xMSB_uid199_atan2Test_b;
    yip1E_11_uid208_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist25_yip1_10_uid197_atan2Test_b_1_q(24)) & redist25_yip1_10_uid197_atan2Test_b_1_q));
    yip1E_11_uid208_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid203_atan2Test_b));
    yip1E_11_uid208_atan2Test_combproc: PROCESS (yip1E_11_uid208_atan2Test_a, yip1E_11_uid208_atan2Test_b, yip1E_11_uid208_atan2Test_s)
    BEGIN
        IF (yip1E_11_uid208_atan2Test_s = "1") THEN
            yip1E_11_uid208_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid208_atan2Test_a) + SIGNED(yip1E_11_uid208_atan2Test_b));
        ELSE
            yip1E_11_uid208_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid208_atan2Test_a) - SIGNED(yip1E_11_uid208_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_11_uid208_atan2Test_q <= yip1E_11_uid208_atan2Test_o(25 downto 0);

    -- yip1_11_uid214_atan2Test(BITSELECT,213)@11
    yip1_11_uid214_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_11_uid208_atan2Test_q(23 downto 0));
    yip1_11_uid214_atan2Test_b <= STD_LOGIC_VECTOR(yip1_11_uid214_atan2Test_in(23 downto 0));

    -- redist22_yip1_11_uid214_atan2Test_b_1(DELAY,601)
    redist22_yip1_11_uid214_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_11_uid214_atan2Test_b, xout => redist22_yip1_11_uid214_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid216_atan2Test(BITSELECT,215)@12
    xMSB_uid216_atan2Test_b <= STD_LOGIC_VECTOR(redist22_yip1_11_uid214_atan2Test_b_1_q(23 downto 23));

    -- invSignOfSelectionSignal_uid223_atan2Test(LOGICAL,222)@12
    invSignOfSelectionSignal_uid223_atan2Test_q <= not (xMSB_uid216_atan2Test_b);

    -- twoToMiSiYip_uid221_atan2Test(BITSELECT,220)@12
    twoToMiSiYip_uid221_atan2Test_b <= STD_LOGIC_VECTOR(redist22_yip1_11_uid214_atan2Test_b_1_q(23 downto 11));

    -- invSignOfSelectionSignal_uid206_atan2Test(LOGICAL,205)@11
    invSignOfSelectionSignal_uid206_atan2Test_q <= not (xMSB_uid199_atan2Test_b);

    -- twoToMiSiYip_uid204_atan2Test(BITSELECT,203)@11
    twoToMiSiYip_uid204_atan2Test_b <= STD_LOGIC_VECTOR(redist25_yip1_10_uid197_atan2Test_b_1_q(24 downto 10));

    -- xip1E_11_uid207_atan2Test(ADDSUB,206)@11
    xip1E_11_uid207_atan2Test_s <= invSignOfSelectionSignal_uid206_atan2Test_q;
    xip1E_11_uid207_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist26_xip1_10_uid196_atan2Test_b_1_q));
    xip1E_11_uid207_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 15 => twoToMiSiYip_uid204_atan2Test_b(14)) & twoToMiSiYip_uid204_atan2Test_b));
    xip1E_11_uid207_atan2Test_combproc: PROCESS (xip1E_11_uid207_atan2Test_a, xip1E_11_uid207_atan2Test_b, xip1E_11_uid207_atan2Test_s)
    BEGIN
        IF (xip1E_11_uid207_atan2Test_s = "1") THEN
            xip1E_11_uid207_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid207_atan2Test_a) + SIGNED(xip1E_11_uid207_atan2Test_b));
        ELSE
            xip1E_11_uid207_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid207_atan2Test_a) - SIGNED(xip1E_11_uid207_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_11_uid207_atan2Test_q <= xip1E_11_uid207_atan2Test_o(34 downto 0);

    -- xip1_11_uid213_atan2Test(BITSELECT,212)@11
    xip1_11_uid213_atan2Test_in <= xip1E_11_uid207_atan2Test_q(32 downto 0);
    xip1_11_uid213_atan2Test_b <= xip1_11_uid213_atan2Test_in(32 downto 0);

    -- redist23_xip1_11_uid213_atan2Test_b_1(DELAY,602)
    redist23_xip1_11_uid213_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_11_uid213_atan2Test_b, xout => redist23_xip1_11_uid213_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_12_uid224_atan2Test(ADDSUB,223)@12
    xip1E_12_uid224_atan2Test_s <= invSignOfSelectionSignal_uid223_atan2Test_q;
    xip1E_12_uid224_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist23_xip1_11_uid213_atan2Test_b_1_q));
    xip1E_12_uid224_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 13 => twoToMiSiYip_uid221_atan2Test_b(12)) & twoToMiSiYip_uid221_atan2Test_b));
    xip1E_12_uid224_atan2Test_combproc: PROCESS (xip1E_12_uid224_atan2Test_a, xip1E_12_uid224_atan2Test_b, xip1E_12_uid224_atan2Test_s)
    BEGIN
        IF (xip1E_12_uid224_atan2Test_s = "1") THEN
            xip1E_12_uid224_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid224_atan2Test_a) + SIGNED(xip1E_12_uid224_atan2Test_b));
        ELSE
            xip1E_12_uid224_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid224_atan2Test_a) - SIGNED(xip1E_12_uid224_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_12_uid224_atan2Test_q <= xip1E_12_uid224_atan2Test_o(34 downto 0);

    -- xip1_12_uid230_atan2Test(BITSELECT,229)@12
    xip1_12_uid230_atan2Test_in <= xip1E_12_uid224_atan2Test_q(32 downto 0);
    xip1_12_uid230_atan2Test_b <= xip1_12_uid230_atan2Test_in(32 downto 0);

    -- redist20_xip1_12_uid230_atan2Test_b_1(DELAY,599)
    redist20_xip1_12_uid230_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_12_uid230_atan2Test_b, xout => redist20_xip1_12_uid230_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid237_atan2Test(BITSELECT,236)@13
    twoToMiSiXip_uid237_atan2Test_b <= redist20_xip1_12_uid230_atan2Test_b_1_q(32 downto 12);

    -- twoToMiSiXip_uid220_atan2Test(BITSELECT,219)@12
    twoToMiSiXip_uid220_atan2Test_b <= redist23_xip1_11_uid213_atan2Test_b_1_q(32 downto 11);

    -- yip1E_12_uid225_atan2Test(ADDSUB,224)@12
    yip1E_12_uid225_atan2Test_s <= xMSB_uid216_atan2Test_b;
    yip1E_12_uid225_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => redist22_yip1_11_uid214_atan2Test_b_1_q(23)) & redist22_yip1_11_uid214_atan2Test_b_1_q));
    yip1E_12_uid225_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid220_atan2Test_b));
    yip1E_12_uid225_atan2Test_combproc: PROCESS (yip1E_12_uid225_atan2Test_a, yip1E_12_uid225_atan2Test_b, yip1E_12_uid225_atan2Test_s)
    BEGIN
        IF (yip1E_12_uid225_atan2Test_s = "1") THEN
            yip1E_12_uid225_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid225_atan2Test_a) + SIGNED(yip1E_12_uid225_atan2Test_b));
        ELSE
            yip1E_12_uid225_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid225_atan2Test_a) - SIGNED(yip1E_12_uid225_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_12_uid225_atan2Test_q <= yip1E_12_uid225_atan2Test_o(24 downto 0);

    -- yip1_12_uid231_atan2Test(BITSELECT,230)@12
    yip1_12_uid231_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_12_uid225_atan2Test_q(22 downto 0));
    yip1_12_uid231_atan2Test_b <= STD_LOGIC_VECTOR(yip1_12_uid231_atan2Test_in(22 downto 0));

    -- redist19_yip1_12_uid231_atan2Test_b_1(DELAY,598)
    redist19_yip1_12_uid231_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_12_uid231_atan2Test_b, xout => redist19_yip1_12_uid231_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_13_uid242_atan2Test(ADDSUB,241)@13
    yip1E_13_uid242_atan2Test_s <= xMSB_uid233_atan2Test_b;
    yip1E_13_uid242_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist19_yip1_12_uid231_atan2Test_b_1_q(22)) & redist19_yip1_12_uid231_atan2Test_b_1_q));
    yip1E_13_uid242_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid237_atan2Test_b));
    yip1E_13_uid242_atan2Test_combproc: PROCESS (yip1E_13_uid242_atan2Test_a, yip1E_13_uid242_atan2Test_b, yip1E_13_uid242_atan2Test_s)
    BEGIN
        IF (yip1E_13_uid242_atan2Test_s = "1") THEN
            yip1E_13_uid242_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid242_atan2Test_a) + SIGNED(yip1E_13_uid242_atan2Test_b));
        ELSE
            yip1E_13_uid242_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid242_atan2Test_a) - SIGNED(yip1E_13_uid242_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_13_uid242_atan2Test_q <= yip1E_13_uid242_atan2Test_o(23 downto 0);

    -- yip1_13_uid248_atan2Test(BITSELECT,247)@13
    yip1_13_uid248_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_13_uid242_atan2Test_q(21 downto 0));
    yip1_13_uid248_atan2Test_b <= STD_LOGIC_VECTOR(yip1_13_uid248_atan2Test_in(21 downto 0));

    -- redist16_yip1_13_uid248_atan2Test_b_1(DELAY,595)
    redist16_yip1_13_uid248_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_13_uid248_atan2Test_b, xout => redist16_yip1_13_uid248_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xMSB_uid250_atan2Test(BITSELECT,249)@14
    xMSB_uid250_atan2Test_b <= STD_LOGIC_VECTOR(redist16_yip1_13_uid248_atan2Test_b_1_q(21 downto 21));

    -- invSignOfSelectionSignal_uid257_atan2Test(LOGICAL,256)@14
    invSignOfSelectionSignal_uid257_atan2Test_q <= not (xMSB_uid250_atan2Test_b);

    -- twoToMiSiYip_uid255_atan2Test(BITSELECT,254)@14
    twoToMiSiYip_uid255_atan2Test_b <= STD_LOGIC_VECTOR(redist16_yip1_13_uid248_atan2Test_b_1_q(21 downto 13));

    -- invSignOfSelectionSignal_uid240_atan2Test(LOGICAL,239)@13
    invSignOfSelectionSignal_uid240_atan2Test_q <= not (xMSB_uid233_atan2Test_b);

    -- twoToMiSiYip_uid238_atan2Test(BITSELECT,237)@13
    twoToMiSiYip_uid238_atan2Test_b <= STD_LOGIC_VECTOR(redist19_yip1_12_uid231_atan2Test_b_1_q(22 downto 12));

    -- xip1E_13_uid241_atan2Test(ADDSUB,240)@13
    xip1E_13_uid241_atan2Test_s <= invSignOfSelectionSignal_uid240_atan2Test_q;
    xip1E_13_uid241_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist20_xip1_12_uid230_atan2Test_b_1_q));
    xip1E_13_uid241_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 11 => twoToMiSiYip_uid238_atan2Test_b(10)) & twoToMiSiYip_uid238_atan2Test_b));
    xip1E_13_uid241_atan2Test_combproc: PROCESS (xip1E_13_uid241_atan2Test_a, xip1E_13_uid241_atan2Test_b, xip1E_13_uid241_atan2Test_s)
    BEGIN
        IF (xip1E_13_uid241_atan2Test_s = "1") THEN
            xip1E_13_uid241_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid241_atan2Test_a) + SIGNED(xip1E_13_uid241_atan2Test_b));
        ELSE
            xip1E_13_uid241_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid241_atan2Test_a) - SIGNED(xip1E_13_uid241_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_13_uid241_atan2Test_q <= xip1E_13_uid241_atan2Test_o(34 downto 0);

    -- xip1_13_uid247_atan2Test(BITSELECT,246)@13
    xip1_13_uid247_atan2Test_in <= xip1E_13_uid241_atan2Test_q(32 downto 0);
    xip1_13_uid247_atan2Test_b <= xip1_13_uid247_atan2Test_in(32 downto 0);

    -- redist17_xip1_13_uid247_atan2Test_b_1(DELAY,596)
    redist17_xip1_13_uid247_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_13_uid247_atan2Test_b, xout => redist17_xip1_13_uid247_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xip1E_14_uid258_atan2Test(ADDSUB,257)@14
    xip1E_14_uid258_atan2Test_s <= invSignOfSelectionSignal_uid257_atan2Test_q;
    xip1E_14_uid258_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & redist17_xip1_13_uid247_atan2Test_b_1_q));
    xip1E_14_uid258_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 9 => twoToMiSiYip_uid255_atan2Test_b(8)) & twoToMiSiYip_uid255_atan2Test_b));
    xip1E_14_uid258_atan2Test_combproc: PROCESS (xip1E_14_uid258_atan2Test_a, xip1E_14_uid258_atan2Test_b, xip1E_14_uid258_atan2Test_s)
    BEGIN
        IF (xip1E_14_uid258_atan2Test_s = "1") THEN
            xip1E_14_uid258_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid258_atan2Test_a) + SIGNED(xip1E_14_uid258_atan2Test_b));
        ELSE
            xip1E_14_uid258_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid258_atan2Test_a) - SIGNED(xip1E_14_uid258_atan2Test_b));
        END IF;
    END PROCESS;
    xip1E_14_uid258_atan2Test_q <= xip1E_14_uid258_atan2Test_o(34 downto 0);

    -- xip1_14_uid264_atan2Test(BITSELECT,263)@14
    xip1_14_uid264_atan2Test_in <= xip1E_14_uid258_atan2Test_q(32 downto 0);
    xip1_14_uid264_atan2Test_b <= xip1_14_uid264_atan2Test_in(32 downto 0);

    -- twoToMiSiXip_uid271_atan2Test(BITSELECT,270)@14
    twoToMiSiXip_uid271_atan2Test_b <= xip1_14_uid264_atan2Test_b(32 downto 14);

    -- redist13_twoToMiSiXip_uid271_atan2Test_b_1(DELAY,592)
    redist13_twoToMiSiXip_uid271_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => twoToMiSiXip_uid271_atan2Test_b, xout => redist13_twoToMiSiXip_uid271_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- twoToMiSiXip_uid254_atan2Test(BITSELECT,253)@14
    twoToMiSiXip_uid254_atan2Test_b <= redist17_xip1_13_uid247_atan2Test_b_1_q(32 downto 13);

    -- yip1E_14_uid259_atan2Test(ADDSUB,258)@14
    yip1E_14_uid259_atan2Test_s <= xMSB_uid250_atan2Test_b;
    yip1E_14_uid259_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => redist16_yip1_13_uid248_atan2Test_b_1_q(21)) & redist16_yip1_13_uid248_atan2Test_b_1_q));
    yip1E_14_uid259_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & twoToMiSiXip_uid254_atan2Test_b));
    yip1E_14_uid259_atan2Test_combproc: PROCESS (yip1E_14_uid259_atan2Test_a, yip1E_14_uid259_atan2Test_b, yip1E_14_uid259_atan2Test_s)
    BEGIN
        IF (yip1E_14_uid259_atan2Test_s = "1") THEN
            yip1E_14_uid259_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid259_atan2Test_a) + SIGNED(yip1E_14_uid259_atan2Test_b));
        ELSE
            yip1E_14_uid259_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid259_atan2Test_a) - SIGNED(yip1E_14_uid259_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_14_uid259_atan2Test_q <= yip1E_14_uid259_atan2Test_o(22 downto 0);

    -- yip1_14_uid265_atan2Test(BITSELECT,264)@14
    yip1_14_uid265_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_14_uid259_atan2Test_q(20 downto 0));
    yip1_14_uid265_atan2Test_b <= STD_LOGIC_VECTOR(yip1_14_uid265_atan2Test_in(20 downto 0));

    -- redist14_yip1_14_uid265_atan2Test_b_1(DELAY,593)
    redist14_yip1_14_uid265_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 21, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_14_uid265_atan2Test_b, xout => redist14_yip1_14_uid265_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- yip1E_15_uid276_atan2Test(ADDSUB,275)@15
    yip1E_15_uid276_atan2Test_s <= xMSB_uid267_atan2Test_b;
    yip1E_15_uid276_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => redist14_yip1_14_uid265_atan2Test_b_1_q(20)) & redist14_yip1_14_uid265_atan2Test_b_1_q));
    yip1E_15_uid276_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & redist13_twoToMiSiXip_uid271_atan2Test_b_1_q));
    yip1E_15_uid276_atan2Test_combproc: PROCESS (yip1E_15_uid276_atan2Test_a, yip1E_15_uid276_atan2Test_b, yip1E_15_uid276_atan2Test_s)
    BEGIN
        IF (yip1E_15_uid276_atan2Test_s = "1") THEN
            yip1E_15_uid276_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid276_atan2Test_a) + SIGNED(yip1E_15_uid276_atan2Test_b));
        ELSE
            yip1E_15_uid276_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid276_atan2Test_a) - SIGNED(yip1E_15_uid276_atan2Test_b));
        END IF;
    END PROCESS;
    yip1E_15_uid276_atan2Test_q <= yip1E_15_uid276_atan2Test_o(21 downto 0);

    -- yip1_15_uid282_atan2Test(BITSELECT,281)@15
    yip1_15_uid282_atan2Test_in <= STD_LOGIC_VECTOR(yip1E_15_uid276_atan2Test_q(19 downto 0));
    yip1_15_uid282_atan2Test_b <= STD_LOGIC_VECTOR(yip1_15_uid282_atan2Test_in(19 downto 0));

    -- xMSB_uid284_atan2Test(BITSELECT,283)@15
    xMSB_uid284_atan2Test_b <= STD_LOGIC_VECTOR(yip1_15_uid282_atan2Test_b(19 downto 19));

    -- redist11_xMSB_uid284_atan2Test_b_1(DELAY,590)
    redist11_xMSB_uid284_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid284_atan2Test_b, xout => redist11_xMSB_uid284_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- invSignOfSelectionSignal_uid294_atan2Test(LOGICAL,293)@16
    invSignOfSelectionSignal_uid294_atan2Test_q <= not (redist11_xMSB_uid284_atan2Test_b_1_q);

    -- redist10_invSignOfSelectionSignal_uid294_atan2Test_q_1(DELAY,589)
    redist10_invSignOfSelectionSignal_uid294_atan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignOfSelectionSignal_uid294_atan2Test_q, xout => redist10_invSignOfSelectionSignal_uid294_atan2Test_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1(BITSELECT,553)
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(cstArcTan2Mi_15_uid290_atan2Test_q(40 downto 40));

    -- cstArcTan2Mi_15_uid290_atan2Test(CONSTANT,289)
    cstArcTan2Mi_15_uid290_atan2Test_q <= "01111111111111111111111111111111010101011";

    -- aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_b(BITJOIN,556)@16
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_b_q <= aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & cstArcTan2Mi_15_uid290_atan2Test_q;

    -- invSignOfSelectionSignal_uid277_atan2Test(LOGICAL,276)@15
    invSignOfSelectionSignal_uid277_atan2Test_q <= not (xMSB_uid267_atan2Test_b);

    -- aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1(BITSELECT,527)
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(cstArcTan2Mi_14_uid273_atan2Test_q(39 downto 39));

    -- cstArcTan2Mi_14_uid273_atan2Test(CONSTANT,272)
    cstArcTan2Mi_14_uid273_atan2Test_q <= "0111111111111111111111111111110101010101";

    -- aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_b(BITJOIN,531)@15
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_b_q <= aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & cstArcTan2Mi_14_uid273_atan2Test_q;

    -- aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1(BITSELECT,502)
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(cstArcTan2Mi_13_uid256_atan2Test_q(38 downto 38));

    -- cstArcTan2Mi_13_uid256_atan2Test(CONSTANT,255)
    cstArcTan2Mi_13_uid256_atan2Test_q <= "011111111111111111111111111101010101011";

    -- aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_b(BITJOIN,507)@14
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_b_q <= aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & cstArcTan2Mi_13_uid256_atan2Test_q;

    -- aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1(BITSELECT,478)
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(cstArcTan2Mi_12_uid239_atan2Test_q(37 downto 37));

    -- cstArcTan2Mi_12_uid239_atan2Test(CONSTANT,238)
    cstArcTan2Mi_12_uid239_atan2Test_q <= "01111111111111111111111111010101010101";

    -- aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_b(BITJOIN,484)@13
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_b_q <= aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & cstArcTan2Mi_12_uid239_atan2Test_q;

    -- aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1(BITSELECT,455)
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(cstArcTan2Mi_11_uid222_atan2Test_q(36 downto 36));

    -- cstArcTan2Mi_11_uid222_atan2Test(CONSTANT,221)
    cstArcTan2Mi_11_uid222_atan2Test_q <= "0111111111111111111111110101010101011";

    -- aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_b(BITJOIN,462)@12
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_b_q <= aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & cstArcTan2Mi_11_uid222_atan2Test_q;

    -- aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1(BITSELECT,433)
    aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(cstArcTan2Mi_10_uid205_atan2Test_q(35 downto 35));

    -- cstArcTan2Mi_10_uid205_atan2Test(CONSTANT,204)
    cstArcTan2Mi_10_uid205_atan2Test_q <= "011111111111111111111101010101010101";

    -- aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_b(BITJOIN,441)@11
    aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_b_q <= aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & cstArcTan2Mi_10_uid205_atan2Test_q;

    -- aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1(BITSELECT,412)
    aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(cstArcTan2Mi_9_uid188_atan2Test_q(34 downto 34));

    -- cstArcTan2Mi_9_uid188_atan2Test(CONSTANT,187)
    cstArcTan2Mi_9_uid188_atan2Test_q <= "01111111111111111111010101010101011";

    -- aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_b(BITJOIN,421)@10
    aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_b_q <= aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & cstArcTan2Mi_9_uid188_atan2Test_q;

    -- cstArcTan2Mi_8_uid171_atan2Test(CONSTANT,170)
    cstArcTan2Mi_8_uid171_atan2Test_q <= "0111111111111111110101010101010110";

    -- cstArcTan2Mi_7_uid154_atan2Test(CONSTANT,153)
    cstArcTan2Mi_7_uid154_atan2Test_q <= "011111111111111101010101010101110";

    -- cstArcTan2Mi_6_uid133_atan2Test(CONSTANT,132)
    cstArcTan2Mi_6_uid133_atan2Test_q <= "01111111111111010101010101101111";

    -- cstArcTan2Mi_5_uid112_atan2Test(CONSTANT,111)
    cstArcTan2Mi_5_uid112_atan2Test_q <= "0111111111110101010101101110111";

    -- cstArcTan2Mi_4_uid93_atan2Test(CONSTANT,92)
    cstArcTan2Mi_4_uid93_atan2Test_q <= "011111111101010101101110110111";

    -- cstArcTan2Mi_3_uid74_atan2Test(CONSTANT,73)
    cstArcTan2Mi_3_uid74_atan2Test_q <= "01111111010101101110101001101";

    -- cstArcTan2Mi_2_uid55_atan2Test(CONSTANT,54)
    cstArcTan2Mi_2_uid55_atan2Test_q <= "0111110101101101110101111110";

    -- cstArcTan2Mi_1_uid36_atan2Test(CONSTANT,35)
    cstArcTan2Mi_1_uid36_atan2Test_q <= "011101101011000110011100001";

    -- cstArcTan2Mi_0_uid22_atan2Test(CONSTANT,21)
    cstArcTan2Mi_0_uid22_atan2Test_q <= "01100100100001111110110101";

    -- highBBits_uid26_atan2Test(BITSELECT,25)@2
    highBBits_uid26_atan2Test_b <= STD_LOGIC_VECTOR(cstArcTan2Mi_0_uid22_atan2Test_q(25 downto 25));

    -- lowRangeB_uid25_atan2Test(BITSELECT,24)@2
    lowRangeB_uid25_atan2Test_in <= cstArcTan2Mi_0_uid22_atan2Test_q(24 downto 0);
    lowRangeB_uid25_atan2Test_b <= lowRangeB_uid25_atan2Test_in(24 downto 0);

    -- aip1E_1_uid28_atan2Test(BITJOIN,27)@2
    aip1E_1_uid28_atan2Test_q <= STD_LOGIC_VECTOR((2 downto 1 => highBBits_uid26_atan2Test_b(0)) & highBBits_uid26_atan2Test_b) & lowRangeB_uid25_atan2Test_b;

    -- aip1E_uid31_atan2Test(BITSELECT,30)@2
    aip1E_uid31_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_1_uid28_atan2Test_q(26 downto 0));
    aip1E_uid31_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid31_atan2Test_in(26 downto 0));

    -- aip1E_2NA_uid46_atan2Test(BITJOIN,45)@2
    aip1E_2NA_uid46_atan2Test_q <= aip1E_uid31_atan2Test_b & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_2sumAHighB_uid47_atan2Test(ADDSUB,46)@2
    aip1E_2sumAHighB_uid47_atan2Test_s <= invSignOfSelectionSignal_uid37_atan2Test_q;
    aip1E_2sumAHighB_uid47_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => aip1E_2NA_uid46_atan2Test_q(28)) & aip1E_2NA_uid46_atan2Test_q));
    aip1E_2sumAHighB_uid47_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 27 => cstArcTan2Mi_1_uid36_atan2Test_q(26)) & cstArcTan2Mi_1_uid36_atan2Test_q));
    aip1E_2sumAHighB_uid47_atan2Test_combproc: PROCESS (aip1E_2sumAHighB_uid47_atan2Test_a, aip1E_2sumAHighB_uid47_atan2Test_b, aip1E_2sumAHighB_uid47_atan2Test_s)
    BEGIN
        IF (aip1E_2sumAHighB_uid47_atan2Test_s = "1") THEN
            aip1E_2sumAHighB_uid47_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2sumAHighB_uid47_atan2Test_a) + SIGNED(aip1E_2sumAHighB_uid47_atan2Test_b));
        ELSE
            aip1E_2sumAHighB_uid47_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2sumAHighB_uid47_atan2Test_a) - SIGNED(aip1E_2sumAHighB_uid47_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_2sumAHighB_uid47_atan2Test_q <= aip1E_2sumAHighB_uid47_atan2Test_o(29 downto 0);

    -- aip1E_uid50_atan2Test(BITSELECT,49)@2
    aip1E_uid50_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_2sumAHighB_uid47_atan2Test_q(28 downto 0));
    aip1E_uid50_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid50_atan2Test_in(28 downto 0));

    -- redist48_aip1E_uid50_atan2Test_b_1(DELAY,627)
    redist48_aip1E_uid50_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid50_atan2Test_b, xout => redist48_aip1E_uid50_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_3NA_uid65_atan2Test(BITJOIN,64)@3
    aip1E_3NA_uid65_atan2Test_q <= redist48_aip1E_uid50_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_3sumAHighB_uid66_atan2Test(ADDSUB,65)@3
    aip1E_3sumAHighB_uid66_atan2Test_s <= invSignOfSelectionSignal_uid56_atan2Test_q;
    aip1E_3sumAHighB_uid66_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 31 => aip1E_3NA_uid65_atan2Test_q(30)) & aip1E_3NA_uid65_atan2Test_q));
    aip1E_3sumAHighB_uid66_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 28 => cstArcTan2Mi_2_uid55_atan2Test_q(27)) & cstArcTan2Mi_2_uid55_atan2Test_q));
    aip1E_3sumAHighB_uid66_atan2Test_combproc: PROCESS (aip1E_3sumAHighB_uid66_atan2Test_a, aip1E_3sumAHighB_uid66_atan2Test_b, aip1E_3sumAHighB_uid66_atan2Test_s)
    BEGIN
        IF (aip1E_3sumAHighB_uid66_atan2Test_s = "1") THEN
            aip1E_3sumAHighB_uid66_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3sumAHighB_uid66_atan2Test_a) + SIGNED(aip1E_3sumAHighB_uid66_atan2Test_b));
        ELSE
            aip1E_3sumAHighB_uid66_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3sumAHighB_uid66_atan2Test_a) - SIGNED(aip1E_3sumAHighB_uid66_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_3sumAHighB_uid66_atan2Test_q <= aip1E_3sumAHighB_uid66_atan2Test_o(31 downto 0);

    -- aip1E_uid69_atan2Test(BITSELECT,68)@3
    aip1E_uid69_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_3sumAHighB_uid66_atan2Test_q(30 downto 0));
    aip1E_uid69_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid69_atan2Test_in(30 downto 0));

    -- redist45_aip1E_uid69_atan2Test_b_1(DELAY,624)
    redist45_aip1E_uid69_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 31, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid69_atan2Test_b, xout => redist45_aip1E_uid69_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_4NA_uid84_atan2Test(BITJOIN,83)@4
    aip1E_4NA_uid84_atan2Test_q <= redist45_aip1E_uid69_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_4sumAHighB_uid85_atan2Test(ADDSUB,84)@4
    aip1E_4sumAHighB_uid85_atan2Test_s <= invSignOfSelectionSignal_uid75_atan2Test_q;
    aip1E_4sumAHighB_uid85_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => aip1E_4NA_uid84_atan2Test_q(32)) & aip1E_4NA_uid84_atan2Test_q));
    aip1E_4sumAHighB_uid85_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 29 => cstArcTan2Mi_3_uid74_atan2Test_q(28)) & cstArcTan2Mi_3_uid74_atan2Test_q));
    aip1E_4sumAHighB_uid85_atan2Test_combproc: PROCESS (aip1E_4sumAHighB_uid85_atan2Test_a, aip1E_4sumAHighB_uid85_atan2Test_b, aip1E_4sumAHighB_uid85_atan2Test_s)
    BEGIN
        IF (aip1E_4sumAHighB_uid85_atan2Test_s = "1") THEN
            aip1E_4sumAHighB_uid85_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4sumAHighB_uid85_atan2Test_a) + SIGNED(aip1E_4sumAHighB_uid85_atan2Test_b));
        ELSE
            aip1E_4sumAHighB_uid85_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4sumAHighB_uid85_atan2Test_a) - SIGNED(aip1E_4sumAHighB_uid85_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_4sumAHighB_uid85_atan2Test_q <= aip1E_4sumAHighB_uid85_atan2Test_o(33 downto 0);

    -- aip1E_uid88_atan2Test(BITSELECT,87)@4
    aip1E_uid88_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_4sumAHighB_uid85_atan2Test_q(32 downto 0));
    aip1E_uid88_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid88_atan2Test_in(32 downto 0));

    -- redist42_aip1E_uid88_atan2Test_b_1(DELAY,621)
    redist42_aip1E_uid88_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid88_atan2Test_b, xout => redist42_aip1E_uid88_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_5NA_uid103_atan2Test(BITJOIN,102)@5
    aip1E_5NA_uid103_atan2Test_q <= redist42_aip1E_uid88_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_5sumAHighB_uid104_atan2Test(ADDSUB,103)@5
    aip1E_5sumAHighB_uid104_atan2Test_s <= invSignOfSelectionSignal_uid94_atan2Test_q;
    aip1E_5sumAHighB_uid104_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => aip1E_5NA_uid103_atan2Test_q(34)) & aip1E_5NA_uid103_atan2Test_q));
    aip1E_5sumAHighB_uid104_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 30 => cstArcTan2Mi_4_uid93_atan2Test_q(29)) & cstArcTan2Mi_4_uid93_atan2Test_q));
    aip1E_5sumAHighB_uid104_atan2Test_combproc: PROCESS (aip1E_5sumAHighB_uid104_atan2Test_a, aip1E_5sumAHighB_uid104_atan2Test_b, aip1E_5sumAHighB_uid104_atan2Test_s)
    BEGIN
        IF (aip1E_5sumAHighB_uid104_atan2Test_s = "1") THEN
            aip1E_5sumAHighB_uid104_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5sumAHighB_uid104_atan2Test_a) + SIGNED(aip1E_5sumAHighB_uid104_atan2Test_b));
        ELSE
            aip1E_5sumAHighB_uid104_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5sumAHighB_uid104_atan2Test_a) - SIGNED(aip1E_5sumAHighB_uid104_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_5sumAHighB_uid104_atan2Test_q <= aip1E_5sumAHighB_uid104_atan2Test_o(35 downto 0);

    -- aip1E_uid107_atan2Test(BITSELECT,106)@5
    aip1E_uid107_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_5sumAHighB_uid104_atan2Test_q(34 downto 0));
    aip1E_uid107_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid107_atan2Test_in(34 downto 0));

    -- redist39_aip1E_uid107_atan2Test_b_1(DELAY,618)
    redist39_aip1E_uid107_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 35, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid107_atan2Test_b, xout => redist39_aip1E_uid107_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_6NA_uid122_atan2Test(BITJOIN,121)@6
    aip1E_6NA_uid122_atan2Test_q <= redist39_aip1E_uid107_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_6sumAHighB_uid123_atan2Test(ADDSUB,122)@6
    aip1E_6sumAHighB_uid123_atan2Test_s <= invSignOfSelectionSignal_uid113_atan2Test_q;
    aip1E_6sumAHighB_uid123_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 37 => aip1E_6NA_uid122_atan2Test_q(36)) & aip1E_6NA_uid122_atan2Test_q));
    aip1E_6sumAHighB_uid123_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 31 => cstArcTan2Mi_5_uid112_atan2Test_q(30)) & cstArcTan2Mi_5_uid112_atan2Test_q));
    aip1E_6sumAHighB_uid123_atan2Test_combproc: PROCESS (aip1E_6sumAHighB_uid123_atan2Test_a, aip1E_6sumAHighB_uid123_atan2Test_b, aip1E_6sumAHighB_uid123_atan2Test_s)
    BEGIN
        IF (aip1E_6sumAHighB_uid123_atan2Test_s = "1") THEN
            aip1E_6sumAHighB_uid123_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6sumAHighB_uid123_atan2Test_a) + SIGNED(aip1E_6sumAHighB_uid123_atan2Test_b));
        ELSE
            aip1E_6sumAHighB_uid123_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6sumAHighB_uid123_atan2Test_a) - SIGNED(aip1E_6sumAHighB_uid123_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_6sumAHighB_uid123_atan2Test_q <= aip1E_6sumAHighB_uid123_atan2Test_o(37 downto 0);

    -- aip1E_uid126_atan2Test(BITSELECT,125)@6
    aip1E_uid126_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_6sumAHighB_uid123_atan2Test_q(36 downto 0));
    aip1E_uid126_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid126_atan2Test_in(36 downto 0));

    -- redist36_aip1E_uid126_atan2Test_b_1(DELAY,615)
    redist36_aip1E_uid126_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 37, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid126_atan2Test_b, xout => redist36_aip1E_uid126_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_7NA_uid143_atan2Test(BITJOIN,142)@7
    aip1E_7NA_uid143_atan2Test_q <= redist36_aip1E_uid126_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_7sumAHighB_uid144_atan2Test(ADDSUB,143)@7
    aip1E_7sumAHighB_uid144_atan2Test_s <= invSignOfSelectionSignal_uid134_atan2Test_q;
    aip1E_7sumAHighB_uid144_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => aip1E_7NA_uid143_atan2Test_q(38)) & aip1E_7NA_uid143_atan2Test_q));
    aip1E_7sumAHighB_uid144_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 32 => cstArcTan2Mi_6_uid133_atan2Test_q(31)) & cstArcTan2Mi_6_uid133_atan2Test_q));
    aip1E_7sumAHighB_uid144_atan2Test_combproc: PROCESS (aip1E_7sumAHighB_uid144_atan2Test_a, aip1E_7sumAHighB_uid144_atan2Test_b, aip1E_7sumAHighB_uid144_atan2Test_s)
    BEGIN
        IF (aip1E_7sumAHighB_uid144_atan2Test_s = "1") THEN
            aip1E_7sumAHighB_uid144_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7sumAHighB_uid144_atan2Test_a) + SIGNED(aip1E_7sumAHighB_uid144_atan2Test_b));
        ELSE
            aip1E_7sumAHighB_uid144_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7sumAHighB_uid144_atan2Test_a) - SIGNED(aip1E_7sumAHighB_uid144_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_7sumAHighB_uid144_atan2Test_q <= aip1E_7sumAHighB_uid144_atan2Test_o(39 downto 0);

    -- aip1E_uid147_atan2Test(BITSELECT,146)@7
    aip1E_uid147_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_7sumAHighB_uid144_atan2Test_q(38 downto 0));
    aip1E_uid147_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid147_atan2Test_in(38 downto 0));

    -- redist33_aip1E_uid147_atan2Test_b_1(DELAY,612)
    redist33_aip1E_uid147_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid147_atan2Test_b, xout => redist33_aip1E_uid147_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_8NA_uid160_atan2Test(BITJOIN,159)@8
    aip1E_8NA_uid160_atan2Test_q <= redist33_aip1E_uid147_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_8sumAHighB_uid161_atan2Test(ADDSUB,160)@8
    aip1E_8sumAHighB_uid161_atan2Test_s <= invSignOfSelectionSignal_uid155_atan2Test_q;
    aip1E_8sumAHighB_uid161_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 41 => aip1E_8NA_uid160_atan2Test_q(40)) & aip1E_8NA_uid160_atan2Test_q));
    aip1E_8sumAHighB_uid161_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 33 => cstArcTan2Mi_7_uid154_atan2Test_q(32)) & cstArcTan2Mi_7_uid154_atan2Test_q));
    aip1E_8sumAHighB_uid161_atan2Test_combproc: PROCESS (aip1E_8sumAHighB_uid161_atan2Test_a, aip1E_8sumAHighB_uid161_atan2Test_b, aip1E_8sumAHighB_uid161_atan2Test_s)
    BEGIN
        IF (aip1E_8sumAHighB_uid161_atan2Test_s = "1") THEN
            aip1E_8sumAHighB_uid161_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8sumAHighB_uid161_atan2Test_a) + SIGNED(aip1E_8sumAHighB_uid161_atan2Test_b));
        ELSE
            aip1E_8sumAHighB_uid161_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8sumAHighB_uid161_atan2Test_a) - SIGNED(aip1E_8sumAHighB_uid161_atan2Test_b));
        END IF;
    END PROCESS;
    aip1E_8sumAHighB_uid161_atan2Test_q <= aip1E_8sumAHighB_uid161_atan2Test_o(41 downto 0);

    -- aip1E_uid164_atan2Test(BITSELECT,163)@8
    aip1E_uid164_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_8sumAHighB_uid161_atan2Test_q(40 downto 0));
    aip1E_uid164_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid164_atan2Test_in(40 downto 0));

    -- redist30_aip1E_uid164_atan2Test_b_1(DELAY,609)
    redist30_aip1E_uid164_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 41, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid164_atan2Test_b, xout => redist30_aip1E_uid164_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_9NA_uid177_atan2Test(BITJOIN,176)@9
    aip1E_9NA_uid177_atan2Test_q <= redist30_aip1E_uid164_atan2Test_b_1_q & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_9sumAHighB_uid178_atan2Test(ADDSUB,177)@9 + 1
    aip1E_9sumAHighB_uid178_atan2Test_s <= invSignOfSelectionSignal_uid172_atan2Test_q;
    aip1E_9sumAHighB_uid178_atan2Test_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((44 downto 43 => aip1E_9NA_uid177_atan2Test_q(42)) & aip1E_9NA_uid177_atan2Test_q));
    aip1E_9sumAHighB_uid178_atan2Test_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((44 downto 34 => cstArcTan2Mi_8_uid171_atan2Test_q(33)) & cstArcTan2Mi_8_uid171_atan2Test_q));
    aip1E_9sumAHighB_uid178_atan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_9sumAHighB_uid178_atan2Test_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_9sumAHighB_uid178_atan2Test_s = "1") THEN
                    aip1E_9sumAHighB_uid178_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9sumAHighB_uid178_atan2Test_a) + SIGNED(aip1E_9sumAHighB_uid178_atan2Test_b));
                ELSE
                    aip1E_9sumAHighB_uid178_atan2Test_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9sumAHighB_uid178_atan2Test_a) - SIGNED(aip1E_9sumAHighB_uid178_atan2Test_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_9sumAHighB_uid178_atan2Test_q <= aip1E_9sumAHighB_uid178_atan2Test_o(43 downto 0);

    -- aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel0_1(BITSELECT,406)@10
    aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel0_1_b <= STD_LOGIC_VECTOR(aip1E_9sumAHighB_uid178_atan2Test_q(41 downto 0));

    -- aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_b(BITJOIN,407)@10
    aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_b_q <= aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel0_1_b & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_10sumAHighB_uid195_atan2Test_p1_of_2(ADDSUB,336)@10 + 1
    aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_s <= invSignOfSelectionSignal_uid189_atan2Test_q;
    aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_a <= STD_LOGIC_VECTOR("0" & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_b_q);
    aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_b <= STD_LOGIC_VECTOR("0" & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_b_q);
    aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_s = "1") THEN
                    aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_a) + UNSIGNED(aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_b));
                ELSE
                    aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_a) - UNSIGNED(aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_c(0) <= aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_o(44);
    aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_q <= aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_o(43 downto 0);

    -- aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,573)@11
    aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_q(41 downto 0));
    aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_q(43 downto 42));

    -- aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_b(BITJOIN,427)@11
    aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_b_q <= aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_11sumAHighB_uid212_atan2Test_p1_of_2(ADDSUB,347)@11 + 1
    aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_s <= invSignOfSelectionSignal_uid206_atan2Test_q;
    aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_a <= STD_LOGIC_VECTOR("0" & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_b_q);
    aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_b <= STD_LOGIC_VECTOR("0" & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_b_q);
    aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_s = "1") THEN
                    aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_a) + UNSIGNED(aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_b));
                ELSE
                    aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_a) - UNSIGNED(aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_c(0) <= aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_o(44);
    aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_q <= aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_o(43 downto 0);

    -- aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,574)@12
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_q(41 downto 0));
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_q(43 downto 42));

    -- aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_b(BITJOIN,449)@12
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_b_q <= aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_12sumAHighB_uid229_atan2Test_p1_of_2(ADDSUB,358)@12 + 1
    aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_s <= invSignOfSelectionSignal_uid223_atan2Test_q;
    aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_a <= STD_LOGIC_VECTOR("0" & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_b_q);
    aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_b <= STD_LOGIC_VECTOR("0" & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_b_q);
    aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_s = "1") THEN
                    aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_a) + UNSIGNED(aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_b));
                ELSE
                    aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_a) - UNSIGNED(aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_c(0) <= aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_o(44);
    aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_q <= aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_o(43 downto 0);

    -- aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,575)@13
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_q(41 downto 0));
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_q(43 downto 42));

    -- aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_b(BITJOIN,472)@13
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_b_q <= aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_13sumAHighB_uid246_atan2Test_p1_of_2(ADDSUB,369)@13 + 1
    aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_s <= invSignOfSelectionSignal_uid240_atan2Test_q;
    aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_a <= STD_LOGIC_VECTOR("0" & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_b_q);
    aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_b <= STD_LOGIC_VECTOR("0" & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_b_q);
    aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_s = "1") THEN
                    aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_a) + UNSIGNED(aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_b));
                ELSE
                    aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_a) - UNSIGNED(aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_c(0) <= aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_o(44);
    aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_q <= aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_o(43 downto 0);

    -- aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,576)@14
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_q(41 downto 0));
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_q(43 downto 42));

    -- aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_b(BITJOIN,496)@14
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_b_q <= aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_14sumAHighB_uid263_atan2Test_p1_of_2(ADDSUB,380)@14 + 1
    aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_s <= invSignOfSelectionSignal_uid257_atan2Test_q;
    aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_a <= STD_LOGIC_VECTOR("0" & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_b_q);
    aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_b <= STD_LOGIC_VECTOR("0" & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_b_q);
    aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_s = "1") THEN
                    aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_a) + UNSIGNED(aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_b));
                ELSE
                    aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_a) - UNSIGNED(aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_c(0) <= aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_o(44);
    aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_q <= aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_o(43 downto 0);

    -- aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,577)@15
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_q(41 downto 0));
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_q(43 downto 42));

    -- aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_b(BITJOIN,521)@15
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_b_q <= aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_15sumAHighB_uid280_atan2Test_p1_of_2(ADDSUB,391)@15 + 1
    aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_s <= invSignOfSelectionSignal_uid277_atan2Test_q;
    aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_a <= STD_LOGIC_VECTOR("0" & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_b_q);
    aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_b <= STD_LOGIC_VECTOR("0" & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_b_q);
    aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_s = "1") THEN
                    aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_a) + UNSIGNED(aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_b));
                ELSE
                    aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_a) - UNSIGNED(aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_c(0) <= aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_o(44);
    aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_q <= aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_o(43 downto 0);

    -- aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,578)@16
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_q(41 downto 0));
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_q(43 downto 42));

    -- aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_b(BITJOIN,547)@16
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_b_q <= aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_b & aip1E_2CostZeroPaddingA_uid45_atan2Test_q;

    -- aip1E_16sumAHighB_uid297_atan2Test_p1_of_2(ADDSUB,402)@16 + 1
    aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_s <= invSignOfSelectionSignal_uid294_atan2Test_q;
    aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_a <= STD_LOGIC_VECTOR("0" & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_b_q);
    aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_b <= STD_LOGIC_VECTOR("0" & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_b_q);
    aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_s = "1") THEN
                    aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_a) + UNSIGNED(aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_b));
                ELSE
                    aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_a) - UNSIGNED(aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_c(0) <= aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_o(44);
    aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_q <= aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_o(43 downto 0);

    -- aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_c(BITJOIN,571)@17
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_c_q <= aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_tessel0_1_b;

    -- redist12_invSignOfSelectionSignal_uid277_atan2Test_q_1(DELAY,591)
    redist12_invSignOfSelectionSignal_uid277_atan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignOfSelectionSignal_uid277_atan2Test_q, xout => redist12_invSignOfSelectionSignal_uid277_atan2Test_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_c(BITJOIN,544)@16
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_c_q <= aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_tessel0_1_b;

    -- redist15_invSignOfSelectionSignal_uid257_atan2Test_q_1(DELAY,594)
    redist15_invSignOfSelectionSignal_uid257_atan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignOfSelectionSignal_uid257_atan2Test_q, xout => redist15_invSignOfSelectionSignal_uid257_atan2Test_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_c(BITJOIN,518)@15
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_c_q <= aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_tessel0_1_b;

    -- redist18_invSignOfSelectionSignal_uid240_atan2Test_q_1(DELAY,597)
    redist18_invSignOfSelectionSignal_uid240_atan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignOfSelectionSignal_uid240_atan2Test_q, xout => redist18_invSignOfSelectionSignal_uid240_atan2Test_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_c(BITJOIN,493)@14
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_c_q <= aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_tessel0_1_b;

    -- redist21_invSignOfSelectionSignal_uid223_atan2Test_q_1(DELAY,600)
    redist21_invSignOfSelectionSignal_uid223_atan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignOfSelectionSignal_uid223_atan2Test_q, xout => redist21_invSignOfSelectionSignal_uid223_atan2Test_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_c(BITJOIN,469)@13
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_c_q <= aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_tessel0_1_b;

    -- redist24_invSignOfSelectionSignal_uid206_atan2Test_q_1(DELAY,603)
    redist24_invSignOfSelectionSignal_uid206_atan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignOfSelectionSignal_uid206_atan2Test_q, xout => redist24_invSignOfSelectionSignal_uid206_atan2Test_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_c(BITJOIN,446)@12
    aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_c_q <= aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_tessel0_1_b;

    -- redist27_invSignOfSelectionSignal_uid189_atan2Test_q_1(DELAY,606)
    redist27_invSignOfSelectionSignal_uid189_atan2Test_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignOfSelectionSignal_uid189_atan2Test_q, xout => redist27_invSignOfSelectionSignal_uid189_atan2Test_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_c(BITJOIN,424)@11
    aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_c_q <= aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_tessel0_1_b;

    -- aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_0(BITSELECT,408)@10
    aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(aip1E_9sumAHighB_uid178_atan2Test_q(42 downto 42));

    -- redist6_aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_1_b_1(DELAY,585)
    redist6_aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_1_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_0_b, xout => redist6_aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_1_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_c(BITJOIN,410)@11
    aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_c_q <= redist6_aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_1_b_1_q & redist6_aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_tessel1_1_b_1_q;

    -- aip1E_10sumAHighB_uid195_atan2Test_p2_of_2(ADDSUB,337)@11 + 1
    aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_s <= redist27_invSignOfSelectionSignal_uid189_atan2Test_q_1_q;
    aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_cin <= aip1E_10sumAHighB_uid195_atan2Test_p1_of_2_c;
    aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 2 => aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_c_q(1)) & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_a_BitJoin_for_c_q) & redist27_invSignOfSelectionSignal_uid189_atan2Test_q_1_q(0));
    aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 2 => aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_c_q(1)) & aip1E_10sumAHighB_uid195_atan2Test_BitSelect_for_b_BitJoin_for_c_q) & aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_cin(0));
    aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_s = "1") THEN
                    aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_a) + SIGNED(aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_b));
                ELSE
                    aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_a) - SIGNED(aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_q <= aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_o(2 downto 1);

    -- aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel1_1(BITSELECT,429)@12
    aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(aip1E_10sumAHighB_uid195_atan2Test_p2_of_2_q(0 downto 0));

    -- redist5_aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,584)
    redist5_aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist5_aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_c(BITJOIN,431)@12
    aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_c_q <= aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel1_1_b & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel1_1_b & redist5_aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- aip1E_11sumAHighB_uid212_atan2Test_p2_of_2(ADDSUB,348)@12 + 1
    aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_s <= redist24_invSignOfSelectionSignal_uid206_atan2Test_q_1_q;
    aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_cin <= aip1E_11sumAHighB_uid212_atan2Test_p1_of_2_c;
    aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_c_q(3)) & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_a_BitJoin_for_c_q) & redist24_invSignOfSelectionSignal_uid206_atan2Test_q_1_q(0));
    aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_c_q(3)) & aip1E_11sumAHighB_uid212_atan2Test_BitSelect_for_b_BitJoin_for_c_q) & aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_cin(0));
    aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_s = "1") THEN
                    aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_a) + SIGNED(aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_b));
                ELSE
                    aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_a) - SIGNED(aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_q <= aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_o(4 downto 1);

    -- aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel1_2(BITSELECT,452)@13
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel1_2_b <= STD_LOGIC_VECTOR(aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_q(2 downto 2));

    -- aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel1_1(BITSELECT,451)@13
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(aip1E_11sumAHighB_uid212_atan2Test_p2_of_2_q(2 downto 0));

    -- redist4_aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,583)
    redist4_aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist4_aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_c(BITJOIN,453)@13
    aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_c_q <= aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel1_2_b & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel1_1_b & redist4_aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- aip1E_12sumAHighB_uid229_atan2Test_p2_of_2(ADDSUB,359)@13 + 1
    aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_s <= redist21_invSignOfSelectionSignal_uid223_atan2Test_q_1_q;
    aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_cin <= aip1E_12sumAHighB_uid229_atan2Test_p1_of_2_c;
    aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_c_q(5)) & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_a_BitJoin_for_c_q) & redist21_invSignOfSelectionSignal_uid223_atan2Test_q_1_q(0));
    aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_c_q(5)) & aip1E_12sumAHighB_uid229_atan2Test_BitSelect_for_b_BitJoin_for_c_q) & aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_cin(0));
    aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_s = "1") THEN
                    aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_a) + SIGNED(aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_b));
                ELSE
                    aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_a) - SIGNED(aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_q <= aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_o(6 downto 1);

    -- aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel1_2(BITSELECT,475)@14
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel1_2_b <= STD_LOGIC_VECTOR(aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_q(4 downto 4));

    -- aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel1_1(BITSELECT,474)@14
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(aip1E_12sumAHighB_uid229_atan2Test_p2_of_2_q(4 downto 0));

    -- redist3_aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,582)
    redist3_aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist3_aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_c(BITJOIN,476)@14
    aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_c_q <= aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel1_2_b & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel1_1_b & redist3_aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- aip1E_13sumAHighB_uid246_atan2Test_p2_of_2(ADDSUB,370)@14 + 1
    aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_s <= redist18_invSignOfSelectionSignal_uid240_atan2Test_q_1_q;
    aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_cin <= aip1E_13sumAHighB_uid246_atan2Test_p1_of_2_c;
    aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((8 downto 8 => aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_c_q(7)) & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_a_BitJoin_for_c_q) & redist18_invSignOfSelectionSignal_uid240_atan2Test_q_1_q(0));
    aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((8 downto 8 => aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_c_q(7)) & aip1E_13sumAHighB_uid246_atan2Test_BitSelect_for_b_BitJoin_for_c_q) & aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_cin(0));
    aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_s = "1") THEN
                    aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_a) + SIGNED(aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_b));
                ELSE
                    aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_a) - SIGNED(aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_q <= aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_o(8 downto 1);

    -- aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel1_2(BITSELECT,499)@15
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel1_2_b <= STD_LOGIC_VECTOR(aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_q(6 downto 6));

    -- aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel1_1(BITSELECT,498)@15
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(aip1E_13sumAHighB_uid246_atan2Test_p2_of_2_q(6 downto 0));

    -- redist2_aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,581)
    redist2_aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist2_aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_c(BITJOIN,500)@15
    aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_c_q <= aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel1_2_b & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel1_1_b & redist2_aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- aip1E_14sumAHighB_uid263_atan2Test_p2_of_2(ADDSUB,381)@15 + 1
    aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_s <= redist15_invSignOfSelectionSignal_uid257_atan2Test_q_1_q;
    aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_cin <= aip1E_14sumAHighB_uid263_atan2Test_p1_of_2_c;
    aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_c_q(9)) & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_a_BitJoin_for_c_q) & redist15_invSignOfSelectionSignal_uid257_atan2Test_q_1_q(0));
    aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_c_q(9)) & aip1E_14sumAHighB_uid263_atan2Test_BitSelect_for_b_BitJoin_for_c_q) & aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_cin(0));
    aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_s = "1") THEN
                    aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_a) + SIGNED(aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_b));
                ELSE
                    aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_a) - SIGNED(aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_q <= aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_o(10 downto 1);

    -- aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel1_2(BITSELECT,524)@16
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel1_2_b <= STD_LOGIC_VECTOR(aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_q(8 downto 8));

    -- aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel1_1(BITSELECT,523)@16
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(aip1E_14sumAHighB_uid263_atan2Test_p2_of_2_q(8 downto 0));

    -- redist1_aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,580)
    redist1_aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist1_aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_c(BITJOIN,525)@16
    aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_c_q <= aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel1_2_b & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel1_1_b & redist1_aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- aip1E_15sumAHighB_uid280_atan2Test_p2_of_2(ADDSUB,392)@16 + 1
    aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_s <= redist12_invSignOfSelectionSignal_uid277_atan2Test_q_1_q;
    aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_cin <= aip1E_15sumAHighB_uid280_atan2Test_p1_of_2_c;
    aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_c_q(11)) & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_a_BitJoin_for_c_q) & redist12_invSignOfSelectionSignal_uid277_atan2Test_q_1_q(0));
    aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_c_q(11)) & aip1E_15sumAHighB_uid280_atan2Test_BitSelect_for_b_BitJoin_for_c_q) & aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_cin(0));
    aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_s = "1") THEN
                    aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_a) + SIGNED(aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_b));
                ELSE
                    aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_a) - SIGNED(aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_q <= aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_o(12 downto 1);

    -- aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel1_2(BITSELECT,550)@17
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel1_2_b <= STD_LOGIC_VECTOR(aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_q(10 downto 10));

    -- aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel1_1(BITSELECT,549)@17
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(aip1E_15sumAHighB_uid280_atan2Test_p2_of_2_q(10 downto 0));

    -- redist0_aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,579)
    redist0_aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c, xout => redist0_aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_c(BITJOIN,551)@17
    aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_c_q <= aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel1_2_b & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel1_1_b & redist0_aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;

    -- aip1E_16sumAHighB_uid297_atan2Test_p2_of_2(ADDSUB,403)@17 + 1
    aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_s <= redist10_invSignOfSelectionSignal_uid294_atan2Test_q_1_q;
    aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_cin <= aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_c;
    aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_c_q(13)) & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_a_BitJoin_for_c_q) & redist10_invSignOfSelectionSignal_uid294_atan2Test_q_1_q(0));
    aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_c_q(13)) & aip1E_16sumAHighB_uid297_atan2Test_BitSelect_for_b_BitJoin_for_c_q) & aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_cin(0));
    aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                IF (aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_s = "1") THEN
                    aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_a) + SIGNED(aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_b));
                ELSE
                    aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_a) - SIGNED(aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_q <= aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_o(14 downto 1);

    -- redist8_aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_q_1(DELAY,587)
    redist8_aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_q_1 : dspba_delay
    GENERIC MAP ( width => 44, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_q, xout => redist8_aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- aip1E_16sumAHighB_uid297_atan2Test_BitJoin_for_q(BITJOIN,404)@18
    aip1E_16sumAHighB_uid297_atan2Test_BitJoin_for_q_q <= aip1E_16sumAHighB_uid297_atan2Test_p2_of_2_q & redist8_aip1E_16sumAHighB_uid297_atan2Test_p1_of_2_q_1_q;

    -- aip1E_uid300_atan2Test(BITSELECT,299)@18
    aip1E_uid300_atan2Test_in <= STD_LOGIC_VECTOR(aip1E_16sumAHighB_uid297_atan2Test_BitJoin_for_q_q(56 downto 0));
    aip1E_uid300_atan2Test_b <= STD_LOGIC_VECTOR(aip1E_uid300_atan2Test_in(56 downto 0));

    -- alphaPreRnd_uid301_atan2Test(BITSELECT,300)@18
    alphaPreRnd_uid301_atan2Test_b <= aip1E_uid300_atan2Test_b(56 downto 40);

    -- lowRangeA_uid305_atan2Test_merged_bit_select(BITSELECT,572)@18
    lowRangeA_uid305_atan2Test_merged_bit_select_b <= alphaPreRnd_uid301_atan2Test_b(0 downto 0);
    lowRangeA_uid305_atan2Test_merged_bit_select_c <= alphaPreRnd_uid301_atan2Test_b(16 downto 1);

    -- alphaPostRnd_uid308_atan2Test(BITJOIN,307)@18
    alphaPostRnd_uid308_atan2Test_q <= alphaPostRndhigh_uid307_atan2Test_q & lowRangeA_uid305_atan2Test_merged_bit_select_b;

    -- atanRes_uid309_atan2Test(BITSELECT,308)@18
    atanRes_uid309_atan2Test_in <= alphaPostRnd_uid308_atan2Test_q(16 downto 0);
    atanRes_uid309_atan2Test_b <= atanRes_uid309_atan2Test_in(16 downto 0);

    -- redist9_atanRes_uid309_atan2Test_b_1(DELAY,588)
    redist9_atanRes_uid309_atan2Test_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => atanRes_uid309_atan2Test_b, xout => redist9_atanRes_uid309_atan2Test_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- xNotZero_uid17_atan2Test(LOGICAL,16)@0 + 1
    xNotZero_uid17_atan2Test_qi <= "1" WHEN x /= "0000000000000000" ELSE "0";
    xNotZero_uid17_atan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xNotZero_uid17_atan2Test_qi, xout => xNotZero_uid17_atan2Test_q, ena => en(0), clk => clk, aclr => areset );

    -- redist51_xNotZero_uid17_atan2Test_q_19(DELAY,630)
    redist51_xNotZero_uid17_atan2Test_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC" )
    PORT MAP ( xin => xNotZero_uid17_atan2Test_q, xout => redist51_xNotZero_uid17_atan2Test_q_19_q, ena => en(0), clk => clk, aclr => areset );

    -- xZero_uid18_atan2Test(LOGICAL,17)@19
    xZero_uid18_atan2Test_q <= not (redist51_xNotZero_uid17_atan2Test_q_19_q);

    -- yNotZero_uid15_atan2Test(LOGICAL,14)@0 + 1
    yNotZero_uid15_atan2Test_qi <= "1" WHEN y /= "0000000000000000" ELSE "0";
    yNotZero_uid15_atan2Test_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yNotZero_uid15_atan2Test_qi, xout => yNotZero_uid15_atan2Test_q, ena => en(0), clk => clk, aclr => areset );

    -- redist52_yNotZero_uid15_atan2Test_q_19(DELAY,631)
    redist52_yNotZero_uid15_atan2Test_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC" )
    PORT MAP ( xin => yNotZero_uid15_atan2Test_q, xout => redist52_yNotZero_uid15_atan2Test_q_19_q, ena => en(0), clk => clk, aclr => areset );

    -- yZero_uid16_atan2Test(LOGICAL,15)@19
    yZero_uid16_atan2Test_q <= not (redist52_yNotZero_uid15_atan2Test_q_19_q);

    -- concXZeroYZero_uid316_atan2Test(BITJOIN,315)@19
    concXZeroYZero_uid316_atan2Test_q <= xZero_uid18_atan2Test_q & yZero_uid16_atan2Test_q;

    -- atanResPostExc_uid317_atan2Test(MUX,316)@19
    atanResPostExc_uid317_atan2Test_s <= concXZeroYZero_uid316_atan2Test_q;
    atanResPostExc_uid317_atan2Test_combproc: PROCESS (atanResPostExc_uid317_atan2Test_s, en, redist9_atanRes_uid309_atan2Test_b_1_q, cstZeroOutFormat_uid310_atan2Test_q, constPio2P2u_mergedSignalTM_uid314_atan2Test_q)
    BEGIN
        CASE (atanResPostExc_uid317_atan2Test_s) IS
            WHEN "00" => atanResPostExc_uid317_atan2Test_q <= redist9_atanRes_uid309_atan2Test_b_1_q;
            WHEN "01" => atanResPostExc_uid317_atan2Test_q <= cstZeroOutFormat_uid310_atan2Test_q;
            WHEN "10" => atanResPostExc_uid317_atan2Test_q <= constPio2P2u_mergedSignalTM_uid314_atan2Test_q;
            WHEN "11" => atanResPostExc_uid317_atan2Test_q <= cstZeroOutFormat_uid310_atan2Test_q;
            WHEN OTHERS => atanResPostExc_uid317_atan2Test_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- constantZeroOutFormat_uid321_atan2Test(CONSTANT,320)
    constantZeroOutFormat_uid321_atan2Test_q <= "00000000000000000";

    -- redist56_signX_uid7_atan2Test_b_19(DELAY,635)
    redist56_signX_uid7_atan2Test_b_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 19, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid7_atan2Test_b, xout => redist56_signX_uid7_atan2Test_b_19_q, ena => en(0), clk => clk, aclr => areset );

    -- redist55_signY_uid8_atan2Test_b_19(DELAY,634)
    redist55_signY_uid8_atan2Test_b_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 19, reset_kind => "ASYNC" )
    PORT MAP ( xin => signY_uid8_atan2Test_b, xout => redist55_signY_uid8_atan2Test_b_19_q, ena => en(0), clk => clk, aclr => areset );

    -- concSigns_uid318_atan2Test(BITJOIN,317)@19
    concSigns_uid318_atan2Test_q <= redist56_signX_uid7_atan2Test_b_19_q & redist55_signY_uid8_atan2Test_b_19_q;

    -- secondOperand_uid325_atan2Test(MUX,324)@19 + 1
    secondOperand_uid325_atan2Test_s <= concSigns_uid318_atan2Test_q;
    secondOperand_uid325_atan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            secondOperand_uid325_atan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (secondOperand_uid325_atan2Test_s) IS
                    WHEN "00" => secondOperand_uid325_atan2Test_q <= constantZeroOutFormat_uid321_atan2Test_q;
                    WHEN "01" => secondOperand_uid325_atan2Test_q <= atanResPostExc_uid317_atan2Test_q;
                    WHEN "10" => secondOperand_uid325_atan2Test_q <= atanResPostExc_uid317_atan2Test_q;
                    WHEN "11" => secondOperand_uid325_atan2Test_q <= constPi_uid320_atan2Test_q;
                    WHEN OTHERS => secondOperand_uid325_atan2Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- constPiP2u_uid319_atan2Test(CONSTANT,318)
    constPiP2u_uid319_atan2Test_q <= "11001001000100011";

    -- constantZeroOutFormatP2u_uid322_atan2Test(CONSTANT,321)
    constantZeroOutFormatP2u_uid322_atan2Test_q <= "00000000000000100";

    -- firstOperand_uid324_atan2Test(MUX,323)@19 + 1
    firstOperand_uid324_atan2Test_s <= concSigns_uid318_atan2Test_q;
    firstOperand_uid324_atan2Test_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            firstOperand_uid324_atan2Test_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (firstOperand_uid324_atan2Test_s) IS
                    WHEN "00" => firstOperand_uid324_atan2Test_q <= atanResPostExc_uid317_atan2Test_q;
                    WHEN "01" => firstOperand_uid324_atan2Test_q <= constantZeroOutFormatP2u_uid322_atan2Test_q;
                    WHEN "10" => firstOperand_uid324_atan2Test_q <= constPiP2u_uid319_atan2Test_q;
                    WHEN "11" => firstOperand_uid324_atan2Test_q <= atanResPostExc_uid317_atan2Test_q;
                    WHEN OTHERS => firstOperand_uid324_atan2Test_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- outResExtended_uid326_atan2Test(SUB,325)@20
    outResExtended_uid326_atan2Test_a <= STD_LOGIC_VECTOR("0" & firstOperand_uid324_atan2Test_q);
    outResExtended_uid326_atan2Test_b <= STD_LOGIC_VECTOR("0" & secondOperand_uid325_atan2Test_q);
    outResExtended_uid326_atan2Test_o <= STD_LOGIC_VECTOR(UNSIGNED(outResExtended_uid326_atan2Test_a) - UNSIGNED(outResExtended_uid326_atan2Test_b));
    outResExtended_uid326_atan2Test_q <= outResExtended_uid326_atan2Test_o(17 downto 0);

    -- atanResPostRR_uid327_atan2Test(BITSELECT,326)@20
    atanResPostRR_uid327_atan2Test_b <= STD_LOGIC_VECTOR(outResExtended_uid326_atan2Test_q(17 downto 2));

    -- xOut(GPOUT,4)@20
    q <= atanResPostRR_uid327_atan2Test_b;

END normal;

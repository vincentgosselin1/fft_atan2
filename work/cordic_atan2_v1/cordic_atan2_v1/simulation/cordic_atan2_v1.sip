set_global_assignment -entity "cordic_atan2_v1" -library "lib_cordic_atan2_v1" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "cordic_atan2_v1" -library "lib_cordic_atan2_v1" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "cordic_atan2_v1" -library "lib_cordic_atan2_v1" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_cordic_atan2_v1" -name SPD_FILE [file join $::quartus(sip_path) "../cordic_atan2_v1.spd"]
set_global_assignment -library "lib_cordic_atan2_v1" -name MISC_FILE [file join $::quartus(sip_path) "../../cordic_atan2_v1.qsys"]

set_global_assignment -library "lib_cordic_atan2_v1" -name MISC_FILE [file join $::quartus(sip_path) "cordic_atan2_v1.vhd"]
set_global_assignment -library "lib_cordic_atan2_v1" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library_package.vhd"]
set_global_assignment -library "lib_cordic_atan2_v1" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library.vhd"]
set_global_assignment -library "lib_cordic_atan2_v1" -name MISC_FILE [file join $::quartus(sip_path) "submodules/cordic_atan2_v1_CORDIC_0.vhd"]

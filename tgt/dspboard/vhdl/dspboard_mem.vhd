library ieee;
use ieee.std_logic_1164;
package dspboard_mem_pkg is
		constant dspcontproc_a_instruction_ram_INIT_00 : bit_vector(0 to 255) := X"101484443004174484243FF41004841433741374840430041714888430041654";
		constant dspcontproc_a_instruction_ram_INIT_01 : bit_vector(0 to 255) := X"300417C484A43FF4100484943324132484843004177484643FF4100484543014";
		constant dspcontproc_a_instruction_ram_INIT_02 : bit_vector(0 to 255) := X"85243FF410048514331413148504300417F484E43FF4100484D43344134484C4";
		constant dspcontproc_a_instruction_ram_INIT_03 : bit_vector(0 to 255) := X"100485943084108485843004189485643FF41004855433341334854430041824";
		constant dspcontproc_a_instruction_ram_INIT_04 : bit_vector(0 to 255) := X"3364136486043004197485E43FF4100485D43354135485C43004194485A43FF4";
		constant dspcontproc_a_instruction_ram_INIT_05 : bit_vector(0 to 255) := X"87941014875410148714101486D41014869410148654101486243FF410048614";
		constant dspcontproc_a_instruction_ram_INIT_06 : bit_vector(0 to 255) := X"1002880413348813887247008024100447008044003406408894101487D41014";
		constant dspcontproc_a_instruction_ram_INIT_07 : bit_vector(0 to 255) := X"0A2407E080440A2407B080240A2480840B3407608A040A24073080640A240700";
		constant dspcontproc_a_instruction_ram_INIT_08 : bit_vector(0 to 255) := X"0E6488318040101488208874091408808041101480340A240A23091208108014";
		constant dspcontproc_a_instruction_ram_INIT_09 : bit_vector(0 to 255) := X"000000000000000000000000099080040A24096080540A240930880410948854";
		constant dspcontproc_a_instruction_ram_INIT_0A : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_0B : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_0C : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_0D : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_0E : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_0F : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_10 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_11 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_12 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_13 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_14 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_15 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_16 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_17 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_18 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_19 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_1A : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_1B : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_1C : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_1D : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_1E : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_1F : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_20 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_21 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_22 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_23 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_24 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_25 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_26 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_27 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_28 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_29 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_2A : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_2B : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_2C : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_2D : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_2E : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_2F : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_30 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_31 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_32 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_33 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_34 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_35 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_36 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_37 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_38 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_39 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_3A : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_3B : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_3C : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_3D : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_3E : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_3F : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_00 : bit_vector(0 to 255) := X"1C731C71BBD24DEEEEEEEEEBAEBAEBAEBAEBAEBAEBAEBAEBAEBAEBAEBAEBAEBA";
		constant dspcontproc_a_instruction_ram_INITP_01 : bit_vector(0 to 255) := X"00000000000000000000000000000000000000000000000000071C7B32F12C07";
		constant dspcontproc_a_instruction_ram_INITP_02 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_03 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_04 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_05 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_06 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_07 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
end dspboard_mem_pkg;

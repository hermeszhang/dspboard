library ieee;
use ieee.std_logic_1164;
package dspboard_mem_pkg is
		constant dspcontproc_a_instruction_ram_INIT_00 : bit_vector(0 to 255) := X"120084403000144084203FF010008410310011008400300013C0888030001340";
		constant dspcontproc_a_instruction_ram_INIT_01 : bit_vector(0 to 255) := X"101085901010855010108510101084D010108490101084603FF0100084503200";
		constant dspcontproc_a_instruction_ram_INIT_02 : bit_vector(0 to 255) := X"101087901010875010108710101086D0101086901010865010108610101085D0";
		constant dspcontproc_a_instruction_ram_INIT_03 : bit_vector(0 to 255) := X"100010008010101003B0801010001000100010008010101003308890101087D0";
		constant dspcontproc_a_instruction_ram_INIT_04 : bit_vector(0 to 255) := X"8800116088403BE01EF088303DE01AD088200A20887009100430801010001000";
		constant dspcontproc_a_instruction_ram_INIT_05 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000500";
		constant dspcontproc_a_instruction_ram_INIT_06 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_07 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_08 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INIT_09 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
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
		constant dspcontproc_a_instruction_ram_INITP_00 : bit_vector(0 to 255) := X"000000000000000000000001EEBACC7AAE7AAE7BBBBBBBBBBBBBBBAEBAEBAEBA";
		constant dspcontproc_a_instruction_ram_INITP_01 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_02 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_03 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_04 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_05 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_06 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
		constant dspcontproc_a_instruction_ram_INITP_07 : bit_vector(0 to 255) := X"0000000000000000000000000000000000000000000000000000000000000000";
end dspboard_mem_pkg;

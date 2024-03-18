.text
	auipc s0, 0xFC10
	addi s1, s0, 0x004
	addi ra, zero, 0xf
	addi sp, zero, 8
	add gp, ra, sp 
	sw ra, 0(s1)
	lw t4, 0(s1)
	beq t4, ra, LABEL
	
	addi zero, zero, 0
	addi zero, zero, 0
	
	LABEL: 
	addi t6, ra, 0xff

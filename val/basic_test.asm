.data 
	potencia: .word 0
.text
main:
	#auipc s0, 0x0000fc10

	auipc s0, 0x0000fc10
	addi t1, zero, 1 	
	addi t2, zero, 0xff
	
	add t3, t1, t2
	slli t4, t1, 8
		
	sw t2, 0(s0)
	sw t2, 4(s0)

	lw t5, 4(s0)
	and ra, t5, t1
	and ra, t5, t1
	and ra, t5, t1
	and ra, t5, t1
	and ra, t5, t1
	sw s0, 8(s0)
	lw s1, 8(s0)
	sw s1, 12(s0)
		
	beq s1, s0, STE1
	
	add t5, t4,t3
	sw t5, 8(s0)
	or s9, t5, t5
	or s9, t5, t5
	STE1:
	addi s11, s11, 0xff
	jal ra, HERE
	addi t0, zero, 1
	sw t0 12(s0)
	addi t0, zero, 1
	addi t0, zero, 1
	addi t0, zero, 1
	addi t0, zero, 1
	addi t0, zero, 1
	EXIT:
	addi t0, t0, 1
	jal ra, EXIT
	
	HERE:
	addi t1, zero, 1
	jalr ra
	
	
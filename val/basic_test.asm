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
		
	
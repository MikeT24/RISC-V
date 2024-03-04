.data 
	potencia: .word 0
.text
main:
	#auipc s0, 0x0000fc10

	auipc s0, 0x0000fc10
	addi t1, zero, 1 	
	addi t2, zero, 2 	
	addi t3, zero, 3 	## n
	addi t4, zero, 4 	## n	
	addi t5, zero, 5	## i for cycle
	addi t6, zero, 0xff	## i for cycle	
	
	addi t0, zero, 0x10
	slli t0, t0, 8
	addi t0, t0, 1
	slli t0, t0, 16	
	
	sw t1, 0(t0)
	sw t2, 4(t0) 
	sw t3, 8(t0) 
	sw t4, 12(t0) 		
	sw t5, 16(t0) 	
	sw t6, 20(t0) 
	
	lw s1, 0(s0)	
	lw s2, 4(s0)	
	lw s3, 8(s0)	
	lw s4, 12(s0)	
	lw s5, 16(s0)	
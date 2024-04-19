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
	
	lw t5, 0(s0)
	
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

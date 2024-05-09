.data 
	vector: .word 17 18 19 20  
	row_0: .word 1 2 3 4  
	row_1: .word 5 6 7 8 
	row_2: .word 9 10 11 12 
	row_3: .word 13 14 15 16
	result: .word 0 0 0 0      
.text
main:
	#la s0, vector
	#la s1, row_0 #row_1 == row0 + (4<<2)
	#la s3, result
	#la s2, row_1
	#la s3, row_2
	#la s4, row_3
	auipc s0, 0x0000fc10
	addi s0, s0, 0
	auipc s1, 0x0000fc10
	addi s1, s1, 8
	auipc s3, 0x0000fc10
	addi s3, s3, 0x40
	
	addi t0, zero, 0 ## i
	addi t1, zero, 4 ## Value of both cycles, just appliable now because both are of value 4
	
compare2:
	blt t6, t1, for_loop2 ## t6 = j	
	jal zero, exit
	
for_loop2:
	slli s2, t6, 4 ## shift 4, in order to jump to row_2
	add s4, s1, s2 ## pointer to row_0, row_1, etc
	jal s11, compare ## not necesary as labels can be used, I'll add it as practice
	
return_for: 		
	slli s5, t6, 2 ## allign address to save row.
	add s7, s3, s5 ## get index of result
	sw t4, 0(s7)   ## row(j) = result
	addi t4, zero, 0
	addi t6, t6, 1 # j = j + 1
	addi t0, zero, 0
	jal zero, compare2
	
compare:
	blt t0, t1, for_loop1
	jalr zero, s11, 0 ## return to outside for
	##zero, compare2

for_loop1:
	slli t5, t0, 2 ##shift count for byte allignment
	add t2, t5, s0 ## Assign vector pointer
	add t3, t5, s4 ## Assign row_0 pointer
	lw a2, 0(t2) ## load vector a2 = vector
	lw a3, 0(t3) ## load row_0  a3 = row_0
	jal ra, product_function
	add t4, t4, a0 ## result = result + ProductFunction(V1, V2)
	addi t0, t0, 1 ## i = i + 1
	jal zero, compare
	
##product_function:
##	mul a0, a2, a3
##	jalr zero, ra, 0 #go back to ra
	
product_function: ##a2 *a3 
    li a0, 0
    li  a5, 0	#a5, 0 = result positive, 1 = result negative
    a2_neg:
        slt a6, a2, zero	#Check a2 is negative
        beq a6, zero, a3_neg
        xori a2, a2, -1
        addi a2, a2, 1	#a2 possitive
        xori a5, a5, 1	#Update negative flag
    a3_neg:
        slt a6, a3, zero        #Check a3 is negative
        beq a6, zero, check_lower
        xori, a3, a3, -1
        addi a3, a3, 1	#A3 possitive
        xori a5, a5, 1	#Update negative flag
    check_lower: 
        slt a6, a2, a3			#Check what value is lower
        beq a6, zero, multiply_for	#If a3 is lower jump to multiply
        #swap a2 and a3
        add a6, a2, zero
        add a7, a3, zero
        add a2, a7, zero
        add a3, a6, zero	
	multiply_for:
		beq a3, zero, multiply_end
		add a0, a2, a0
		addi a3, a3, -1
		jal, zero, multiply_for
	multiply_end:
        beq zero, a5, multiply_return       #Check negative flag
        xori a0, a0, -1
        addi a0, a0, 1            	#a0 is negative
    multiply_return:
	jalr zero, ra, 0 #go back to ra	
exit:
	addi zero, zero, 0
		

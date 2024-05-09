
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
	
	# UART BASE ADDRESSES	
	li sp, 0x7fffeffc ## UART BASE ADDRESS, 
	lui gp, 0xfffffff0 ## UART BASE ADDRESS
	
	# POPULATING TOP
	addi t3, s0, 0x50
	addi t6, zero, 1 	
	add t4, s0, zero # Pointer for loop

addi, t2, zero, 1 
li t0, 0xDE  # H
jal t6, uart_tx_send
add zero, zero, zero
add zero, zero, zero
jal ra, uart_tx_poll
add zero, zero, zero
add zero, zero, zero
li t0, 0xAD  # I
jal t6, uart_tx_send
add zero, zero, zero
add zero, zero, zero
jal ra, uart_tx_poll
add zero, zero, zero
add zero, zero, zero
add t0, zero, zero 
add t2, zero, zero 
add t6, zero, zero 
add s11, zero, zero 
addi t6, zero, 1 			
add ra, zero, zero	


population_loop:
	jal uart_rx_poll ## poll for uart rx value
	add zero, zero, zero
	add zero, zero, zero	
	lw t2, 16(gp) # t2 = rx_value  
	sw t2, 0(t4)  # store t2 in mem 
	addi t4, t4, 4 ## vector + 4 
	beq t4, t3, clean_reg # finished populating vector and 4 rows? 
	add zero, zero, zero
	add zero, zero, zero	
	jal population_loop # repeat until vector and rows are populated	
	add zero, zero, zero
	add zero, zero, zero		
uart_rx_poll:
	lw s11, 24(gp) # poll rx_flag
	bne s11, t6, uart_rx_poll # check if received, if not jump back
	add zero, zero, zero
	add zero, zero, zero	
	# if received: 
	sw t6, 12(gp)# clr rx flag
	sw zero, 12(gp)# clr rx flag
	jalr zero, ra, 0 #return to population loop	
	add zero, zero, zero
	add zero, zero, zero		
clean_reg:
	add s11, zero, zero
	add t6, zero, zero
	add t4, zero, zero
	add t2, zero, zero
	add t3, zero, zero			
compare2:
	blt t6, t1, for_loop2 ## t6 = j	
	add zero, zero, zero
	add zero, zero, zero	
	jal zero, exit
	add zero, zero, zero
	add zero, zero, zero
		
for_loop2:
	slli s2, t6, 4 ## shift 4, in order to jump to row_2
	add s4, s1, s2 ## pointer to row_0, row_1, etc
	jal s11, compare ## not necesary as labels can be used, I'll add it as practice
	add zero, zero, zero
	add zero, zero, zero
		
return_for: 		
	slli s5, t6, 2 ## allign address to save row.
	add s7, s3, s5 ## get index of result
	sw t4, 0(s7)   ## row(j) = result
	addi t4, zero, 0
	addi t6, t6, 1 # j = j + 1
	addi t0, zero, 0
	jal zero, compare2
	add zero, zero, zero
	add zero, zero, zero	
compare:
	blt t0, t1, for_loop1
	add zero, zero, zero
	add zero, zero, zero	
	jalr zero, s11, 0 ## return to outside for
	add zero, zero, zero
	add zero, zero, zero	
	##zero, compare2

for_loop1:
	slli t5, t0, 2 ##shift count for byte allignment
	add t2, t5, s0 ## Assign vector pointer
	add t3, t5, s4 ## Assign row_0 pointer
	lw a2, 0(t2) ## load vector a2 = vector
	lw a3, 0(t3) ## load row_0  a3 = row_0
	jal ra, product_function
	add zero, zero, zero
	add zero, zero, zero	
	add t4, t4, a0 ## result = result + ProductFunction(V1, V2)
	addi t0, t0, 1 ## i = i + 1
	jal zero, compare
	add zero, zero, zero
	add zero, zero, zero	
	
##product_function:
##	mul a0, a2, a3
##	jalr zero, ra, 0 #go back to ra
	
product_function: ##a2 *a3 
    li a0, 0
    li  a5, 0	#a5, 0 = result positive, 1 = result negative
    a2_neg:
        slt a6, a2, zero	#Check a2 is negative
        beq a6, zero, a3_neg
	add zero, zero, zero
	add zero, zero, zero        
        xori a2, a2, -1
        addi a2, a2, 1	#a2 possitive
        xori a5, a5, 1	#Update negative flag
    a3_neg:
        slt a6, a3, zero        #Check a3 is negative
        beq a6, zero, check_lower
	add zero, zero, zero
	add zero, zero, zero        
        xori, a3, a3, -1
        addi a3, a3, 1	#A3 possitive
        xori a5, a5, 1	#Update negative flag
    check_lower: 
        slt a6, a2, a3			#Check what value is lower
        beq a6, zero, multiply_for	#If a3 is lower jump to multiply
	add zero, zero, zero
	add zero, zero, zero        
        #swap a2 and a3
        add a6, a2, zero
        add a7, a3, zero
        add a2, a7, zero
        add a3, a6, zero	
	multiply_for:
		beq a3, zero, multiply_end
		add zero, zero, zero
		add zero, zero, zero		
		add a0, a2, a0
		addi a3, a3, -1
		jal, zero, multiply_for
		add zero, zero, zero
		add zero, zero, zero
	multiply_end:
        beq zero, a5, multiply_return       #Check negative flag
	add zero, zero, zero
	add zero, zero, zero        
        xori a0, a0, -1
        addi a0, a0, 1            	#a0 is negative
    multiply_return:
	jalr zero, ra, 0 #go back to ra	
	add zero, zero, zero
	add zero, zero, zero
	
exit:
	addi s4, s3, 0x10  
	add t6, zero, zero
send_result: 
	lw a0, 0(s3) # store result in a0
	addi, t2, zero, 1 
	srli t0, a0, 24
	jal t6, uart_tx_send
	add zero, zero, zero
	add zero, zero, zero	
	jal ra, uart_tx_poll
	add zero, zero, zero
	add zero, zero, zero	
	srli t0, a0, 16
	jal t6, uart_tx_send
	add zero, zero, zero
	add zero, zero, zero	
	jal ra, uart_tx_poll
	add zero, zero, zero
	add zero, zero, zero	
	srli t0, a0, 8
	jal t6, uart_tx_send
	add zero, zero, zero
	add zero, zero, zero	
	jal ra, uart_tx_poll
	add zero, zero, zero
	add zero, zero, zero	
	addi t0, a0, 0
	jal t6, uart_tx_send
	add zero, zero, zero
	add zero, zero, zero	
	jal ra, uart_tx_poll
	add zero, zero, zero
	add zero, zero, zero	
	addi s3, s3, 4 ##counter - mem shift
	beq s3, s4, final_loop
	add zero, zero, zero
	add zero, zero, zero	
	jal zero, send_result
	add zero, zero, zero
	add zero, zero, zero	


			
uart_tx_send: # send value in t0
	sw t0, 0(gp) # LOAD VALUE IN UART
	sw t2, 4(gp) # SEND 
	sw t2, 4(gp) # SEND
	sw zero, 4(gp)
	jalr t6
	add zero, zero, zero
	add zero, zero, zero	
	
uart_tx_poll: # TX POLL UART 
	lw s11, 20(gp)
	bne s11, t2, uart_tx_poll
	add zero, zero, zero
	add zero, zero, zero	
	sw t2, 8(gp) # clr tx flag
	sw zero, 8(gp) # clr tx flag
	jalr zero, ra, 0
	add zero, zero, zero
	add zero, zero, zero		
		
final_loop:
	add zero, zero, zero
	jal final_loop
	add zero, zero, zero
	add zero, zero, zero	
	
	

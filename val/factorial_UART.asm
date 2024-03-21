.data 

.text

main: 
## LOAD BASE ADDRESSES
lui s0, 0xfffffff0 ## UART BASE ADDRESS, 
li sp, 0x7fffeffc #SP POINTER IS NOT STORED IN HW
li s9, 0xffffffff
#li t0, 0x48  # H
li t0, 0xDE  # H
jal t6, uart_tx_send
jal ra, uart_tx_poll
li t0, 0xAD  # I
jal t6, uart_tx_send
jal ra, uart_tx_poll

addi zero, zero, 0 #debug

# start polling
START_POLL:
andi t2, s9, 0x1 # MASK
jal uart_rx_poll
lw a5, 16(s0) # a5 = rx_value 
jal factorial 

srli t0, a0, 24
jal t6, uart_tx_send
jal ra, uart_tx_poll
srli t0, a0, 16
jal t6, uart_tx_send
jal ra, uart_tx_poll
srli t0, a0, 8
jal t6, uart_tx_send
jal ra, uart_tx_poll
addi t0, a0, 0
jal t6, uart_tx_send
jal ra, uart_tx_poll

jal exit



uart_tx_send: # send value in t0
sw t0, 0(s0) # LOAD VALUE IN UART
andi t2, s9, 0x1 # MASK
sw t2, 4(s0) # SEND 
sw zero, 4(s0)
jalr t6

uart_tx_poll: # TX POLL UART 
lw s11, 20(s0)
bne s11, t2, uart_tx_poll
sw t2, 8(s0) # clr tx flag
sw zero, 8(s0) # clr tx flag
jalr zero, ra, 0

uart_rx_poll:
lw s11, 24(s0)
bne s11, t2, uart_rx_poll
sw t2, 12(s0)# clr rx flag
sw zero, 12(s0)# clr rx flag
jalr zero, ra, 0
# not made by me...
multiply: ##a2 *a3 
    li a4, 0
    li  t2, 0	#t2, 0 = result positive, 1 = result negative
    a2_neg:
        slt t0, a2, zero	#Check a2 is negative
        beq t0, zero, a3_neg
        xori a2, a2, -1
        addi a2, a2, 1	#a2 possitive
        xori t2, t2, 1	#Update negative flag
    a3_neg:
        slt t0, a3, zero        #Check a3 is negative
        beq t0, zero, check_lower
        xori, a3, a3, -1
        addi a3, a3, 1	#A3 possitive
        xori t2, t2, 1	#Update negative flag
    check_lower: 
        slt t0, a2, a3			#Check what value is lower
        beq t0, zero, multiply_for	#If a3 is lower jump to multiply
        #swap a2 and a3
        add t0, a2, zero
        add t1, a3, zero
        add a2, t1, zero
        add a3, t0, zero	
	multiply_for:
		beq a3, zero, multiply_end
		add a4, a2, a4
		addi a3, a3, -1
		jal, zero, multiply_for
	multiply_end:
        beq zero, t2, multiply_return       #Check negative flag
        xori a4, a4, -1
        addi a4, a4, 1            	#a4 is negative
    multiply_return:
    jalr zero, t5, 0

factorial: ##factorial(a5)
	slti t3, a5, 1 # if n < 1
	beq t3, zero, loop # Branch to Loop
	addi a0, zero, 1 # Loading 1
	jr ra # Return to the caller	
loop:	
	addi sp, sp,-8 # Decreasing the stack pointer
	sw ra, 4(sp) # Storing n
	sw a5, 0(sp) #  Storing the resturn address
	addi a5, a5, -1 # Decreasing n
	jal factorial # recursive function
	lw a5, 0(sp) # Loading values from stack
	lw ra, 4(sp) # Loading values from stack
	addi sp, sp, 8 # Increasing stack pointer
	## a0 * a5
	addi a2, a0, 0 ## move values from a0 and a5 to a2 and a3 
	addi a3, a5, 0
	jal t5, multiply
	addi a0, a4, 0
	#mul a0, a5, a0 # Multiplying n*Factorial(n-1)
	jr ra  # Return to the caller
exit:
addi zero, zero, 0
jal START_POLL


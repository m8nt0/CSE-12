totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty # totalIncome function
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	
# Start your coding from here!
# Initialize the sum and loop counter
    li t0, 0    # sum = 0
    #li t1, 0    # loopCounter = 0
    addi a0, a0, 4
    addi t3, a1, 0

totalIncome_loop:
    #allocate_from_memory jump to income instead of stock-name
    
    
    # Check if the loop counter has exceeded the number of records
    blez t3, totalIncome_exit
    
    #ADD FUNCTION IN HERE SOMEHOW
    
    addi t2, a0, 0
    addi a0, t2, 0
    # Load the pointer to the current income record
    
    addi sp, sp, -32
    #send over t0,t1 values to stack for posterity
    sd t0, 0(sp)

    sd t3, 8(sp)
    sd t2, 16(sp)
    sd ra, 24(sp)
    # Load the income value from the record
    jal income_from_record   # Call the function to get the income value
    
    ld t0, 0(sp)

    ld t3, 8(sp)
    ld t2, 16(sp)
    ld ra, 24(sp)
    #reset stack pointer to original level
    addi sp, sp, 32
    
    #-----
    add t0, t0, a0           # Add the income value to the sum

    addi a0, t2, 0

    # Increment the loop counter and continue the loop
    addi t3, t3, -1
    addi a0, a0, 8
    j totalIncome_loop

totalIncome_exit:
    # Return the sum in a0
    mv a0, t0
# End your  coding  here!
	
	ret
#######################end of nameOfMaxIncome_totalIncome###############################################

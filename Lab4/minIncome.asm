minIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for both a0, a1
	bnez a1, minIncome_fileNotEmpty # minIncome function
	li a0, 0
	ret

minIncome_fileNotEmpty:
	li t0, 10000        # initialize max income to 0
	#addi a0, a0, 4
	mv t2, a1        # initialize counter to 0
	
	addi t1, a0, 0
	#addi a0, t1, 0
loop2:

	beqz t2, done2   # if counter >= number of records, exit loop
	
	
        
        #--------- Load the pointer to the current income record
    
	addi t1, t1, 4
	    
        addi sp, sp, -40
        #send over t0,t1 values to stack for posterity
        sd t0, 0(sp)

        sd t1, 8(sp)
        sd t2, 16(sp)
        sd t3, 24(sp)
        sd ra, 32(sp)
	mv a0, t1
	#lw t3, 0(a0)     # load current record pointer into t3
	#addi a0, a0, 4
	jal income_from_record  # call income_from_record with current record pointer


	ld t0, 0(sp)

        ld t1, 8(sp)
        ld t2, 16(sp)
        ld t3, 24(sp)
        ld ra, 32(sp)
        #reset stack pointer to original level
        addi sp, sp, 40
	
	blt a0, t0, updateMin  # if income >= max income so far, jump to updateMax
	
	
	#-----
	#addi a0, t1, 0
	
	addi t2, t2, -1    # increment counter
	addi t1, t1, 4    # point to next record pointer
	j loop2
	
updateMin:


	mv t0, a0         # set max income to current income value


	addi t3, t1, -4
	#addi t1, t3, 0
	#addi a0, t1, 0
	
	addi t2, t2, -1    # increment counter
	addi t1, t1, 4    # point to next record pointer
	j loop2
	
done2:

	mv a0, t3      # return max income value in a0
	ret
#######################end of minIncome###############################################

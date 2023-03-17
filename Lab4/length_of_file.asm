length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here

li a0, 0
#if no student code provided, this function just returns 0 in a0
loop:
    lbu t0, 0(a1)      # load byte from file buffer
    beqz t0, end_loop  # if byte is null terminator, exit loop
    addi a1, a1, 1     # otherwise, increment buffer address
    addi a0, a0, 1     # and increment counter
    j loop             # continue loop

    # end of loop, return counter value in a0
end_loop:
    ret
#End your coding here
	
	#ret
#######################end of length_of_file###############################################	

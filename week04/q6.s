max:
    # Frame:    [$ra, $s0]   Every register stored on the stack
    # Uses:     [$s0, $a0, $a1, $v0]	EVery register you use
    # Clobbers: [$a0, $a1, $v0]
    #
    # Locals
    # 	int array[]	$a0
    #   int length	$a1
    #   first_element	$s0
    #	int max_so_far	$v0
    #
    # Structure:       
    #   max
    #   -> [prologue]
    #       -> body
    #           -> continue
    #   -> [epilogue]
max__prologue:
	begin
	push	$ra
	push	$s0
	
max__body:
	
	lw	$s0, ($a0) 	# int first_element = array[0];
	
	bgt	$a1, 1, max__continue	# if (length == 1)

	# BASE CASE
	move	$v0, $s0		# return first_element
	b	max__epilogue

max__continue:

	add	$a0, $a0, 4		# $a0 = &array[1]
	sub	$a1, $a1, 1		# length - 1
	jal	max			#  max(&array[1], length - 1);
	# max_so_far in $v0

	bgt	$v0, $s0, max__epilogue	# if (max_so_far > first_element) return max_so_far;
	move	$v0, $s0		# return first_element
	

max__epilogue:

	pop	$s0
	pop	$ra
	end

	jr	$ra
main:
main__prologue:
	push	$ra

main__body:
	la	$a0, array
	li	$a1, 10
	jal	max			# result = max(array, 10)

	move	$a0, $v0
	li	$v0, 1			# syscall 1: print_int
	syscall				# printf("%d", result)

	li	$a0, '\n'
	li	$v0, 11			# syscall 11: print_char
	syscall				# printf("%c", '\n');

	li	$v0, 0

main__epilogue:
	pop	$ra
	jr	$ra			# return 0;


.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1

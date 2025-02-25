

main:
	# i $t0
	# j $t1

print_row_loop_init:
	li	$t0, 1		# i = 1

print_row_loop_cond:
	bgt	$t0, 10, print_row_loop_end

print_row_loop_body:

print_star_loop_init:
	li	$t1, 0	# int j = 0

print_star_loop_cond:
	bge	$t1, $t0, print_star_loop_end	
	
print_star_loop_body:
	li	$v0, 11		#printf("*");
	li	$a0, '*'
	syscall

print_star_loop_inc:
	add	$t1, $t1, 1	# j++

	b	print_star_loop_cond

print_star_loop_end:

	li	$v0, 11		# printf("\n");
	li	$a0, '\n'
	syscall

print_row_loop_inc:
	add	$t0, $t0, 1	# i++;
	b	print_row_loop_cond

print_row_loop_end:

	li	$v0, 0		# return 0;
	jr	$ra




main:

loop_init:
	li	$t0, 24		# int x = 24;
loop_cond:
	bge	$t0, 42, loop_end

loop_body:
	li	$v0, 1		# printf("%d\n", x);
	move	$a0, $t0
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

	
loop_inc:
	add	$t0, $t0, 3	# x +=  3
	b	loop_cond
loop_end:
	
	li	$v0, 0		# return 0
	jr	$ra

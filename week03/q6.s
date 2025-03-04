N_SIZE=10

	.text
	# $t0	i
main:

while_init:
	li	$t0, 0		# i = 0

while_cond:
	bge	$t0, N_SIZE, while_end
while_body:
	#  &numbers[i]
	mul	$t1, $t0, 4		# i * 4
	lw	$t2, numbers($t1)	

	li	$v0, 1
	move	$a0, $t2
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall
	

while_inc:
	add	$t0, $t0, 1	#i++
	b	while_cond

while_end:

	jr	$ra

	

	.data
numbers:
	.word	0,1,2,3,4,5,6,7,8,9
	

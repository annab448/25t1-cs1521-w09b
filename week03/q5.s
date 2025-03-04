N_SIZE=10

	.text
	# $t0	i
main:

while_init:
	li	$t0, 0		# i = 0

while_cond:
	bge	$t0, N_SIZE, while_end
while_body:
	li	$v0, 5		# scanf("%d",
	syscall

	#  &numbers[i]
	la	$t1, numbers	# &numbers
	mul	$t2, $t0, 4	# i * 4	
	add	$t1, $t1, $t2
	
	sw	$v0, ($t1)

while_inc:
	add	$t0, $t0, 1	#i++
	b	while_cond

while_end:

	jr	$ra

	

	.data
numbers:
	.word	0,0,0,0,0,0,0,0,0,0
	

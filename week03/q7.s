
N_SIZE=10
	# $t0 = i
main:

	li	$t0, 0		# i = 0	
while_cond:
	bge	$t0, N_SIZE, while_end


	# get numbers[i]
	mul	$t1, $t0, 4		# i * 4
	lw	$t2, numbers($t1)	# numbers[i] = $t2

	bgez	$t2, while_inc	

	# numbers[i] += 42
	add	$t2, $t2, 42
	sw	$t2, numbers($t1)


while_inc:
	add	$t0, $t0, 1	# i++
	b	while_cond

while_end:
	jr	$ra

	.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9

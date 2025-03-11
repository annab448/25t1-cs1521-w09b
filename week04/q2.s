FLAG_COLS=12
FLAG_ROWS=6

	.text

main:

row_loop_init:
	li	$t0, 0		# row = 0

row_loop_cond:
	bge	$t0, FLAG_ROWS, row_loop_end	# while (row < FLAG_COLS)

row_loop_body:

	li	$t1, 0		# col = 0

col_loop_cond:
	bge	$t1, FLAG_COLS, col_loop_end

	# get flag[row][col]
	la	$t2, flag
	mul	$t3, $t0, FLAG_COLS	# row * N_COLS
	add	$t2, $t2, $t3		#
	add	$t2, $t2, $t1		# $t2 = &flag[row][col]

	lb	$a0, ($t2)		# $a0 = flag[row][col]
	li	$v0, 11
	syscall				# printf("%c", flag[row][col]);
		

	add	$t1, $t1, 1	# col++
	b	col_loop_cond
col_loop_end:

	li	$v0, 11		# printf("\n")
	li	$a0, '\n'
	syscall

row_loop_inc:

	add	$t0, $t0, 1	# row++
	b	row_loop_cond
row_loop_end:

	jr	$ra		# return;
	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'

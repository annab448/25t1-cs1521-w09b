
main:
	# $t0 s
	# $t1 length
	# $t2 *s

	la	$t0, string	# char *s = &string[0];
	li	$t1, 1

string_loop_cond:
	lb	$t2, ($t0)			# while (*s != '\0') {
	beq	$t2, $zero, string_loop_end

	add	$t1, $t1, 1			# length ++
	add	$t0, $t0, 1			# s ++

	b	string_loop_cond

string_loop_end:

	jr	$ra

	.data
string:
	.asciiz "...."
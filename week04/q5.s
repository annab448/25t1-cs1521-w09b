
main:
main__prologue:

main__body:

	la	$a0, main__start_msg		# printf("Calling change function\n")
	li	$v0, 4
	syscall

	li   $a0, 3
	li   $a1, 4
	la   $a2, M
	li   $a3, 2
	jal  change

	la	$a0, main__fin_msg
	li	$v0, 4
	syscall

main__epilogue:

	jr	$ra
change:
change__prologue:
change__body:
change__epilogue:


	.data
M:  .word 1, 2, 3, 4
	.word 3, 4, 5, 6
	.word 5, 6, 7, 8

main__start_msg:
	.asciiz "Calling change\n"

main__fin_msg:
	.asciiz "Done!\n"

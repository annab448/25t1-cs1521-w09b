

main:
main__prologue:

	begin
	push	$ra

main__body:

	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal sum4

	move	$a0, $v0
	li	$v0, 1
	syscall
	

main__epilogue:

	pop	$ra
	end

	jr	$ra

sum4:

sum4__prologue:
	# $a0 a
	# $a1 b
	# $a2 c	$s0
	# $a3 d	$s1
	# res1	#s2
	# res2

	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2
sum4__body:
	move	$s0, $a2
	move	$s1, $a3

	jal	sum2		# res1 = sum2(a,b)
	move	$s2, $v0

	move	$a0, $s0
	move	$a1, $s1
	jal	sum2		# res2 ($v0) = sum2(c, d)


	move	$a0, $s2
	move	$a1, $v0
	jal	sum2		# sum2(res1, res2)

sum4__epilogue:
	pop     $s2
        pop     $s1
        pop     $s0
        pop     $ra
        end


	jr	$ra

sum2:
	# $a0	x
	# $a1	y
sum2__prologue:

sum2__body:
	add	$v0, $a0, $a1		# x + y
sum2__epilogue:

	jr	$ra			# return;

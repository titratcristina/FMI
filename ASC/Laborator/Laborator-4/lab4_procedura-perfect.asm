# Sa se implementeze procedura perfect(x), x nr. nat., care sa returneze prin $v0 - 0 daca x e perfect
#										  - 1 daca x nu e perfect
# x = suma divizorilor d, d!=x

.data
	x: .word 6
.text
main:
	lw $t0, x
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	jal perfect
	
	addu $sp, $sp, 4
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10	# exit
	syscall
	
perfect:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	# $sp: ($fpv)(x)
	addi $fp, $sp, 4
	# $sp: ($fpv)$fp:(x)
	
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	# $sp: ($s0v)($fpv)$fp:(x)
	lw $s0, 0($fp)
	
	div $t0, $s0, 2
	li $t1, 1
	li $t2, 0
	
	loop:
		bgt $t1, $t0, exit
		rem $t3, $s0, $t1
		beqz $t3, eDivizor
	cont:
		addi $t1, $t1, 1
		j loop
		
	eDivizor:
		add $t2, $t2, $t1
		j cont
	exit:
		seq $v0, $s0, $t2 # se pune 1 sau 0 in $v0

		lw $s0, -8($fp)
		lw $fp, -4($fp)
		
		addu $sp, $sp, 8
		
		jr $ra



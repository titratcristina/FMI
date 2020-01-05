# Sa se implementeze o procedura care manipuleaza un vector recursiv
# si modifica fiecare element, adaugand 1

.data
	v: .word 3, 4, 5
	n: .word 3

.text
main:
	# push n pe stiva
	lw $t0, n
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	# push v pe stiva
	la $t0, v
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	jal modifica
	
	addu $sp, $sp, 8
	
	# exit
	li $v0, 10
	syscall
	
modifica:
	# push $fp pe stiva
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	
	addi $fp, $sp, 4
	
	# push $ra pe stiva
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	
	# push $s0 pe stiva
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	
	# push $s1 pe stiva
	subu $sp, $sp, 4
	sw $s1, 0($sp)
	
	# $sp: ($s1v)($s0v)($rav)($fvv) $fp:(v)(n)
	#	-16   -12    -8    -4        0	4
	
	lw $s0, 0($fp)	# *v
	lw $s1, 4($fp)	# n
	
	beqz $s1, exit
	
	# incrementarea unui element si salvarea sa
	lw $t0, 0($sp)
	addi $t0, $t0, 1
	sw $t0, 0($sp)
	
	addi $s0, $s0, 4
	addi $s1, $s1, -1
	
	subu $sp, $sp, 4
	sw $s1, 0($sp)
	
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	
	jal modifica
	
	addu $sp, $sp, 8

exit:
	lw $s1, -16($fp)
	lw $s0, -12($fp)
	lw $ra,	-8($fp)
	lw $fp, -4($fp)
	
	addu $sp, $sp, 16
	
	jr $ra

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
	
	lw $t0, n		# in $t0 retinem dimensiunea
	li $t1, 0		# $t1 este contorul obisnuit
	li $t2, 0		# $t2 creste din 4 in 4
	
	loop: 
		bge $t1, $t0, exit	# conditia de iesire, cand i >= n
		
		lw $a0, v($t2)		# se incarca in $a0 elementul curent v($t2) <=> v[i]
		li $v0, 1		# 1 - PRINT INT
		syscall
		
		la $a0, ' '
		li $v0, 11
		syscall
		
		addi $t2, $t2, 4	# $t2 crest4e din 4 in 4 pentru a accesa memoria
		addi $t1, $t1, 1	# $t1 se incrementeaza standard
		
		j loop			# se revine la loop
	
	exit:
		li $v0, 10		# codul pentru exit
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
	
	beqz $s1, exit_modifica
	
	# incrementarea unui element si salvarea sa
	lw $t0, 0($s0)
	addi $t0, $t0, 1
	sw $t0, 0($s0)
	
	# print element
	#lw $a0, 0($s0)
	#li $v0, 1
	#syscall
	
	# print space
	#la $a0, ' '
	#li $v0, 11
	#syscall
	
	addi $s0, $s0, 4
	subu $s1, $s1, 1
	
	subu $sp, $sp, 4
	sw $s1, 0($sp)
	
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	
	jal modifica
	
	addu $sp, $sp, 8

exit_modifica:
	lw $s1, -16($fp)
	lw $s0, -12($fp)
	lw $ra,	-8($fp)
	lw $fp, -4($fp)
	
	addu $sp, $sp, 16
	
	jr $ra

# Sa se parcurga recursiv un vector si pentru fiecare element
# sa se afiseze reprezentarea binara

.data
	v: .word 1, 2, 3
	n: .word 3
	ch: .byte ' '

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
	
	jal parcurgere
	
	addu $sp, $sp, 8
	
	# exit
	li $v0, 10
	syscall


parcurgere:
	 # $sp:(*v)(n)
	 subu $sp, $sp, 4
	 sw $fp, 0($sp)
	 
	 addi $fp, $sp, 4
	 
	 subu $sp, $sp, 4
	 sw $ra, 0($sp)
	 
	 subu $sp, $sp, 4
	 sw $s0, 0($sp)
	 
	 subu $sp, $sp, 4
	 sw $s1, 0($sp)
	 #$sp:($s1v)($s0v)($rav)($fpv)$fp:(*v)(n)
	 
	 lw $s0, 0($fp)		# *v
	 lw $s1, 4($fp)		# n
	 li $t0, 0		# i
	 
	 for:
	 	bge $t0, $s1, exit_parcurgere
	 	
	 	lw $t1, 0($s0)	# $t1 = v[i]
	 	
	 	subu $sp, $sp, 4
	 	sw $t1, 0($sp)
	 	jal afisare_binara
	 	addu $sp, $sp, 4

	 	li $a0, ' '
	 	li $v0, 11
	 	syscall
	 	
	 	addi $t0, $t0, 1
	 	addi $s0, $s0, 4
	 	
	 	j for
	 	
	 exit_parcurgere:
	 	lw $s1, -16($fp)
	 	lw $s0, -12($fp)
	 	lw $ra, -8($fp)
	 	lw $fp, -4($fp)
	 	
	 	addu $sp, $sp, 16
	 	
	 	jr $ra
afisare_binara:
	#addu $sp, $sp, 4
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	addi $fp, $sp, 4
	
	#addu $sp, $sp, 4
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	# $sp: ($s0v)($fpv)$fp:(x)
	
	lw $s0, 0($fp)
	
	while:
		#beqz $s0, exit_afisare_binara
		beq $s0, $zero, exit_afisare_binara
		
		rem $t0, $s0, 2
		
		move $a0, $t0
		li $v0, 1
		syscall
		
		div $s0, $s0, 2
		
		j while

	exit_afisare_binara:
		lw $s0, -8($fp)
		lw $fp, -4($fp)
		
		addu $sp, $sp, 8
		
		jr $ra

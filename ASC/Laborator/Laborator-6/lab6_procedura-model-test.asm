# Sa se implementeze procedura suma_cifrelor_para(z) care returneaza in registrul $v0 valoarea 1 daca
# suma cifrelor numarului natural nenul z este para, si 0 in caz contrar. Utilizand aceasta procedura, sa se
# implementeze procedura evalueaza(*v, n, x, y, z) care returneaza prin varful stivei si care apeleaza intern
# procedura suma_cifrelor_para, avand definitia:
# evalueaza(*v, n, x, y, z) ≔ ∑(1 − suma_cifrelor_para(v[i])) * (v[i] mod x + (y − [z/3] + i)^3)


evalueaza:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	addi $fp, $sp, 4
	# $sp:($fpv) $fp:(*v)(n)(x)(y)(z)
	
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	# $sp:($rav)($fpv) $fp:(*v)(n)(x)(y)(z)
	
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	
	subu $sp, $sp, 4
	sw $s1, 0($sp)
	
	subu $sp, $sp, 4
	sw $s2, 0($sp)
	
	subu $sp, $sp, 4
	sw $s3, 0($sp)
	
	subu $sp, $sp, 4
	sw $s4, 0($sp)
	
	lw $s0, 0($fp) 		# *v
	lw $s1, 4($fp)		# n
	lw $s2, 8($fp) 		# x
	lw $s3, 12($fp) 	# y
	lw $s4, 16($fp) 	# z
	
	div $t0, $s4, 3 	# $t0=[z/3]
	
	li $t1,0
	
	for: 
		bge $t1, $s1, exit_evalueaza
		
		lw $t2, 0($s0)	# $t2=v[i]
		
		subu $sp, $sp, 4
		sw $t2, 0($sp)
		
		jal suma_cifre_pare
		
		addu $sp, $sp, 4
		
		mul $v0, $v0, -1
		addi $v0, $v0, 1
		
		div $t3, $t2, $s2 # t3=[v[i]/x]
		sub $t4, $s3, $t0
		add $t4, $t4, $t1
		move $t5, $t4
		
		# $t4 = ($t4)^3
		mul $t4, $t4, $t4
		mul $t4, $t4, $t5
		
		add $t3, $t3, $t4
		mul $t0, $v0, $t3
		add $v1, $v1, $v0
		
		addi $t1, $t1, 1
		addi $s0, $s0, 4
		
		j for
		
	exit_evalueaza:
		lw $s4, -28($fp)
		lw $s3, -24($fp)
		lw $s2, -20($fp)
		lw $s1, -16($fp)
		lw $s0, -12($fp)
		lw $ra, -8($fp)
		lw $fp, -4($fp)
		
		addu $sp, $sp, 28
		
		jr $ra

suma_cifre_pare:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	addi $fp, $sp, 4
	# $sp:($fpv) $fp:(x)
	subu $sp, $sp, 4
	
	sw $s0, 0($sp)
	lw $sp, 0($fp) #?
	li $t2, 0
 
	while:
		beqz $s0, exit_suma
		
 		rem $t1, $s0, 10
 		add $t2, $t2, $t1
 		div $s0, $s0, 10
 		
 		j while
 	
 	exit_suma:
 		rem $v0, $t2, 2
 		sne $v0, $v0, 1
 	
 		lw $s0, -8($fp)
 		lw $s0, -4($fp)
 		
 		addu $sp, $sp, 8
 		
 		jr $ra
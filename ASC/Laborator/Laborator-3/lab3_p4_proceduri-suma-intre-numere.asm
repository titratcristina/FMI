# Procedura care calculeaza suma de la x la y
# ex: 3 si 5
# returneaza 12 (3+4+5) 

.data
	x: .word 3
	y: .word 5
.text
	
main:
	lw $t0, y
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	lw $t0, x
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	jal suma
	
	addu $sp, $sp, 8	# pentru eliberarea memoriei
	move $a0, $v0		# suma stocata in $v0 se muta in $a0

	li $v0, 1		# afisare suma
	syscall			# apel sistem
	
	li $v0, 10		# exit
	syscall
	
suma:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	
	addi $fp, $sp, 4
	sw $s0, 0($sp)
	
	subu $sp, $sp, 4
	sw $s1, 0($sp)
	
	lw $s0, 0($fp)	# x
	lw $s1, 4($fp)	# y
	
	li $v0, 0	# v0=0	
	
	loop:
		bgt $s0, $s1, exit	# iese din loop cand x = y
		addu $v0, $v0, $s0	# v0=v0+x
		addi $s0, $s0, 1	# x++
		j loop
	
	exit:
		lw $s1, -12($fp)
		lw $s0, -8($fp)
		lw $fp, -4($fp)
	
		addi $sp, $sp, 12
		
		jr $ra		# reintoarcere in main
# Proceduri pentru manipularea tablourilor unidimensionale (vectori)
# afisare vector din memorie
# afis(*v,n)


.data
	v: .word 3, 15, 27, 9, 18, 36
	n: .word 6
	ch: .byte ' '

.text
main:
	lw $t0, n
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	la $t0, v
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	jal afisare
	
	addu $sp, $sp, 8
	
	li $v0, 10
	syscall
	
afisare:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	addi $fp, $sp, 4
	
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	
	subu $sp, $sp, 4
	sw $s1, 0($sp)
	# $sp: ($s1v)($s0v)($fpv) $fp(v)(n)
	
	lw $s0, 0($fp)
	lw $s1, 4($fp)
	li $t0, 0
	
	loop:
		bge $t0, $s1, exit
		
		lw $a0, 0($s0)
		li $v0, 1
		syscall
		
		lb $a0, ch
		li $v0, 11
		syscall
		
		addi $s0, $s0, 4
		addi $t0, $t0, 1
		
		j loop
exit:
	lw $s1, -12($fp)
	lw $s0, -8($fp)
	lw $fp, -4($fp)
	
	addu $sp, $sp, 12
	
	jr $ra

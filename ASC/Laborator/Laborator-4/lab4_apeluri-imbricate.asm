# f(x)=2g(x)
# g(x)=x+1

.data
	x:.word 5
.text
main:
	lw $t0, x
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	jal f
	
	addu $sp, $sp, 4
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
f:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	addi $fp, $sp, 4
	
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	# $sp:($s0v)($rav)($fpv)$fp:(x)
	
	lw $s0, 0($fp)
	
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	
	jal g
	
	addu $sp, $sp, 4
	
	mul $v0, $v0, 2
	
	lw $s0, -12($fp)
	lw $ra, -8($fp)
	lw $fp, -4($fp)
	
	addu $sp, $sp, 12
	
	jr $ra

g:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	addi $fp, $sp, 4
	
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	lw $s0, 0($fp)
	# $sp:($s0v)($fpv)$fp:(x)
	
	addi $v0, $s0, 1	# x+1
	
	lw $s0, -8($fp)
	lw $fp, -4($fp)
	
	addu $sp, $sp, 8
	
	jr $ra


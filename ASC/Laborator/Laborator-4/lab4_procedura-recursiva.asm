# ex: proc(3)=321

.data 
	x:.word 3
.text
main:
	lw $t0, x
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	jal proc
	
	addu $sp, $sp, 4
	
	li $v0, 10
	syscall
	
proc:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	addi $fp, $sp, 4
	
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	# $sp:($s0v)($rav)($fpv)$fp:(x)
	lw $s0, 0($fp)
	
	beqz $s0, exit
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	addi $s0, $s0, -1
	subu $sp, $sp, 4
	sw $s0, 0($sp)
	
	jal proc
	
	addi $sp, $sp, 4
	
exit:
	lw $s0, -12($fp)
	lw $ra, -8($fp)
	lw $fp, -4($fp)
	
	addu $sp, $sp, 12
	
	jr $ra
### in mars programul nu merge daca procedura este inainte de main :) ###
# Calculati suma a doua numere prin intermediul procedurilor

.data
	x: .word 17
	y: .word 35
	
.text
main:
	# push y
	lw $t0, y
	subu $sp, $sp, 4 
	sw $t0, 0($sp)
	
	# push x
	lw $t0, x
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	
	jal suma			# se duce la procedura suma
	
	addu $sp, $sp, 8 		# am eliberat memoria
	
	# afisare suma
	move $a0, $v0
	li $v0, 1
	syscall
	
	# inchidere program
	li $v0, 10
	syscall
	
suma:
	subu $sp, $sp, 4
	sw $fp, 0($sp)
	
	addi $fp, $sp, 4
	sw $s0, 0($sp)
	
	subu $sp, $sp, 4
	sw $sp, 0($sp)
		
	lw $s0, 0($fp)
	lw $s1, 4($fp)
	
	add $v0, $s0, $s1
		
	lw $s1, -12($fp)
	lw $s0, -8($fp)
	lw $fp, -4($fp)
	
	addi $sp, $sp, 12
		
	jr $ra
	

	
	

.data
	v:.space 400
	sp:.asciiz " "
	nl:.asciiz "\n"

.text

main:
	li $v0, 5
	syscall
	move $t0, $v0 	
	
	li $v0, 5
	syscall
	move $t1, $v0 	
	
	li $t2, 1 	# constanta oarecare i
	li $t3, 4 	# constanta memorie cu pas 4
	
	mulu $t4, $t0, $t1

	loopcit:
		bgt $t2, $t4, jumpafis
		li $v0, 5
		syscall
		sw $v0, v($t3)
		addi $t2, $t2, 1
		addi $t3, $t3 4
		j loopcit
		
	jumpafis:
		li $t2, 1 #i
		li $t3, 4 #cnt
		j loopafis

	loopafis:
		bgt $t2, $t4, exit
		lw $a0, v($t3)
		li $v0, 1
		syscall
		  
		rem $t6, $t2, $t1
		  
		beq $t6, $0, newline
		la $a0, sp
		li $v0, 4
		syscall
		addi $t2, $t2, 1
		addi $t3, $t3 4
		j loopafis
		
	newline:
		la $a0, nl
		li $v0, 4
		syscall
		addi $t2, $t2, 1
		addi $t3, $t3, 4
		j loopafis
	
	exit:
		li $v0, 10
		syscall

.data
	v:.space 400
	n: .space 4
	sp: .asciiz " "
.text

main:
	li $v0, 5
	syscall
	
	sw $v0, n

	lw $t0,n 
	li $t1,0 
	li $t2,0

	loop_read:
		bge $t1, $t0, main2
		li $v0, 5
		syscall
	
		sw $v0, v($t2)
	
		addi $t1, $t1, 1
		addi $t2, $t2, 4
	
		j loop_read
	
	main2:
		li $t1, 0
		li $t2, 0

	loop_write:
		bge $t1, $t0, exit
	
		lw $a0, v($t2)
		li $v0, 1
		syscall
	
		la $a0, sp
		li $v0,4
		syscall
	
		addi $t1, $t1, 1
		addi $t2, $t2, 4
	
		j loop_write
			
	exit:
		li $v0, 10
		syscall
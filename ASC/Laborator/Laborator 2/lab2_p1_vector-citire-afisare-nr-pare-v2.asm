# Se citesc n si un vector de n numere intregi
# Sa se afiseze pe ecran numerele pare din vector
# prin 2 parcurgeri (una de citire si una de verificare)

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

	loopRead:
		bge $t1, $t0, resetValues
		li $v0, 5
		syscall
	
		sw $v0, v($t2)
	
		addi $t1, $t1, 1
		addi $t2, $t2, 4
	
		j loopRead
	
	resetValues:
		li $t1, 0
		li $t2, 0

	loopWrite:
		bge $t1, $t0, exit
		
		# verificare numere pare
		lw $t5, v($t2)
		li $t6, 2
		rem $t4, $t5, $t6 
		
		bnez $t4, increment 
		
		lw $a0, v($t2)
		li $v0, 1
		syscall
	
		la $a0, sp
		li $v0,4
		syscall
		
		increment:
			addi $t1, $t1, 1
			addi $t2, $t2, 4
		
			j loopWrite
			
			
	exit:
		li $v0, 10
		syscall

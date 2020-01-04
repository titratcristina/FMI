.data
	v:   .space   400		# vector cu max 100 elemente (100 * 4 = 400)
	sp:  .asciiz  " "		# spatiu pentru afisare
.text

main:
	li $v0, 5		# 5 - READ INT
	syscall
	
	add $t0, $v0, 0		# se adauga valoarea din $v0 in $t0 ( t0 = v0 + 0 )   
	li $t1, 0		# i=0
	li $t2, 0		# indice pentru locatia din memorie
	
	add $t3, $v0, 0		# se adauga valoarea din $v0 in $t0 ( t0 = v0 + 0 )
	li $t4, 0		# i'=0
	li $t5, 0		# indice nou pentru locatia din memorie
	
	citire:
		bge $t1, $t0, afisare		# if i >= n go to exit
		
		#citire 
		li $v0, 5			# 5 - READ INT
		syscall
		
		sw $v0, v($t2)			# store word v(i) in $v0
		
		addi $t1, $t1, 1		# se incrementeaza i cu 1 ( i++ )
		addi $t2, $t2, 4		# se incrementeaza locatia din memorie cu !!! 4 !!!
		
		j loop
		
	afisare:
		bge $t4, $t3, exit		# if i >= n go to exit
		
		#afisarea elementului de pe pozitia $t2
		lw $a0, v($t5)			# se incarca in $a0 pentru afisare v($t2) <=> v(0)
		li $v0, 1			# 1 - PRINT INT
		syscall
		
		#afisare spatiu
		la $a0, sp			# incarca spatiu in $a0 pentru afisare
		li $v0, 4			# 4 - PRINT STR
		syscall
		
		addi $t4, $t4, 1		# se incrementeaza i cu 1 ( i++ )
		addi $t5, $t5, 4		# se incrementeaza locatia din memorie cu !!! 4 !!!
		
		j afisare			# jump
	
	exit:
		# inchidere program
		li $v0, 10
		syscall
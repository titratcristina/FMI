# Se da un vector in memorie
# Sa se afiseze pe ecran elementele lui.

.data 
	v:   .word    5, 9, 27, 3, 14
	n:   .word    5
	sp:  .asciiz  " "
	
.text

main:
	lw $t0, n		# se incarca n in reg.
	li $t1, 0		# i=0
	li $t2, 0		# indice pentru locatia din memorie
	
	# for ( i - 0; i < n; i++)
	#	 cout << v[i] << " ";
	loop:
		bge $t1, $t0, exit		# if i >= n go to exit
		
		#afisarea elementului de pe pozitia $t2
		lw $a0, v($t2)			# se incarca in $a0 pentru afisare v($t2) <=> v(0)
		li $v0, 1			# 1 - PRINT INT
		syscall
		
		#afisare spatiu
		la $a0, sp			# incarca spatiu in $a0 pentru afisare
		li $v0, 4			# 4 - PRINT STR
		syscall
		
		addi $t1, $t1, 1		# se incrementeaza i cu 1 ( i++ )
		addi $t2, $t2, 4		# se incrementeaza locatia din memorie cu !!! 4 !!!
		
		j loop				# jump 

	exit:
		li $v0, 10			# 10 - COD EXIT
		syscall
		
		
		
		

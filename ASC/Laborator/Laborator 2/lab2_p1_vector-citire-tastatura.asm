# Citirea unui vector de la tastatura

.data
	v: .space 12		# se pot retine 3 intregi sau 12 variabile byte
	n: .word 3		# n = 3 (cati intregi sunt)
	sp: .asciiz " "
	
.text
main:
	lw $t0, n		# $t0 = n
	li $t1, 0 		# $t1 este contorul obisnuit
	li $t2, 0 		# $t2 creste din 4 in 4
	
	loop_read:
		bge $t1, $t0, afisare 	# daca i >= n se merge la afisarea vectorului
		
		li $v0, 5		# 5 - READ INT
		syscall
		
		#move $t3, $v0		# mutam in $t3 valoarea citita de la tastatura
		#sw $t3, v($t2)		# salvam ce am citit de la tastatura in vector pe pozitia v[i]
		sw $v0, v($t2)
		
		addi $t1, $t1, 1	# se incrementeaza contorul
		addi $t2, $t2, 4	# creste cu 4 indexul care acceseaza memoria
		
		j loop_read
		
	afisare:
		li $t1, 0
		li $t2, 0
	
	loop_write:
		bge $t1, $t0, exit	# daca i>=n se merge la exit
		
		lw $a0, v($t2)		# incarcam in $a0 elementul curent
		li $v0, 1		# 1 - PRINT INT
		syscall			
		
		la $a0, sp		# se incarca in $a0 spatiul
		li $v0, 4		# 4 - PRINT STRING
		syscall			
		
		addi $t1, $t1, 1	# se incrementeaza contorul
		addi $t2, $t2, 4	# crestem cu 4 indexul care acceseaza memoria
		j loop_write
		
	exit:
		li $v0, 10
		syscall
		

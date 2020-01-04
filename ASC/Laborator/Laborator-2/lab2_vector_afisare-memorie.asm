# Sa se afiseze valorile unui vector pe ecran
.data
	v: .word 3, 4, 1, 2, 5
	n: .word 5
	sp: .asciiz " "
	
.text
main:
	lw $t0, n		# in $t0 retinem dimensiunea
	li $t1, 0		# $t1 este contorul obisnuit
	li $t2, 0		# $t2 creste din 4 in 4
	
	loop: 
		bge $t1, $t0, exit	# conditia de iesire, cand i >= n
		
		lw $a0, v($t2)		# se incarca in $a0 elementul curent v($t2) <=> v[i]
		
		li $v0, 1		# 1 - PRINT INT
		syscall
		
		la $a0, sp		# se incarca in $a0 adresa spatiului de afisat
		li $v0, 4		# 4 - PRINT STRING
		syscall
		
		addi $t2, $t2, 4	# $t2 crest4e din 4 in 4 pentru a accesa memoria
		addi $t1, $t1, 1	# $t1 se incrementeaza standard
		
		j loop			# se revine la loop
	
	exit:
		li $v0, 10		# codul pentru exit
		syscall
	
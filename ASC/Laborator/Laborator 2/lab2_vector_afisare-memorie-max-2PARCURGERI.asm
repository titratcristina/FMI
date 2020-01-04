# Sa se determine maximul si numarul de aparitii al acestuia intr-un vector

.data
	v: .word 15, 239, 34, 998, 342, 998, 324, 998, 24, 13
	n: .word 10
	mesaj: .asciiz "Maximul este "
	mesaj2: .asciiz " cu numar de aparitii "
	
.text
main:
	lw $t0, n		# in $t0 retinem dimensiunea
	li $t1, 0		# $t1 este contorul obisnuit
	li $t2, 0		# $t2 creste din 4 in 4
	li $t3, 0		# MAXIMUL
	# $t4 -> v[i]
	
	parcurgere1: 
		bge $t1, $t0, reset		# conditia de iesire, cand i >= n
		
		lw $t4, v($t2)			# se stocheaza in $t4 valoarea din v($t2)
		
		ble $t3, $t4, schimb_max	# daca maximul ($t3) < v[i] ($t4 = v[$t2]) se schimba maximul, altfel se incrementeaza
	
		addi $t2, $t2, 4		# $t2 crest4e din 4 in 4 pentru a accesa memoria
		addi $t1, $t1, 1		# $t1 se incrementeaza standard
		
		j parcurgere1
		
	schimb_max:
		move $t3, $t4 
		j incrementare1
		
	incrementare1:
		addi $t2, $t2, 4		# $t2 crest4e din 4 in 4 pentru a accesa memoria
		addi $t1, $t1, 1		# $t1 se incrementeaza standard
		j parcurgere1				# se revine la loop
		
	reset:
		li $t1, 0		# $t1 este contorul obisnuit
		li $t2, 0		# $t2 creste din 4 in 4
		li $t5, 0		# numar aparitii
		j parcurgere2
		
	parcurgere2: 
		bge $t1, $t0, afisare		# conditia de iesire, cand i >= n
		
		lw $t4, v($t2)			# se stocheaza in $t4 valoarea din v($t2)
		
		beq $t3, $t4, nr_aparitii	# daca maximul ($t3) > v[i] ($t4 = v[$t2]) se schimba maximul, altfel se incrementeaza
		
		addi $t2, $t2, 4		# $t2 crest4e din 4 in 4 pentru a accesa memoria
		addi $t1, $t1, 1
		
		j parcurgere2
		
	nr_aparitii:
		addi $t5, $t5, 1
		j incrementare2
		
	incrementare2:
		addi $t2, $t2, 4		# $t2 crest4e din 4 in 4 pentru a accesa memoria
		addi $t1, $t1, 1		# $t1 se incrementeaza standard
		j parcurgere2
	
	afisare:
		la $a0, mesaj		# se incarca in $a0 adresa mesajului de afisat
		li $v0, 4		# 4 - PRINT STRING
		syscall
		
		move $a0, $t3		# se incarca in $a0 valoarea maxima
		li $v0, 1		# 1 - PRINT INT
		syscall
		
		la $a0, mesaj2		# se incarca in $a0 adresa mesajului de afisat
		li $v0, 4		# 4 - PRINT STRING
		syscall
		
		move $a0, $t5		# se incarca in $a0 valoarea maxima
		li $v0, 1		# 1 - PRINT INT
		syscall
		
		j exit
	exit:
		li $v0, 10		# codul pentru exit
		syscall
	

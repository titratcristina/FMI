# Se da un numar natural nenul n in memorie
# Sa se citeasca un vector cu n elemente din Z
# (se da cate un element pe linie)

.data
	v: .space 28		# vector cu 7 elemente (7 * 4 = 28)
	n: .word 7

.text

main:
	lw $t0, n		# se incarca n in reg. $t0
	li $t1, 0		# i=0
	li $t2, 0		# indice pentru locatia din memorie
	
	loop:
		bge $t1, $t0, exit		# if i >= n go to exit
		
		li $v0, 5			# 5 - READ INT
		syscall
		
		sw $v0, v($t2)			# store word v(i) in $v0
		
		addi $t1, $t1, 1		# se incrementeaza i cu 1 ( i++ )
		addi $t2, $t2, 4		# se incrementeaza locatia din memorie cu !!! 4 !!!
		
		j loop
	
	exit:
		# inchidere program
		li $v0, 10
		syscall
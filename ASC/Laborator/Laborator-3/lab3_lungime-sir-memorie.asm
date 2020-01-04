#Sa se determine lungimea unui sir de date salvat in memorie

.data
	str: .asciiz "Sir de caractere"

.text
main:
	li $t0, 0 			# pentru locatii de memorie
	lb $t1, str($t0)		# in $t1 se pastreaza caracterul
	
	loop:
		beqz $t1, exit		# daca $t1 = 0 se duce la exit
		
		addi $t0, $t0, 1	# se incrementeaza locatia de memorie
		lb $t1, str($t0)	# se muta in $t1 caracterul de pe pozitia $t0
		
		j loop
	
	exit:
		move $a0, $t0		# se muta lungimea sirului din $t0 in $a0 pentru afisare
		li $v0, 1		# 1 - PRINT INT
		syscall
		
		# comanda de inchidere program
		li $v0, 10
		syscall
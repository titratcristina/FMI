# Se citeste un sir de caractere de dimensiune maxim 99 
# Sa se afiseze pe ecran caracterele de pe pozitii pare 
# stiind ca indexarea este de la 0 (!!!)

.data
	str: .space 100
.text
	main:
		# se citeste sirul de la tastatura
		la $a0, str
		li $a1, 99
		li $v0, 8
		syscall
		
		li $t0, 0 			# $t0 ia valoarea 0 este echivalentul lui i
		lb $t1, str($t0) 		# str($t0) este echivalentul lui v[0]
		
		
	loop:
		beqz $t1, exit 			# daca $t1 e 0 se duce la exit
		
		rem $t1, $t0, 2 		# verifica daca pozitia este para (in $t1 se stocheaza restul impartirii lui $t0 la 2)
		beqz $t1, afisare 		# daca restul impartirii e 0 se duce la afisare 
		
		addi $t0, $t0, 1 		# se incrementeaza t0
		lb $t1, str($t0) 		# se incarca in $t1 v[i]

		j loop

	afisare:
		lb $a0, str($t0)		# se incarca in $a0 pozitia para
		li $v0, 11			# 11 - PRINT BYTEs
		syscall
		
		# daca se duce in afisare trebuie sa incrementez pentru ca sare peste instructiunile din loop
		addi $t0, $t0, 1 		# se inrementeaza t0
		lb $t1, str($t0) 		# se incarca in $t1 v[i]
		j loop
		
	exit:
		# inchidere program
		li $v0, 10
		syscall
	

# Se da in memorie un sir de caractere
# Sa se modifice sirul 
# adaugand fiecarui element 1 pe codul ascii

# se face un +1 pe byte
# abc xyz -> bcd!yz{

.data
	str: .asciiz "abc xyz"

.text
	main:
		li $t0, 0 		# $t0 ia valoarea 0 este echivalentul lui i
		lb $t1, str($t0) 	# str($t0) este echivalentul lui v[0]
		
	loop:
		beqz $t1, exit 		# daca $t1 e 0 se duce la exit
		
		lb $t2, str($t0) 	# se incarca in $t2 v[i]

		addi $t2, $t2, 1 	# se adauga fiecarui element 1 pe codul ascii
		sb $t2, str($t0)	# se stocheaza in memorie byte-ul de pe pozitia $t0
	
		addi $t0, $t0, 1 	# se incrementeaza t0
		lb $t1, str($t0)	# se incarca in registrul $t1 byte-ul de pe pozitia $t0

		j loop

		
	exit:
		la $a0, str		# se incarca in reg. $a0 stringul 
		li $v0, 4		# 4 - PRINT STRING
		syscall
		
		# inchidere program
		li $v0, 10
		syscall


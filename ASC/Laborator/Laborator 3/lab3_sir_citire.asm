# 8 - READ STRING

.data 
	str: .space 100

.text
main:
	la $a0, str # in $a0 dau adresa de memorie in care vreau sa stochez sirul citit
	li $a1, 99 # in $a1 dau dimensiunea maxima a sirului
	
	# citire string de la tastatura
	li $v0, 8
	syscall
	
	# afisare string
	la $a0, str
	li $v0, 4
	syscall
	
	# inchidere program
	li $v0, 10
	syscall

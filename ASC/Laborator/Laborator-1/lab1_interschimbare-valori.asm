# Se dau doi intregi stocati in memorie
# Sa se interschimbe valorile lor 
# Sa se afiseze pe ecran noile valori

# Ex. x=4 y=6 
# Afisare: 6 4 (! cu spatiu)

.data
	x:  .word   4
	y:  .word   6
	sp: .asciiz " "
.text
main:
	#load word in reg. temporari
	lw $t0, x
	lw $t1, y
	
	#store word in reg. temporari inversati
	sw $t1, x
	sw $t0, y
	
	#afisare y
	move $a0, $t1 #muta reg. $t1 in $a0 pentru printare
	li   $v0, 1   # 1 - PRINT INT
	syscall
	
	#afisare spatiu
	la $a0, sp    #muta sp in $a0 pentru printare
	li $v0, 4     # 4 - PRINT STRING
	syscall
	
	move $a0, $t0 #muta reg. $t0 in $a0 pentru printare
	li   $v0, 1   # 1 - PRINT INT
	syscall
	
	#inchidere program
	li $v0, 10
	syscall
	
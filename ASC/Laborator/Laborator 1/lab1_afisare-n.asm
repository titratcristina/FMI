# Sa se afiseze toate numerele de la 0 la n-1 (inclusiv)
# pentru n > 0 citit de la tastatura

# Ex. n=10
# Afisare: 0 1 2 3 4 5 6 7 8 9

.data
	n:  .space 4     # se aloca in memorie spatiu pentru n
	sp: .asciiz " "
	
.text
main:
	# citirea de la tastatura a numarului n
	li $v0, 5        # 5 - READ INT
	syscall
	
	move $t0, $v0    # se muta valoarea din $v0 in $t0
	sw $t0, n        # se pune in variabila n valoarea din $t0
	
	li $t1, 0        # se initializeaza contorul i=0
	
	loop:
		# if i >= n go to exit
		bge $t1, $t0, exit  # bge - Branch If Greater or Equal
		
		move $a0, $t1       # se muta val. din $t1 in $a0 pentru afisare
		li $v0, 1	    # 1 - PRINT INT
		syscall
		
		la $a0, sp	    # se muta spatul in $a0 pentru afisare
		li $v0, 4	    # 4 - PRINT STR
		syscall
		
		addi $t1, $t1, 1    # se incrementeaza contorul i++
		
		j loop 		    # "sare" la loop
	
	exit:
		li $v0, 10
		syscall
	
	

# Se citesc n si un vector de n numere intregi
# Sa se determine maximul si pozitia pe care apare

.data
	v:.space 400
	n: .space 4
	maxim: .asciiz "Maximul este: "
	pozitia: .asciiz "\nPozita maximului este: "
.text

main:
	li $v0, 5
	syscall
	
	sw $v0, n
	lw $t0,n 
	
	li $t1, 0 			# i 
	li $t2, 0 			# contor memorie vector
	li $t3, 0 			# maxim

	loopRead:
		bge $t1, $t0, resetValues
		li $v0, 5
		syscall
	
		sw $v0, v($t2)
	
		addi $t1, $t1, 1
		addi $t2, $t2, 4
	
		j loopRead
	
		resetValues:
			li $t1, 0
			li $t2, 0
	
	findMax:
		bge $t1, $t0, showMax
		
		lw $t4, v($t2)
		
		ble $t4, $t3, increment
		
		move $t3, $t4 		# se muta maximul in $t3
		move $t5, $t1 		# se muta pozitia in $t5
		
		
		addi $t1, $t1, 1
		addi $t2, $t2, 4
		    
		j findMax
		
		increment:
			addi $t1, $t1, 1
			addi $t2, $t2, 4
		
			j findMax
		
		showMax:
			la $a0, maxim
			li $v0, 4
			syscall
							
			move $a0, $t3 	# se muta maximul in $a0 pentru afisare
			li $v0, 1 	# 1 - PRINT INT
			syscall
			
			la $a0, pozitia
			li $v0, 4
			syscall
							
			move $a0, $t5 	# se muta pozitia maximului in $a0 pentru afisare
			li $v0, 1 	# 1 - PRINT INT
			syscall
			
			j exit
			
	exit:
		li $v0, 10
		syscall


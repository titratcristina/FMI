# Afisarea tuturor divizorilor unui numar n citit de la tastatura

# for ( i = 1; i<=n; i++ ) {
#	 if ( n % 1 == 0 )
#		 cout << i << " ";

.data
	n: .space 4 		# n va ocupa 4 bytes in memorie
	sp: .asciiz " "		# declarare spatiu pentru afisare
	
.text
main:
	li $v0, 5 		# 5 - READ INT
	syscall 		# cer sistemului sa verifice ce cod se afla in $v0
	
	move $t0, $v0		# mut ce am citit de la tastatura in $t0
	
	sw $t0, n		# salvez intregul citit in memorie (optional)
	
	li $t1, 1		# $t1 este pe post de i
	
	loop:
		bgt $t1, $t0, exit 	# daca $t1 > $t0 se duce la exit (nu se mai respecta i<=n)
		
		rem $t2, $t0, $t1	# t2 = $t0 % $t1 (adica n % i)
		beqz $t2, afisare	# daca restul e zero afisam numarul n
		
		continuare:
			addi $t1, $t1, 1	# $t1 = $t1 + 1 (adica i++)
			j loop
			
		afisare:
			move $a0, $t1 		# se incarca in $a0 divizorul (adica $t1)
			li $v0, 1		# 1 - PRINT INT
			syscall			# cer sistemului sa vada ce cod se afla in $v0
			
			la $a0, sp		# se incarca in $a0 adresa stringului de spatiu
			li $v0, 4		# 4 PRINT STRING
			syscall			# cer sistemului sa vada ce cod se afla in $v0
			
			j continuare 		# revine in ciclu fix inainte de incrementarea contorului
			
		exit:
			li $v0, 10		# codul apelului sistem corespunzator lui EXIT
			syscall			# cer sistemului sa vada ce cod se afla in $v0
			
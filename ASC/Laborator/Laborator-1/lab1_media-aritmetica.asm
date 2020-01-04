#declare variabile
.data
	#.asciiz -> tip de dată pentru stringuri
	# \n -> new line
	
	mesaj1:.asciiz "Introduceti numarul n: "
	mesaj2:.asciiz "\nMedia aritmetica este: " 
	cat:.asciiz "\nCatul: " 
	rest:.asciiz "\nRestul: "
	slash:.asciiz " / "
	egal:.asciiz " = "
.text

# li -> încarcă o valoare constantă (load int)
# la -> încarcă în reg. temp. adresa de memorie a stringului (load ascii)

main:
	# afișează mesaj1 pentru a introduce n
	la $a0, mesaj1 
	li $v0, 4 		# 4->print string
	syscall

	#se citeste n de la tastatura
	li $v0, 5 		# 5->read int 
	syscall
	
	move $t0, $v0  		# se mută valorea citită (n-ul) într-un registru temporar (t0)
	li $t1, 0      		# se ințializează $t1 cu o valoare constanta 0
	li $t2, 0      		# se ințializează $t2 cu o valoare constanta 0
	
loop:
	#se citesc n numere de la tastatura
	li $v0, 5 		# 5->read int
	syscall
	
	add $t2, $t2, $v0 	## t2+=vo !!!suma se stochează în $t2!!!

	#contorizeaza cate numere s-au introdus
	addi $t1, $t1, 1 	## t1++ !!!numitorul este stocat in reg. $t1!!!
	bne $t0, $t1, loop 	# bne -> (!=)

	# afișează mesajul2 
	la $a0, mesaj2 
	li $v0, 4 		# 4->print string
	syscall
	
	#afisează media aritmetica
	move $a0, $t2 		# se afiseaza suma/numaratorul
	li $v0, 1 		# 1->print int
	syscall
	
	la $a0, slash 		# se afiseaza slash-ul (/)
	li $v0, 4 		# 4->print string
	syscall
	
	move $a0, $t1 		# se afiseaza numitorul
	li $v0, 1 		# 1->print int
	syscall
	
	la $a0, egal 		# se afiseaza egalul
	li $v0, 4 		# 4->print string
	syscall
	
	mtc1 $t2, $f0 		#move to coproc1 (suma)
	mtc1 $t1, $f1 		#move to coproc1 (n)
	div.s $f12, $f0, $f1  	# se calculeaza $f12=$f0/$f1
	li $v0, 2 		# 2->print float
	syscall

	# afișează mesajul pentru cât
	la $a0, cat 
	li $v0, 4 		# 4->print string
	syscall

	# afișează câtul
	div $a0, $t2, $t0 #a0=t2/t0
	li $v0, 1 		# 1->print int
	syscall

	# afișează mesajul pentru rest
	la $a0, rest 
	li $v0, 4 		# 4->print string
	syscall

	# afișează restul
	rem $a0, $t2, $t0 
	li $v0, 1 		# 1->print int
	syscall
	
	# închide program
	li $v0, 10 		# 10 ->exit
	syscall

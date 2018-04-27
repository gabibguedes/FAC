.data
	comando: .asciiz "Escreva as variaveis para base, expoente e modulo"
  	base: .asciiz "base: "
  	expoente: .asciiz "expoente: "
  	modulo: .asciiz "modulo: "
  	primo: .asciiz "eh primo"
  	erro: .asciiz "O modulo nao eh primo"
  	saida1: .asciiz "A exponencial modular "
  	saida2: .asciiz " elevado a "
  	saida3: .asciiz " (mod "
  	saida4: .asciiz ") eh "
  	saida5: .ascii "."
.text

j MAIN

le_inteiro:
	li $v0, 5 #Seleciona tipo de variavel a ser lido (INTEIRO = 5)
	syscall
	
	move $t0, $v0
	jr $ra

eh_primo: 
	add $t5, $0, $0 #Variavel para contar quantas divisôes tem o número
	li $t6, 1 #Variavel i do for
	j FOR # Chama o for

	
	IF:
		addi $t5, $t5, 1 #Adiciona 1 na variavel que conta as divisôes
		j volta_do_if #volta para o for
		
	IF2:
		li $s0,  1 #Coloca 1 na variavel $s0 se for primo
		j volta_do_if2 #volta
		
	FOR:	
		div $t3, $t6 #Divide o provavel primo por i
		mfhi $t7 #armazena o resto
		beqz $t7, IF #Se resto=0, entra no if
		volta_do_if:
		addi $t6, $t6, 1 # i++
		ble $t6, $t3, FOR # Se i <= provavel primo, continua o for
	
	add $s0, $0, $0 #Inicia a variavel de retorno como 0
	beq  $t5, 2, IF2 # Se tiver 2 divisores entra no if2
	volta_do_if2:
	jr $ra #volta pra main
	
calc_exp:
	add $s1, $0, $t1 # resultado = base
	li $t6, 1 #variavel i do for começando com 1
	
	FOR2:
		mul $s1, $s1, $t1
		addi $t6, $t6, 1 #i++
		blt $t6, $t2, FOR2 #Continua o for até i < expoente	 
	
	div $s1, $t3 #Divide o resultado pelo modulo
	mfhi $s1 #armazena o resto na variavel de resultado
	jr $ra

imprime_erro:
	li $v0, 4
	la $a0, erro
	syscall
	j END	

imprime_saida:
	li $v0, 4
	la $a0, saida1
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall # Imprime a BASE
	
	li $v0, 4
	la $a0, saida2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall # Imprime O EXPONECIAL
	
	li $v0, 4
	la $a0, saida3
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall # Imprime o MODULO
	
	li $v0, 4
	la $a0, saida4
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall # Imprime o RESULTADO
	
	li $v0, 4
	la $a0, saida5
	syscall
	
	jr $ra
	


MAIN:

	#Comando inicial
	li $v0, 4
	la $a0, comando
	syscall #Imprime a label
	
	li $a0, 0xA
        li $v0, 0xB 
        syscall ##imprime a quebra de linha
	
	#BASE
	li $v0, 4
	la $a0, base
	syscall #Imprime a label
	
	jal le_inteiro #salva o número
	move $t1, $t0 #$t1 = BASE
	
	#EXPOENTE
	li $v0, 4
	la $a0, expoente
	syscall
	
	jal le_inteiro
	move $t2, $t0 #$t2 = EXPOENTE
	
	#MODULO
	li $v0, 4
	la $a0, modulo
	syscall
	
	jal le_inteiro
	move $t3, $t0 #$t3 = MODULO (possivel primo)
	
	jal eh_primo
	
	beqz $s0, imprime_erro
	
	jal calc_exp
	jal imprime_saida
	
END:

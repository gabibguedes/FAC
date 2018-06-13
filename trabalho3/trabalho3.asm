.data
	precisao: .double 0.000000000001
	dois: .double 2.0
	zero: .double 0.0
	um: .double 1.0
	entrada: .asciiz "Numero: "
	saida1: .asciiz "A raiz cubica eh "
  	saida2: .asciiz ". O erro eh menor que "
.text 
j MAIN
#n = $f0
#inicio = $f2
#meio = $f4
#fim = $f6
#erro = $f8
#precisao = $f10

le_float:
	li $v0, 4
	la $a0, entrada # Numero:
	syscall
	
	li $v0, 7 #Seleciona tipo de variavel a ser lido (FLOAT = 6)
	syscall
	
	jr $ra
	
calc_raiz:
	l.d $f2, zero #inicio = 0
	l.d $f6, um #fim = 1
	add.d $f6, $f6, $f0 #fim = n +1
	l.d $f10, precisao #precisao = 0.0001
	
	WHILE:
		l.d $f14, dois
		add.d $f4, $f2, $f6 #meio = inicio + fim
		div.d $f4, $f4, $f14
		jal calc_erro
		
		c.le.d $f8, $f10
		bc1t calculado
		
		mul.d $f16, $f4, $f4 #$meio²
		mul.d $f16, $f16, $f4 #$meio³
		
		c.lt.d $f0, $f16
		bc1t IF_while
		
		ELSE_while:
			l.d $f14, zero
			add.d $f2, $f4, $f14 #inicio = meio + 0
			j WHILE
		
		IF_while:
			l.d $f14, zero
			add.d $f6, $f4, $f14 #fim = meio + 0
			j WHILE
		
		
		

calc_erro:
	#$f20 = raiz cubica de 'meio'
	mul.d $f20, $f4, $f4 #$f4²
	mul.d $f20, $f20, $f4 #$f4³
	
	c.lt.d $f20, $f0 #se meio³ < n entra no if
	bc1t IF_erro
	
	ELSE_erro:
		sub.d $f8, $f20, $f0 ## ELSE: erro = meio³ - n
		jr $ra ##volta
	
	IF_erro:
		sub.d  $f8, $f0, $f20 # erro = n- meio³
		jr $ra

imprime_saida:
	li $v0, 4
	la $a0, saida1 # A raiz cubica é
	syscall
	
	li $v0, 3
	mov.d $f12, $f4
	syscall # Imprime a raiz
	
	li $v0, 4
	la $a0, saida2 # O erro é menor que
	syscall
	
	li $v0, 3
	mov.d $f12, $f8
	syscall # Imprime o erro
	
	j FIM
	
MAIN:
	jal le_float
	jal calc_raiz
	
	calculado:
		jal imprime_saida
		
	FIM:
	

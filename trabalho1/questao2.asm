	##1o)Insira o conteúdo 0x0000FACE no registrador $1.
	li $1, 0x0000FACE
	
	## Garantindo que $1 tem apenas 16 bits
	andi $1, $1, 0x0000FFFF
	
	##2o)Reorganize o conteúdo de forma que o registrador $2 possua o conteúdo 0x0000CAFE ao final do programa
	
	#Colocando A e E em $2
	andi $2, $1, 0x000000F0F
	
	#Colocando C em $2
	sll $3, $1, 8
	andi $3, $3, 0x0000F000
	or $2, $2, $3
	
	#Colocando F em $2
	srl $3, $1, 8
	andi $3, $3, 0x000000F0
	or $2, $2, $3
	
	#Tirando os valores de $3
	li $3, 0x00000000


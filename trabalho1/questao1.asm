## Insira o conteúdo 0x55555555 no registrador $1.
li $1,0x55555555

## Desloque o conteúdo de um bit para a esquerda, colocando em $2 
sll $2, $1, 1

## Calcule o OU bit-a-bit de $1 e $2 no registrador $3.
or $3, $1, $2

##Ponha o E bit-a-bit de $1 e $2 no registrador $4.
and $4, $1, $2

##Calcule o OU Exclusivo de $1 e $2 , colocando seu resultado em $5.
xor $5, $1, $2


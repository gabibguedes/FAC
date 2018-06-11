#include <stdio.h>
#include <math.h>
#include <stdlib.h>

double calculaErro(double valor_inicial,double valor_aproximado){
    if (valor_inicial > (valor_aproximado*valor_aproximado*valor_aproximado)){
        return (valor_inicial-(valor_aproximado*valor_aproximado*valor_aproximado));
    }else{
        return ((valor_aproximado*valor_aproximado*valor_aproximado) - valor_inicial);
    }
}

//A raiz cubica é calculada pelo método de busca binária
double raizCubica(double n, double *erro){
    double inicio=0, fim=n+1, meio; //OBS.: O valor final foi iniciado como n+1,
    double precisao = 0.0001;       //pois para numeros menores que 1 a raiz cubica
                                    //pode ser maior que o próprio numero.

    //O programa fica em loop até encontrar um resultado dentro da precisão
    //estabelecida
    while(1) {
        meio = (inicio + fim)/2;
        *erro = calculaErro(n, meio);

        //Se o erro for menor que a precisão, retornamos o valor encontrado, caso
        //o contrario, a busca continua
        if (*erro <= precisao){
          return meio;
        }

        //Se a o cubo de meio é maior que n, estabelecemos meio como o novo fim
        //do nosso conjunto
        if ((meio*meio*meio) > n){
          fim = meio;

        //Se o cubo de meio é menor que n, estabelecemos meio como o novo inicio
        //do conjunto de busca
        }else{
          inicio = meio;
        }
    }
}

int main(){
    double numero, gabarito, resultado, *erro;
    erro = (double*)(malloc(sizeof(double)));
    printf("numero: ");
    scanf("%lf", &numero);

    resultado = raizCubica(numero, erro);
    printf("\nA raiz cubica de %lf é %lf\n", numero, resultado);
    printf("erro: %lf\n", *erro);
    gabarito = pow(numero,1.0/3.0);
    printf("\n(GABARITO: %lf)\n", gabarito);
    return 0;
}

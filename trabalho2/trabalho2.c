#include <stdio.h>
#include <math.h>

int eh_primo(int provavel_primo){
  int divisivel = 0;

  for (int i = 1; i <= provavel_primo; i++){
    if(provavel_primo%i == 0){
      divisivel ++;
    }
  }
  if (divisivel == 2){
    return 1;
  }else{
    return 0;
  }
}
int calc_exp(int base, int expoente, int modulo){
  int resultado;

  resultado = base;
  for (int i = 1; i < expoente; i++){
    resultado *= base;
  }
  resultado = resultado % modulo;
  return resultado;
}

int main(){
  int base, expoente, modulo, resultado;

  printf("Escreva os numeros: \n");
  printf("numero base: ");
  scanf("%d", &base);
  printf("numero do expoente: ");
  scanf("%d", &expoente);
  printf("numero modulo: ");
  scanf("%d", &modulo);

  if (eh_primo(modulo)) {
    resultado = calc_exp(base, expoente, modulo)
    printf("Resultado: %d\n", resultado);
  }else{
    printf("Nao eh primo\n");
  }

  return 0;
}

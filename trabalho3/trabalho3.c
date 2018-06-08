#include <stdio.h>
#include <math.h>

double diff(double n,double mid)
{
    if (n > (mid*mid*mid))
        return (n-(mid*mid*mid));
    else
        return ((mid*mid*mid) - n);
}

// Returns cube root of a no n
double cubicRoot(double n)
{
    // Set start and end for binary search
    double start = 0, end = n + 1, mid, error;

    // Set precision
    double e = 0.0000001;

    while(1) {
        mid = (start + end)/2;
        error = diff(n, mid);

        printf("\n\nLOOP\n");
        printf("start: %lf\n", start);
        printf("mid: %lf\n", mid);
        printf("end: %lf\n", end);
        printf("error: %lf\n\n", error);

        // If error is less than e then mid is
        // our answer so return mid
        if (error <= e){
          printf("entrou no if de retorno\n");
          return mid;
        }
        // If mid*mid*mid is greater than n set
        // end = mid
        if ((mid*mid*mid) > n){
          printf("entrou no if de setar o end\n");
          end = mid;
        }
        // If mid*mid*mid is less than n set
        // start = mid
        else{
          printf("entrou no if de setar o start\n");
          start = mid;
        }

        printf("\nstart: %lf\n",start );
        printf("mid: %lf\n",mid );
        printf("end: %lf\n",end );

    }
}

// Driver code
int main()
{
    double n, gabarito;
    printf("numero: ");
    scanf("%lf", &n);
    printf("\nCubic root of %lf is %lf\n",
           n, cubicRoot(n));

    gabarito = pow(n,1.0/3.0);
    printf("GABARITO: %lf\n", gabarito);
    return 0;
}

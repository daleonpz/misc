#include <stdio.h>
#include <math.h>

// Challenge 'Delegates' [Coding]
/*
  I could use fibonacci closed form 
  and then add the squared numbers
 
 */
int main(){

    int b=0;
    int h=0;

    for(;b<=2118;b++){
        float t = sqrt( (float) b );
        h += (t == floorf(t))?(2*b):b;
    }

    printf("%i\n",h);
}

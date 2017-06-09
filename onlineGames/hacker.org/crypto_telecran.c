#include <stdio.h>
#include <stdlib.h>

#define DIM1 80
#define DIM2 20

// Challenge 'Telecran' [Crypto]

// replace flags with characters using the source and sed
int main(){
  // char *commands = "RRLDDRRUUDRDRRULDDRRRUUURRDLLRRDDRUUURDRDRDRUUUDDDRRRULLUURRRDRDRDRURURURDRDRDRURURURRRLLDDRLDRRRUUURRDDLLRDRRRRUUDDRRULURLDRDRRRUUURRLLDDRLDRRRRUUULRRLDDDRRRUUURRLLDDDRRRUUUDRRUDDDR";

    // since I dont have a large screen I will only focus on the last part
   char *commands = "RRLLDDRLDRRRUUURRDDLLRDRRRRUUDDRRULURLDRDRRRUUURRLLDDRLDRRRRUUULRRLDDDRRRUUURRLLDDDRRRUUUDRRUDDDR";

   char *array = (char*) calloc(DIM1*DIM2, sizeof(char) ) ;

   for (int k; k<(DIM1*DIM2); k++) array[k] = ' ';

   char *reset = array;
   while( *commands){
       switch (*commands){
            case 'R':
               *array = '*'; 
               array ++;
               *array = '*';
               break;

            case 'L':
               *array = '*';
               array --;
               *array = '*';
               break;
            
            case 'U':
               *array = '*';
               array -= DIM1;
               *array = '*';
               break;
            
            case 'D':
               *array = '*';
               array += DIM1;
               *array = '*';
               break;
      }
       commands++;
   }

   array = reset;

   for ( int k=0; k<DIM2; k++){
       for( int i=0; i<DIM1; i++)
           printf("%c", array[ i+k*DIM1 ]);
       printf("\n");
   }

   free(reset);
   
}

/*
******       ****** **** *                                                      
*  * *  ***  *   *  *  ***                                                      
** ***  ***  **  *  *  * *                                                      
************************ **

R in ETCH
   */


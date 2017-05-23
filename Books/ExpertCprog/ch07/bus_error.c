#include <stdio.h>

int main(){

    union { 
        char a[10] ;
        int i;  
          } u; 

    for (int k; k<=9; k++) u.a[k] = 'a';
    u.a[9] = '\0';
    printf("%s\n",u.a);
    printf("i = %x\n",u.i);

    int *p= (int*) &(u.a[1]);  
    *p = 17; /* the misaligned addr in p causes a bus error! */ 

    for (int k; k<10; k++)   printf("%x ",u.a[k]);
    printf("\n");
    printf("i = %x\n",u.i);

    char *q= &(u.a[1]);
    *q = 'r';

    for (int k; k<10; k++)   printf("%x ",u.a[k]);
    printf("\n");

}



/*
 
 U
 a = |x|x|x|x|x|x|x|x|x|x|
 i = |   i   |

 *p = (int*) &(u.a[1]) 
  a = |x|x|x|x|x|x|x|x|x|x|
         ^
         p
  
  *p = 17

  will overwrite this part
  a = |x|X|X|X|X|x|x|x|x|x|
         ^
         p
 */

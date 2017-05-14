#include <stdio.h>
#include <stdlib.h> 

int main(void)
{
    char *p = malloc(sizeof(char));
    *p = 'a'; 

    char c = *p; 

    printf("\n [%c]\n",c); 

    free(p);
    // the error was
    /*
     *
    ==12638== Invalid read of size 1
    ==12638==    at 0x4005D2: main (02.c:14)
    ==12638==  Address 0x51d5040 is 0 bytes inside a block of size 2 free'd
    ==12638==    at 0x4C2BD3A: free (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
    ==12638==    by 0x4005CD: main (02.c:13)
*/
   // c = *p;
    return 0;
}

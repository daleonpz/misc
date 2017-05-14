#include <stdio.h>
#include <stdlib.h> 

int main(void)
{
    /* the error was
     *
     *  ==12481== Use of uninitialised value of size 8
        ==12481==    at 0x400502: main (test.c:8)
    * */
    char *p = "a"; 

    char c = *p; 

    printf("\n [%c]\n",c); 

    return 0;
}

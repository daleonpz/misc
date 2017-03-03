#include <stdio.h>
#include <stdlib.h> 

int main(void)
{
    char *p = malloc(1);
    *p = 'a'; 
/*
==15514== Invalid read of size 1
==15514==    at 0x4005A7: main (03.c:9)
==15514==  Address 0x51d5041 is 0 bytes after a block of size 1 alloc'd
==15514==    at 0x4C2AB8D: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==15514==    by 0x400597: main (03.c:6)
*/
    char c = *p;
   /*in gdb we saw *(p+1) was '\000' 
    * so when c=*(p+1) c <- it reads garbage, out of range basically*/ 

    printf("\n [%c]\n",c); 

    free(p);
    return 0;
}

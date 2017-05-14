//hello_world-1.c
#include<stdio.h>

double A = 5;
char* c;

int main()
{
	printf("hello world\n");
	printf("%i\n",A);
	return;
}

/*
 * size hello_world-1
 * out 
 * text	   data	    bss	    dec	    hex	filename
 * 1155	    552	      8	   1715	    6b3	hello_world-1
 *
 * since we don't have global variables bss should be 0
 * but the are variables that are initialized "just in case"
 * when 
 * objdump -x hello_world-1
 * ...
 * 0000000000601030 g       .bss	0000000000000000              __bss_start
 * 0000000000601038 g       .bss	0000000000000000              _end
 *
 * there are 8 bytes
 * ...
 *
 * If we define a global variable:
 * double A = 12;
 * char* c;
 *
 * then we recompile:
 *   text	   data	    bss	    dec	    hex	filename
 *   1264	    568	     16	   1848	    738	hello_world-1
 *
 *   0000000000601040 g       .bss	0000000000000000              __bss_start
 *   0000000000601050 g       .bss	0000000000000000              _end
 *
 * bss is for uninitialized global variables
 *   16 bytes for bss: (8bytes + char )
 *
 * */

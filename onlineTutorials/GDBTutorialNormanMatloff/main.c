     
/* prime-number findin proram
	        
will (after bus are fixed) report a list of all primes which are
less than or equal to the user-supplied upper bound
		      
riddled with errors! */
        
         
          
#include "Defs.h"
	    
	     
int Prime[MaxPrimes],  /* Prime[I] will be 1 if I is prime, 0 otherwi */
UpperBound;  /* we will check all number up throuh this one for
				                             primeness */
   
    
int main(){
	int N;
		     
	printf("enter upper bound\n");
/*	1st error, segmentation fault:
 *	scanf("%d",UpperBound);
 *	we open gdb and run the program:
 *	in: r
 *	gout: Program received signal SIGSEGV, Segmentation fault.
 *	0x00007ffff7a95824 in __GI__IO_vfscanf () from /usr/lib/libc.so.6
 *
 *	then we use backtrace 
 *	in: bt
 *	gout: #0  0x00007ffff7a95824 in __GI__IO_vfscanf () from /usr/lib/libc.so.6
 *	#1  0x00007ffff7aa02bb in scanf () from /usr/lib/libc.so.6
 *	#2  0x00000000004005af in main () at main.c:23
 *
 *	we can see that the error was at main.c:23
 *	in: l main.c:23
 *	we realized that we forgot the & before Upperbound
 *	*/
	scanf("%d",&UpperBound);

	Prime[2] = 1;

	for (N = 3; N <= UpperBound; N += 2){
		// CheckPrime()
		// 2nd error
		// it requires an arg, so we add N
		CheckPrime(N);
	/*
	 * We forgot braces, since it wasn't printing on screen
	 * */
		if (Prime[N]) printf("%d is a prime\n",N);
	}
}


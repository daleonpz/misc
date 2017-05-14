   
   
#include "Defs.h"
#include "Externs.h"
   
/*
 * 2nd error:
 * in : r
 * out: Program received signal SIGSEGV, Segmentation fault.
 * 0x0000000000400634 in CheckPrime (K=-8272) at CheckPrime.c:23
 * 23					Prime[K] = 0;
 *
 * Note that K = -8272!!! , this should be positive and less or equal 50, MaxPrimes = 50
 *
 * since K is passed to the function it means that there is an error when calling CheckPrime(int K),
 * let's check main. 
 *
 * in :bt
 * gout: #0  0x0000000000400658 in CheckPrime (K=-8272) at CheckPrime.c:53
 * #1  0x00000000004005c9 in main () at main.c:48
 *  *
 * */ 
CheckPrime( int K){
      int J;
   
/* the plan:  see if J divides K, for all values J which are

(a) themselves prime (no need to try J if it is nonprime), and
(b) less than or equal to sqrt(K) (if K has a divisor larger
than this square root, it must also have a smaller one,
so no need to check for larer ones) */

	/**
	 * we change while(1) by for(J=2; J*J<=K, J++
	 * since, we also notice the section b of the comments above
	J = 2;
	while (1)  {
		if (Prime[J] == 1)
			if (K % J == 0)  {
				Prime[K] = 0;
				return;
			}			
		J++;
	}
	*/

	for(J=2; J*J<=K; J++){
		if (Prime[J] == 1)
			if (K % J == 0)  {
				Prime[K] = 0;
				return;
			}			
	}


	/* if we get here, then there were no divisors of K, so it is prime */
	Prime[K] = 1; 
}

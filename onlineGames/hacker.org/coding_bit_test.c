#include <stdio.h>

// Challenge 'Bit Test' [Coding]
static char testIt(int x) {
  return ((x & (x - 1)) == 0 )?1:0;
}

/*
 if there is more than one '1' in the binary representation of the 
 number the condition will be always 0, but if the number is 
power of 2 (one '1' in the 0b representation) will be 1
 */

int main(){
    printf("%d\n",testIt(55));
    printf("%d\n",testIt(64));
}

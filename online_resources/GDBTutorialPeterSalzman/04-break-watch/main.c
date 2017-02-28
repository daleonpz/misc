#include <stdio.h>
#include "fgets.h"

int main(void)
{
	char *word = "password";
	/* no initial value*/
    int  KeepGoing = TRUE;
	
	printf("I'm thinking of a word.  Let's see if you can guess it.\n");


	while ( KeepGoing )
	{
		KeepGoing = TakeGuess(word);

        /* the warnings told us about this
         * instead of = this should be ==*/
		if (KeepGoing == TRUE)
			printf("Nope.  That's not right.\n");
	}

	printf("Yes, that was the word!\n");

	return 0;
}

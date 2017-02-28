#include <stdio.h>
#include <string.h>
#include "fgets.h"


int TakeGuess(const char *word)
{
	char buffer[255];

    int len = sizeof(word);
	fgets(buffer, 255, stdin);

    /* buffer is full of shit, we should
     * only use bits until we reach the '0' or
     * just 'word' size, but instead of using
     * strcmp we use strncmp  */
	if (strncmp(buffer, word,len))
			return TRUE;

	return FALSE;
}

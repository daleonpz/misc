#include <stdio.h>
#include <string.h>

int main(){

    // Challenge 'iPod Fun' [Misc]
    char n[] = ",6u!tvtor, s! r3msuv 3HT";

    char c;
    int len = strlen(n);
    for( int i=len; i>-1; i--){
        c = n[i];
        switch(c){
            case '3': c = 'e'; break;
            case 'v': c = 'a'; break;
            case 'u': c = 'n'; break;
            case 'm': c = 'w'; break;
            case '!': c = 'i'; break;
        }
        printf("%c", c);
    }
    
    printf("\n");


}

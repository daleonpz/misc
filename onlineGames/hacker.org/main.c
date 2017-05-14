#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int fibonacci(int n, int k){ 
        
    int i = 1;
    int j = 1;
    int p = j;

    int nn = 2;
    for (; nn < n; nn++){
        i = i+p;
        p = j;
        j = i;

    }

    int temp = i;

    for (; nn<k; nn++){
        i += p;
        p = j;
        j = i;
        temp += i;
    }

    return temp;
}

double change_base(double n, double b){
    int nbits = 1;

    while ( n >= powf(b,(double) nbits++));
        //nbits++;

    double nn = n;
    double c;
    double res = 0;
    double pow10 = 1;

    for( int i = 0; i<nbits; i++ ){
        c = floor(nn/b);
        res += (nn - b*c)*pow10;
        nn = c;
        pow10 *= 10;
    }

    return res;
}

int main(){

    int i;

    printf("%i\n",72311^89525 );

    // Challenge 'A Few Percent' [Web]    
    char s[] ={0x66, 0x75, 0x67, 0x6C, 0x79, '\0'}; 
    printf("%s\n",s);

    // Challenge 'Who goes there?' [Crypto]
    // input: abcde....xyz
    // output: zyxwvutsrqpomlkjihgfedcba;

    char n[] = "daleonpz";

    int len = strlen(n);
    for( int i=len; i>-1; i--){
        printf("%c", n[i] );
    }
    
    printf("\n");

    char *p = n+sizeof(n)-1;

    for(; (*p) != n[0] ;)
        printf("%c",*--p);

    // Challenge 'Counting' [Misc]
    char nn[] = "eehxhqpmawoewdffplqrturxdjlsaylymgxjsthjpacyuxnpuvqlezhosbnmmjzeeahjllnacofwyxxrelwgadsmolyynahrfvqkqonkgjsazwczwbayptsnsuvyomalyisyroxbivlqvtaltvjwtqbsbnscqmdcwxxdkvwctbynbvokdcovbebokjlmekezpcnoxvzzpaqhusdhgbhtqzeuoegylofircjlxdypcvekkllxjxlynidhgngtpblebyoazqvoccnhauwcsviqlbzsmyrproffqapjtizlrdasradufbjwhkllykgtrqivlrsrwswzdwjuktqgzkyslucqxgtseafofbhvhltparprjunrsivyhmelkkodvukwkoiwmhunbjmhtrvowapwuvogjqcaxwepbxoynhygxsqmbcavzvfydrptedyvbzrqficmrobquqvtcjoclyedsafxlhlmyxeyeumiswjjzdxxdqccyqvobspwhsmazmabshscmlquplbmhvvuiuasmjjajwyoyezgvxhpfteblvcuxhuosoekqtiobyvbdytyycyesmzkvbcupnbp";

    printf("\n%i\n", strlen(nn));

    // Challenge 'Rabbits Everywhere' [Misc]
    printf("%i\n", fibonacci(10,17));

    // Challenge 'Basic' [Misc]
    double n3 =7614380936720482949.00;
    printf("%lf\n", change_base(n3,7));
    
}

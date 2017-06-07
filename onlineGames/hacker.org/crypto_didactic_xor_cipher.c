#include <stdio.h>

// Challenge 'Didactic XOR Cipher' [Crypto]

int main(){

    char x[] = {0x3d, 0x2e, 0x21, 0x2b, 0x20, 0x22, 0x6f, 0x3c, 0x2a, 0x2a, 0x2b};

    for( int i =0; i<(sizeof(x)/sizeof(char)); i++){
        printf("%c", x[i]^79);
    }


}

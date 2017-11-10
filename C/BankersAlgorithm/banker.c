#include <stdlib.h>
#include <stdio.h>

static int checkResources(int *max, int* all, int* av, int N){
    int n = 1;
    int i;
    for ( i = 0; i<N ;i++){
        n = n && ( max[i] - all[i] <= av[i] ? 1:0);
    }

    return n;
}

static void bankers( int (*max)[3], int (*all)[3], int *av, int *safe, int M, int N){
    int i,k;
    int *done;
    int n = 0;

    done = (int*)calloc(M , sizeof(int) );

    while(n < M){
        for (i = 0; i<M; i++){
            if (!done[i]){
                if ( checkResources(max[i], all[i], av, N) ){
                    safe[n] = i;
                    n++;
                    for( k = 0; k < N; k++) av[k] += all[i][k]; 
                    done[i] = 1;
                }
            } 
        }
    }

    free(done);
}


int main(){
    int max[5][3] = {
        {7,5,3},
        {3,2,2},
        {9,0,2},
        {2,2,2},
        {4,3,3} };

    int all[5][3] = {
        {0,1,0},
        {2,0,0},
        {3,0,2},
        {2,1,1},
        {0,0,2}};

    int av[3] = {3,3,2};

    int safe[5] = {0};
   
    bankers(max, all, av, safe, 5,3); 
    for(int k=0; k<5; k++)  printf("%i ", safe[k] );
    printf("\n");
    
}

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


/*
 M is the number of proccesses
 N is the number of resources
 */
static void bankers( int *max, int *all, int *av, int *safe, int M, int N){
    int i,k;
    int *done;
    int n = 0;

    done = (int*)calloc(M , sizeof(int) );

    while(n < M){
        for (i = 0; i<M; i++){
            if (!done[i]){
                if ( checkResources(max + i*N, all+ i*N, av, N) ){
                    safe[n] = i;
                    n++;
                    for( k = 0; k < N; k++) av[k] += all[i*N+k]; 
                    done[i] = 1;
                }
            } 
        }
    }

    free(done);
}


int main(){
    int i;
    int N, M;
    int *max, *all, *av, *safe;

    puts("-----------------------------");
    puts("  Banker's Algortihm Tester  ");
    puts("-----------------------------");

    printf("\nEnter the number of processes: ");
    scanf("%d", &M);

    printf("\nEnter the number of resources: ");
    scanf("%d", &N);


    max = (int *)calloc( N*M , sizeof(int));
    all= (int *)calloc( N*M , sizeof(int));
    av = (int *)calloc( N , sizeof(int));
    safe = (int *)calloc( M , sizeof(int)); 
   
    printf("\nEnter maximum resource table: start with the first row\n");
    for (i = 0; i < N*M; i++) {
            scanf("%d", max+i);
    }

    printf("\nEnter allocated resource table: start with the first row\n");
    for(i = 0; i < N*M; i++) {
            scanf("%d", all+i);
    }

    printf("\nEnter available resource table:\n");
    for(i = 0; i < N; i++) {
            scanf("%d", av+i);
    }

    bankers(max, all, av, safe, M,N); 
    for(int k=0; k<M; k++)  printf("%i ", safe[k] );
    printf("\n");
   
    free(safe);
    free(av);
    free(all);
    free(max); 
}

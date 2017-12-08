#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int random_dec(int current)
{
    int retVal = current - random()%10;
    return (retVal > 0) ? retVal : 0;
}

int main(int argc, char **argv)
{
    int myRank, numProcs;
    // TODO: Initialize MPI and obtain process identity
    MPI_Init(&argc, &argv );
    MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
        MPI_Comm_size(MPI_COMM_WORLD, &numProcs);
    
    // Rank-specific initialization of the random number generator
    srandom(MPI_Wtime() + myRank*100);

    int nextRank = (myRank + 1) % numProcs;
    int looserRank = -1;

    int countDownCounter = 50;

    // Rank 0 reads the initial timer value and starts the bomb
    if (myRank == 0) {
        if (argc > 1)  {
            countDownCounter = atoi(argv[1]);
            if (countDownCounter <= 0) exit(1);
        }
        printf("Counting down from %i\n", countDownCounter);
        // TODO: Throw the bomb in
        MPI_Send(&countDownCounter, 1, MPI_INT, nextRank,0 , MPI_COMM_WORLD);
    }

    int done = 0;
    int data;
    int i;
/*
    int d = done;
   for ( i=0; i<numProcs; i++){
    if( i != myRank ) {
        MPI_Recv(&done, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        d += done;
    }
   }
*/
    // TODO: Implement a loop that runs until the counter hits 0
    while ( (countDownCounter > 0)  ){
    // TODO: Get the data from previous rank
        int prevRank = (myRank - 1) % numProcs;
        prevRank = (prevRank <0)?(numProcs-1):prevRank;
        MPI_Recv(&countDownCounter, 1,
             MPI_INT, prevRank,0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

    // TODO: Decrement the counter
        countDownCounter = random_dec(countDownCounter);
        if (countDownCounter > 0){
            printf("Process %i has received the bomb (%i on the clock)"
               " and is still alive!\n", myRank, countDownCounter);
            // TODO: Pass the bomb on
            MPI_Send(&countDownCounter, 1, MPI_INT, nextRank,0 , MPI_COMM_WORLD);
        }
        else {
            printf("Process %i lost\n", myRank);
            // TODO: Notify all processes of who the looser is
            done = -1;
           for(  i=0; i<numProcs; i++){
                 if( i != myRank ) MPI_Send(&done, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
            }
        }
    }
    printf("I am process %i and %i is the looser\n", myRank, looserRank);

    // TODO: Finalize MPI
    MPI_Finalize();
    return 0;
}

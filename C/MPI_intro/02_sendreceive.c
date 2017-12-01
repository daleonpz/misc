#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int main(int argc, char **argv){
  int myRank, numProcs;
  int pingCount = 42;
  int pongCount = 0;

  // Initialize MPI
    MPI_Init(&argc, &argv);
  // Find out MPI communicator size and process rank
    MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
    MPI_Comm_size(MPI_COMM_WORLD, &numProcs);


  // Have only the first process execute the following code
  if ( myRank == 0) {
      printf("Sending Ping (# %i)\n", pingCount);
      // TODO: Send pingCount
      MPI_Send(

      // TODO: Receive pongCount

  }
  // TODO: Do proper receive and send in any other process
  else 
  {
      // TODO: Receive pingCount

      // TODO: calculate and send pongCount

      printf("Sending Pong (# %i)\n", pongCount);
  }

  // TODO: Finalize MPI

  return 0;
}

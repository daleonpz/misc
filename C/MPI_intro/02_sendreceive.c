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
      MPI_Send(&pingCount, 1, MPI_INT, 1,0,MPI_COMM_WORLD);

      // TODO: Receive pongCount
      MPI_Recv(&pongCount, 1, MPI_INT, 1,0,MPI_COMM_WORLD, MPI_STATUS_IGNORE);
  }
  // TODO: Do proper receive and send in any other process
  else 
  {
      // TODO: Receive pingCount
      MPI_Recv(&pingCount, 1, MPI_INT, 0,0,MPI_COMM_WORLD, MPI_STATUS_IGNORE);
      // TODO: calculate and send pongCount
      printf("Recieved Ping (# %i)\n", pingCount);
      pongCount = -1*pingCount;
      MPI_Send(&pongCount, 1, MPI_INT, 0,0,MPI_COMM_WORLD);
      printf("Sending Pong (# %i)\n", pongCount);
  }

  // TODO: Finalize MPI
    MPI_Finalize();
  return 0;
}

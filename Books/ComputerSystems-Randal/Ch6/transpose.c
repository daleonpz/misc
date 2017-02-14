#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void transpose(int *dst, int* src, int dim){
	int i,j;

	for ( i=0; i<dim; i++){
		for( j=0; j<dim; j++)
			dst[j*dim + i] = src[i*dim + j];
	}
}

void random_matrix(int* matrix, int msize){
	srand(time(NULL));
	for(int i=0; i<msize; i++) 
	      matrix[i] = rand() % 31 + 10;
}

void printm(int *m, int msize){
	for(int i=0; i<msize; i++) {
		for(int j=0; j<msize; j++)
			printf("%i\t",m[i*msize + j]);
		printf("\n");
	}

	printf("-------------------------\n\n");
}

int main(int argc, char *argv[] ){

	int n = 5;
	int matrix[n*n];
	int dst[n*n];
	random_matrix(matrix, n*n);

	transpose(dst, matrix, n);
	printm(matrix, n);
	printm(dst, n);

	return 1;
	
}



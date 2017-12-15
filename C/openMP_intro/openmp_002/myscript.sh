#!/bin/bash

export OMP_NUM_THREADS=1
echo $OMP_NUM_THREADS
./openmp_002 

export OMP_NUM_THREADS=2
echo $OMP_NUM_THREADS
./openmp_002 

export OMP_NUM_THREADS=3
echo $OMP_NUM_THREADS
./openmp_002 
export OMP_NUM_THREADS=4
echo $OMP_NUM_THREADS
./openmp_002 
export OMP_NUM_THREADS=6
echo $OMP_NUM_THREADS
./openmp_002 
export OMP_NUM_THREADS=8
echo $OMP_NUM_THREADS
./openmp_002 
export OMP_NUM_THREADS=16
echo $OMP_NUM_THREADS
./openmp_002 
export OMP_NUM_THREADS=32
echo $OMP_NUM_THREADS
./openmp_002 


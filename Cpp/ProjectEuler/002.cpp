#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <iomanip>
using namespace std;

double sumFibonacci(double N){
	
	double sum = 0 ;
	double fibSum = 1;
	double fibSumOld = 1;
	double tmp ;
	
	/*
	while( fibSum < N){
		
		if( fmodf(fibSum,2) == 0 ){
			sum += fibSum;
		}
		tmp = fibSum;
		fibSum += fibSumOld;
		fibSumOld = tmp;
		
	}
	*/
	
	if( N<2 ){ return 0;}
	
	sum = 0;
	fibSum = 2;
	fibSumOld = 0;
	
	while ( fibSum < N)
	{
		sum += fibSum;
		tmp = fibSum;
		fibSum = 4*fibSum + fibSumOld;
		fibSumOld = tmp;
	}
	
	return sum;
	
	}

int main() {
    
    float T;
    double n;
    cin >> T;
    
    vector<double> N;
    
    for(float i; i<T; i++){
		cin >> n;
		N.push_back(n);
	}
	
	for(vector<double>::iterator it = N.begin(); it!=N.end(); it++){
		cout << setprecision(32) << sumFibonacci(*it) << endl;
	}
    
    return 0;
}

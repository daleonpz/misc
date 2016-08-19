#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <iomanip>   
using namespace std;

float sumMultiples3_5( float N )
{
	float sum;
	float i ;
	
	i = floorf((N-1)/3);

	sum = 3*i*(i+1)/2;

	i = floorf( (N-1)/5);
	
	float j ;
	j = floorf(i/3);
	
	sum += 5*i*(i+1)/2 - 15*j*(j+1)/2;

/*
	cout << setprecision(32) << sum << endl;

	float n = 3;
	sum = 0;
	i = 1;
	while(n<N){
		sum += n;
		i +=1;
		n = 3*i;
		
	}
	cout << setprecision(32) << sum << endl;
	n = 5;
	i = 1;
	while(n<N){
		sum += n;
		i +=1;
		if (fmod(i,3)==0) {i+=1;}
		n = 5*i;
		
	}
	cout << setprecision(32) << sum << endl;
	* */
	return sum;
}


int main() {

	float T; 
	vector<float> N;
	float n;
	
	cin >> T;
	
	for (float i=0; i<T ; i++){
		cin >> n;
		N.push_back(n);
	}
	
	for(vector<float>::iterator it = N.begin(); it != N.end(); it++){
		cout << setprecision(32) << sumMultiples3_5(*it) << endl;	
	}
	
    return 0;
}

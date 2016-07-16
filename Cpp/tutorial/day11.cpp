#include <map>
#include <set>
#include <list>
#include <cmath>
#include <ctime>
#include <deque>
#include <queue>
#include <stack>
#include <string>
#include <bitset>
#include <cstdio>
#include <limits>
#include <vector>
#include <climits>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <numeric>
#include <sstream>
#include <iostream>
#include <algorithm>
using namespace std;

int getHourglass(vector< vector<int> > arr, int i ,int j ){
	
	int sum = arr[i][j];
	int k;
	for(k= -1 ; k<2; k++){
			sum = sum + arr[i-1][j+k];
	}
	
	for(k= -1 ; k<2; k++){
			sum = sum + arr[i+1][j+k];
	}
	
	return sum;

}

int main(){
    vector< vector<int> > arr(6,vector<int>(6));
    for(int arr_i = 0;arr_i < 6;arr_i++){
       for(int arr_j = 0;arr_j < 6;arr_j++){
          cin >> arr[arr_i][arr_j];
       }
    }
    
    int i,k;
    int tmp , max =  -2147483648;
    int ii = 1;
    int kk = 1;
    for( i=1; i<5 ; i++){
		for ( k=1 ; k<5 ; k++){
			tmp = getHourglass(arr,i,k) ;
			if (tmp>max){
				max = tmp;
				ii = i;
				kk = k;
			}
		}
	}
	
	cout << max << endl;
    /* 
    for(k= -1 ; k<2; k++){
		 cout << arr[ii-1][kk+k] << " " ;
	}
	
	cout << endl;
	cout << "  " << arr[ii][kk] << " " << endl;
	 
	for(k= -1 ; k<2; k++){
			cout << arr[ii+1][kk+k] << " " ;
	}
    cout << endl;
    * */
    return 0;
}

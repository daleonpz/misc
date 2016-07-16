#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    
    int num_inputs;
    
    cin >> num_inputs;
    cin.ignore();
    
    vector<string> s; // basically an array
    string phrase;
    
    int k;
    for (k=0 ; k<num_inputs; k++){
		getline(cin,phrase);
		/* Adds a new element at the end of the vector, after its current
		 * last element. The content of val is copied (or moved) to the new element.*/
		s.push_back(phrase); 
	}
    
    for (k=0; k<num_inputs; k++){
		for( int i=0; i<s[k].length() ;i+=2){
			cout << s[k][i];
		}
		cout << " ";
		for( int i=1; i<s[k].length() ;i+=2){
			cout << s[k][i];
		}
		cout << endl;
	}
    return 0;
}

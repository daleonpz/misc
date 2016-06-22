#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <map>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    
    map<string, int> phoneDirectory;
    
    string name;
    int number;
    
    int total;
    
    cin >> total;
    cin.ignore();
    
    for (int k=0; k < total; k++){	
		cin >> name >> number;
		phoneDirectory.emplace(name, number);
    }
    
    /*for (int k=0; k < total; k++){
		cin >> name;\
		* the number of queries can be variable */
	while (cin >> value){
		if ( phoneDirectory.find(name)  == phoneDirectory.end() ){
			cout << "Not found" << endl;
		}
		else
		{
			cout << name << "=" << phoneDirectory.find(name)->second << endl;
		}
	}
    
    
    return 0;
}

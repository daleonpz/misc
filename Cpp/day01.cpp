#include <string>
#include <iostream>
#include <iomanip>
#include <limits>


using namespace std;

int main(){
	
	int i= 4;
	double d = 4.0;
	string s = "HackerRank ";
	
	int si;
	double sd;
	string ss ;
	
	cin >> si;
	cin >> sd;
	cin.ignore();
	getline(cin, ss);
	
	cout << ( i + si ) << "\n";
	cout << fixed << setprecision(1) <<  ( d + sd ) << "\n";
	cout << ( s + ss ) << "\n";
	
	return 0;
	
	}

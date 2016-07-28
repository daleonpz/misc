#include <iostream>
#include <string>
#include <fstream> // file stream
#include <cstdlib>
using namespace std;

int main()
{
		ofstream outClientFile("client.txt",ios::out);
		
		if( !outClientFile )
		{
			cerr << "Error, couldn't open" << endl;
			exit(1);
		}
		
		cout << "Enter an accoutn, name and balance" << endl
			 << "Enter end-of-file to end input. \n?";
			 
		int account;
		string name;
		double balance;
		
		while(cin >> account >> name >> balance)
		{
			outClientFile << account << ' ' << name << ' ' << balance << endl;
			cout << "?";
		}
}

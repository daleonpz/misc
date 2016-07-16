#include <iostream>
#include <vector>

using namespace std;

template<typename C>
void printArray(vector<C> input)
	{
		for(C i : input ) cout << i << endl;
	} ;


int main() {
  
    vector<int> vInt{1, 2, 3};
    vector<string> vString{"Hello", "World"};
    
    printArray<int>(vInt); // <int> this confused me
    printArray<string>(vString);
    
    return 0;
}

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

class Difference {
    private:
    vector<int> elements;
  
  	public:
  	int maximumDifference;
  	
	Difference( vector<int> array){
		elements = array;
	}

	void computeDifference (){
		maximumDifference = 0;
		int max = 0;
		for (int k=0 ; k< elements.size(); k++)
			for ( int j=k+1; j< elements.size(); j++)
			{
				maximumDifference = abs(elements[k] - elements[j]);
				max = (max>=maximumDifference)?max:maximumDifference;
			}
		
		maximumDifference = max;
	}
  	
  	
}; // End of Difference class

int main() {
    int N;
    cin >> N;
    
    vector<int> a;
    
    for (int i = 0; i < N; i++) {
        int e;
        cin >> e;
        
        a.push_back(e);
    }
    
    Difference d(a);
    
    d.computeDifference();
    
    cout << d.maximumDifference;
    
    return 0;
}

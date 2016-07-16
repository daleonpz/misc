#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <cassert>
using namespace std;

template <typename C>
class AddElements{
		private:
			vector<C> elements;
		public:
			AddElements( C element){
				this->elements.push_back(element);
			}
			
			C add(C element){
				C sum =0;
				this->elements.push_back(element);
				for(C i: this->elements) sum+=i;
				
				return sum;
			}
	};
	
template <>
class AddElements<string>{
	private:
		string elements;
	public:
		AddElements( string element){
			this->elements = element;
		}
		
		string concatenate(string element){
			return this->elements + element;
		}
	};


int main () {
  int n,i;
  cin >> n;
  for(i=0;i<n;i++) {
    string type;
    cin >> type;
    if(type=="float") {
        double element1,element2;
        cin >> element1 >> element2;
        AddElements<double> myfloat (element1);
        cout << myfloat.add(element2) << endl;
    }
    else if(type == "int") {
        int element1, element2;
        cin >> element1 >> element2;
        AddElements<int> myint (element1);
        cout << myint.add(element2) << endl;
    }
    else if(type == "string") {
        string element1, element2;
        cin >> element1 >> element2;
        AddElements<string> mystring (element1);
        cout << mystring.concatenate(element2) << endl;
    }
  }
  return 0;
}

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
#include <unordered_map>

using namespace std;


int main(){
    int n;
    cin >> n;

	int totalCount = 0;
	int max = 0;
    
    while (n != 0)
    {
		totalCount = (n%2 == 1)?(totalCount+1):0;
		max = (totalCount >= max)?totalCount:max;
		n = n>>1;
	}
    
    cout << max << endl;
    
    return 0;
}

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    
    double 	mealCost, tip, tax;
    int		tipPercent, taxPercent, totalCost;
    
    cin >> mealCost >> tipPercent >> taxPercent;
        
    tip = mealCost * tipPercent / 100;
    tax = mealCost * taxPercent / 100;
    
    totalCost = round(mealCost + tip + tax);
    
    cout << "The total meal cost is " + to_string(totalCost) + " dollars." << endl;
    
    return 0;
}

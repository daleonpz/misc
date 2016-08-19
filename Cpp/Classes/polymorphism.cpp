#include <iostream>
#include <vector>
#include <map>
#include <string>
#include <algorithm>
#include <set>
#include <cassert>
using namespace std;

struct Node{
   Node* next;
   Node* prev;
   int value;
   int key;
   Node(Node* p, Node* n, int k, int val):prev(p),next(n),key(k),value(val){};
   Node(int k, int val):prev(NULL),next(NULL),key(k),value(val){};
};

class Cache{
   
   protected: 
   map<int,Node*> mp; //map the key to the node in the linked list
   int cp;  //capacity
   Node* tail; // double linked list tail pointer
   Node* head; // double linked list head pointer
   virtual void set(int, int) = 0; //set function
   virtual int get(int) = 0; //get function

};

class LRUCache: public Cache{
	private:
		Node** ptrHead = &head;
		Node** ptrTail = &tail;
	public:
		LRUCache(int cp){
			this->cp = cp;
			*ptrHead = new Node(1,0); // Initialize cache
			ptrTail = ptrHead; // Tail points to previus node
			ptrHead = &((*ptrHead)->next ); // Head points to next node
			this->mp.emplace(1, *ptrTail); // creating dictionary to change the value directly
			for (int i=2; i<=cp ;i++)
				{
					*ptrHead = new Node( *ptrTail, NULL, i, 0 );
					ptrTail = ptrHead;
					ptrHead =&((*ptrHead)->next );  
					this->mp.emplace(i, *ptrTail);
				}
		}
	
		void set(int k, int val){
			cout << mp.find(k)->second->value <<endl;
			mp.find(k)->second->value = val;
			cout << mp.find(k)->second->value <<endl;
			cout << mp.find(k)->second->prev->value <<endl;
			
		}
		
		int get(int k){
			if ( mp.find(k) == mp.end() )
				{
					return -1; 
				}
			else{
					return mp.find(k)->second->value;
				}
			}
	
};

int main() {
   int n, capacity,i;
   cin >> n >> capacity;
   LRUCache l(capacity);
   for(i=0;i<n;i++) {
      string command;
      cin >> command;
      if(command == "get") {
         int key;
         cin >> key;
         cout << l.get(key) << endl;
      } 
      else if(command == "set") {
         int key, value;
         cin >> key >> value;
         l.set(key,value);
      }
   }
   return 0;
}

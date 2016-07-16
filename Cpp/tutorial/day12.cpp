#include <iostream>
#include <vector>

using namespace std;

class Person{
	protected:
		string firstName;
		string lastName;
		int id;
	public:
		Person(string firstName, string lastName, int identification){
			this->firstName = firstName;
			this->lastName = lastName;
			this->id = identification;
		}
		void printPerson(){
			cout << "Name :" << lastName << ", " << firstName << "\nID: " << id << "\n";
		}
};

class Student: public Person{
	private: 
		vector<int> testScores;
	public:
		Student(string fn, string ln, int ids, vector<int> scores);
		char* calculate();
	};
	
	Student::Student(string fn, string ln, int ids, vector<int> scores ):Person( fn, ln, ids ){
			testScores = scores;
		}
	
	char* Student::calculate(){
		float avr = 0;

		for (auto i : testScores) avr += i;
		avr /= testScores.size() ;
		
		if ( avr < 40  ) {return "T";}
		else if ( avr < 55) {return  "D";}
		else if ( avr < 70) {return  "P";}
		else if ( avr < 80) {return  "A";}
		else if ( avr < 90) {return  "E";}
		else {return  "O";}
		
	}

int main() {
	string firstName;
  	string lastName;
	int id;
  	int numScores;
	cin >> firstName >> lastName >> id >> numScores;
  	vector<int> scores;
  	for(int i = 0; i < numScores; i++){
	  	int tmpScore;
	  	cin >> tmpScore;
		scores.push_back(tmpScore);
	}
	Student* s = new Student(firstName, lastName, id, scores);
	s->printPerson();
	cout << "Grade: " << s->calculate() << "\n";
	return 0;
}

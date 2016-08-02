#include <cmath>
#include <iostream>
#include <iomanip> 

using namespace std;

struct Point3D{
	double x;
	double y;
	double z;
} ;


void create_newPoint(struct Point3D *point){
	
	double x;
	
	cout << "Construction d'un nouveau point" << endl;
	cout << "Veuillez entrer x : "; 
	cin >> point->x;
	cout << "Veuillez entrer y : ";
	cin >> point->y;
	cout << "Veuillez entrer z : ";
	cin >> point->z;
}

struct TriangleSides{
	double x, y, z;
};

class Triangle {
	private:
		TriangleSides sides_;
	public:
		void setSides(struct Point3D *p1, struct Point3D *p2, struct Point3D *p3);
		bool isIsocele() const;
		double getPerimetre() const;
};

	void Triangle::setSides(struct Point3D *p1, struct Point3D *p2, struct Point3D *p3){
		sides_.x = (p1->x - p2->x)*(p1->x - p2->x) 
				+ (p1->y - p2->y)*(p1->y - p2->y)
				+ (p1->z - p2->z)*(p1->z - p2->z) ;
				
		sides_.y = (p1->x - p3->x)*(p1->x - p3->x) 
				+ (p1->y - p3->y)*(p1->y - p3->y)
				+ (p1->z - p3->z)*(p1->z - p3->z) ;
		
		sides_.z = (p3->x - p2->x)*(p3->x - p2->x) 
				+ (p3->y - p2->y)*(p3->y - p2->y)
				+ (p3->z - p2->z)*(p3->z - p2->z) ;
				
		sides_.x = sqrtf(sides_.x);
		sides_.y = sqrtf(sides_.y);
		sides_.z = sqrtf(sides_.z);
	}
	
	bool Triangle::isIsocele() const{
		return (sides_.x == sides_.y 
			&& sides_.y == sides_.z 
			&& sides_.x == sides_.x);
	}
	
	double Triangle::getPerimetre() const{
		return (sides_.x + sides_.y + sides_.z);
	}

int main (int argc, char *argv[]){
	
	double x, y, z;
	
	Point3D p1,p2,p3;
	
	Triangle tri;
	
	create_newPoint(&p1);
	create_newPoint(&p2);
	create_newPoint(&p3);
	
	tri.setSides(&p1, &p2, &p3);
	
	cout << "Périmètre: " << setprecision(32) << tri.getPerimetre() << endl;
	
	if (tri.isIsocele() ){
		cout << "Ce triangle est isocèle !" << endl;
	} 
	else {
		cout << "Ce triangle est isocèle pas!" << endl;
	}
	
	
	return 0;
	
	
}

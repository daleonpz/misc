#include <iostream>
#include <string>
#include <vector>
using namespace std;

// Pour simplifier
typedef string Forme   ;
typedef string Couleur ;

class Brique
{
private:
  Forme   forme   ;
  Couleur couleur ;

public:
  /*****************************************************
    Compléter le code à partir d'ici
  *******************************************************/
	Brique(Forme _forme, Couleur _couleur)
		:forme(_forme), couleur(_couleur) {}
		
	ostream& afficher(ostream& sortie) const{
		if (!this->couleur.empty()){
			sortie << "( " <<  couleur <<", " << forme << " )" << endl;
		}
		else { sortie << forme << endl;	}
		
		return sortie;
		}
};

	ostream& operator<<(ostream& sortie, const Brique& brique){
		return brique.afficher(sortie);
	}

class Construction
{
  friend class Grader;
 
  private:
	vector<vector<vector<Brique*>>> contenu;
	
  public:
	Construction(Brique& brique)
		:contenu(1,vector<vector<Brique*>>(1)){
			contenu[0][0].push_back(&brique);
		 }
	
	ostream& afficher(ostream& sortie) const{
		for (int i=contenu.size()-1; i>=0;i--){
			sortie << "Couche numéro :" << i << endl;
			for (int j=contenu[i].size()-1; j>=0; j--){
				sortie << contenu[i].size() << endl;
				for( int k=contenu[i][j].size()-1; k>=0; k--){
					sortie << *contenu[i][j][k] << endl ;
				}
			}		
		}
		return sortie;
	}
	
	vector<vector<vector<Brique*>>> getContenu () const{
		return contenu;
	}
	
	void operator^=(const Construction& top){
		this->contenu.push_back(top.getContenu()[0]);
	}
};

const Construction operator^(Construction bottom, const Construction& top){
	bottom ^= top;
	return bottom;
}
	
ostream& operator<<(ostream& sortie, const Construction& construction){
	return construction.afficher(sortie);
}

const Construction operator*(unsigned int n, Construction const& a)
{
}

const Construction operator/(unsigned int n, Construction const& a)
{
}

const Construction operator%(unsigned int n, Construction const& a)
{
}

/*******************************************
 * Ne rien modifier après cette ligne.
 *******************************************/

int main()
{
  // Modèles de briques
  Brique toitD("obliqueD", "rouge");
  Brique toitG("obliqueG", "rouge");
  Brique toitM(" pleine ", "rouge");
  Brique mur  (" pleine ", "blanc");
  Brique vide ("                 ", "");

  unsigned int largeur(4);
  unsigned int profondeur(3);
  unsigned int hauteur(3); // sans le toit
  Construction temp(mur);
  Construction temp2(toitG);
  
  cout << temp;
  temp^=temp2;
  cout << temp;
  temp^=temp2;
  cout << temp;
/*	
  // on construit les murs
  Construction maison( hauteur / ( profondeur % (largeur * mur) ) );

  // on construit le toit
  Construction toit(profondeur % ( toitG + 2*toitM + toitD ));
  toit ^= profondeur % (vide + toitG + toitD);

  // on pose le toit sur les murs
  maison ^= toit;

  // on admire notre construction
  cout << maison << endl;
*/
  return 0;
}

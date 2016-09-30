#include <iostream>
#include <vector>
#include <sstream>

using namespace std;

/*****************************************************
  * Compléter le code à partir d'ici
 *****************************************************/
class Produit{
	private: 
		string nom_;
	        string unite;
	
	public:
		Produit(string n, string u = "")
			:nom_(n), unite(u){}

		string getNom() const{ return nom_;  }
		string getUnite() const{ return unite; }

		virtual string toString( ) const{ 
			return  getNom(); 
		}
		
		virtual const Produit* adapter( double ) const{
			Produit* p = new Produit( nom_, unite  );
			return p;
		}

		virtual double quantiteTotale( const string& nomProduit  ) const{
			return nomProduit==getNom()?1:0;
		}
};

class Ingredient{
	private:
		Produit* produit_;
		double quantity_;
	
	public:
		Ingredient(const Produit& p, double q )
			:produit_(new Produit(p.getNom(), p.getUnite())),quantity_(q){}

		const Produit& getProduit() const{ return *produit_;  }
		double getQuantity() const{ return quantity_; }

		string descriptionAdaptee( ) {
			std::ostringstream os;

			os<< getQuantity();
			return os.str() + " " + getProduit().getUnite() 
				+ " de " + (getProduit().adapter( getQuantity()))->toString() ;
		//	return  os.str() + " " + getProduit().getUnite() 
		//		+ " de " + getProduit().getNom()  ;
		}

		string toString( ) const {
			return getProduit().toString();
		}

		double quantiteTotale(const string& nomProduit ) const{
			return getQuantity()*getProduit().quantiteTotale(nomProduit);
		}
};

class Recette{
	private:
		vector<Ingredient> listIn;
		double nbFois_;
		string nom_;
	
	public:
		Recette(string n, double t = 1 )
			:nom_(n), nbFois_(t){}

		void ajouter( const Produit& p, double q){
			listIn.push_back(  Ingredient(p, q*nbFois_) );
		}

		Recette adapter(double n){
			Recette  r( nom_, nbFois_*n  );
			for(auto it: listIn ) r.listIn.push_back( Ingredient(it.getProduit(), it.getQuantity()*n  ) );

			return r;
		}	

		string toString( ) const{
			string temp;
			std::ostringstream os;			

			os << nbFois_;

			temp = " Recette \"" + nom_ + "\" x " + os.str() ;

			double t=1; 
			
			for(auto it: listIn) 
			{
				std::ostringstream os;			
				os << t;
				temp +=  "\n " + os.str() + ". " + it.descriptionAdaptee();
//				cout << it.descriptionAdaptee();
				t+=1;
			}

			return temp;
		}		
		
		double quantiteTotale(const string& nomProduit) const  {
			double sum = 0;

			for (auto it: listIn) sum+= it.quantiteTotale(nomProduit);

			return sum;
		}

};

class ProduitCuisine: public Produit{
	private: 
		Recette recette;

	public: 
		ProduitCuisine(string n, string t = "portion(s)")
			:Produit(n,t),recette(n){}

		void ajouterARecette(const Produit& produit, double quantity ){
			recette.ajouter(produit, quantity);
		}

		const ProduitCuisine* adapter(double n) const override{
			ProduitCuisine*	p = new ProduitCuisine(getNom());
			p->recette.adapter(n);
			return p;
		}

		const Recette& getRecette() const{ return recette; }

		string  toString( ) const override {
		//	cout<< getNom() << "\n"  << recette.toString() ;
			return getNom()+"\n"+recette.toString();
		}
		
		double quantiteTotale( const string& nomProduit  ) const override{
			return nomProduit==getNom()?1:getRecette().quantiteTotale( nomProduit);
		}

};


/*******************************************
 * Ne rien modifier après cette ligne.
 *******************************************/
void afficherQuantiteTotale(const Recette& recette, const Produit& produit)
{
  string nom = produit.getNom();
  cout << "Cette recette contient " << recette.quantiteTotale(nom)
       << " " << produit.getUnite() << " de " << nom << endl;
}

int main()
{
  // quelques produits de base
  Produit oeufs("oeufs");
  Produit farine("farine", "grammes");
  Produit beurre("beurre", "grammes");
  Produit sucreGlace("sucre glace", "grammes");
  Produit chocolatNoir("chocolat noir", "grammes");
  Produit amandesMoulues("amandes moulues", "grammes");
  Produit extraitAmandes("extrait d'amandes", "gouttes");

  ProduitCuisine glacage("glaçage au chocolat");
  // recette pour une portion de glaçage:
  glacage.ajouterARecette(chocolatNoir, 200);
  glacage.ajouterARecette(beurre, 25);
  glacage.ajouterARecette(sucreGlace, 100);
  cout << glacage.toString() << endl;

  ProduitCuisine glacageParfume("glaçage au chocolat parfumé");
  // besoin de 1 portions de glaçage au chocolat et de 2 gouttes
  // d'extrait d'amandes pour 1 portion de glaçage parfumé

  glacageParfume.ajouterARecette(extraitAmandes, 2);
  glacageParfume.ajouterARecette(glacage, 1);
  cout << glacageParfume.toString() << endl;

  Recette recette("tourte glacée au chocolat");
  recette.ajouter(oeufs, 5);
  recette.ajouter(farine, 150);
  recette.ajouter(beurre, 100);
  recette.ajouter(amandesMoulues, 50);
  recette.ajouter(glacageParfume, 2);

  cout << "===  Recette finale  =====" << endl;
  cout << recette.toString() << endl;
  afficherQuantiteTotale(recette, beurre);
  cout << endl;

  // double recette
  Recette doubleRecette = recette.adapter(2);
  cout << "===  Recette finale x 2 ===" << endl;
  cout << doubleRecette.toString() << endl;

  afficherQuantiteTotale(doubleRecette, beurre);
  afficherQuantiteTotale(doubleRecette, oeufs);
  afficherQuantiteTotale(doubleRecette, extraitAmandes);
  afficherQuantiteTotale(doubleRecette, glacage);
  cout << endl;

  cout << "===========================\n" << endl;
  cout << "Vérification que le glaçage n'a pas été modifié :\n";
  cout << glacage.toString() << endl;

  return 0;
}

var jeune=0;
var adulte=0;
var vieux=0;
var x ;


//fonction pour caractere non conforme à un age

    

//fenetre Prompt


function fenetre(){
    x = window.prompt('Inserer votre Age');

 
   

}





// boucle permettant de trier et comptabiliser les valeurs 

fenetre();
while(isNaN(x)|| x<=0 || x==null){

    window.alert("Inserer un age valide");
   fenetre();
    
}

while (x>0 && x<=200) {

if(x>=0 && x<20) {
        jeune=jeune+1;
        fenetre();

    }
    
    else if (x>=20 && x<=40) {
            adulte= adulte+1;
            fenetre();
        }
        
    else if (x>40 ){


        vieux= vieux+1;
        if (x>100) {
            break;
        }
        fenetre();
    }

}



// affichage du resultat
console.log("jeune " + jeune);
   console.log("adulte " + adulte);
   console.log("vieux " + vieux);
window.alert("il y a eu : \n"+ jeune+" pers. de - de 20ans \n"+ adulte+" pers. entre 20 et 40 ans\n" + vieux+" pers. de plus de 40 ans" );






  


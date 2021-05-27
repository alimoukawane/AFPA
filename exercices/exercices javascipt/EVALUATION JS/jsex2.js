
var i=0;
var x;
var produit;

// focntion pour table de multiplication

function TableDeMultiplication(x){

    

    while(isNaN(x)|| x<=0 ){
        window.alert("Choissez un nombre valide");
        x = window.prompt( "quelle table de multiplication souhaitez vous?")
    }
    
    while( i<11){
    produit = i*x;
    document.write(i+" X "+ x+ " = "+ produit+"<br/>");
    i=i+1;
    
    }



x = window.prompt( "quelle table de multiplication souhaitez vous?")
TableDeMultiplication(x);





}






 











  


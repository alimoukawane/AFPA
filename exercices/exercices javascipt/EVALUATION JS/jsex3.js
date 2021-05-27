
var tab = ["Audrey", "Aurélien", "Flavien", "Jérémy", "Laurent", "Melik", "Nouara", "Salem", "Samuel", "Stéphane"];





var x = window.prompt("Rechercher un prénom :");
var place= tab.indexOf(x);
console.log(x);
console.log("index du prénom cherché "+place)+"\n";
console.log(tab+"<br/>");
console.log(tab.length);
maFonction(x);


function maFonction(x,place){

while (x!="0") {
    

var i =1;

if (place>=0 ) {
    var retire = tab.splice(place,1);
    var ajoute = tab.push(" ");
    window.alert("Le prénom à bien été supprimé de la liste");
    console.log(tab);

document.writeln(tab+"<br/>");
document.write(" nombre de valeur dans le tableau est tjrs de  : "+ (tab.length)+"<br/>");

    x=window.prompt("rechercher un nouveau prénom");
    place= tab.indexOf(x);

    
}else{
   

    window.alert( "Message d'erreur!!  le prénom n'est pas dans la liste" );
    document.write(tab);
    console.log(tab);
    x= window.prompt("Réessayez un autre  prénom");
    place= tab.indexOf(x);

}
}

}

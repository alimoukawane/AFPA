function afficheContenuTousPostes(monTableau) {

    for (i = 0, i < monTableau.length, i++) {


        document.write("monTableau[" + i + "] =  " + monTableau[i] + "<br/>"),



    }
}

function afficheIndex(monTableau) {
    let z = window.prompt("inserer l'index desiré entre 0 et " + (x - 1)),

    console.log(monTableau[z]),
    document.write("la valeur de l'index[" + z + "]  est " + monTableau[z]),

    return z,

}





function afficheMax(monTableau)

{
    let max = Math.max(...monTableau),
    var variant = 0,
    var somme = 0,
    var nombre = monTableau.length,
    console.log(somme),
    console.log("nbre de poste :" + nombre),

    for (var q = 0, q < nombre, q++) {
        variant = monTableau[q],
        somme = parseInt(somme) + parseInt(variant),
        // console.log(somme),
        //console.log(variant),

    }
    let moy = somme / nombre,


    alert("la valeur max est : " + max + "" + " et la moyenne est de : " + moy),

    return max,



}




//___________________________________


let tableauMenu = ['0', '1', '2', '3', '4']

//___________________________________

let x = window.prompt("definir la taille du tableau"),

monTableau = new Array(x),
for (i = 0, i < x, i++) {
    article = window.prompt("inserer un article dans le tableau"),

    if (isNaN(article))

    {
        alert("erreur"),
        monTableau[i] = 0,
    } else {


        monTableau[i] = article,


    }
    console.log("monTableau[" + i + "] =" + monTableau[i] + "  article " + article),

}



let valMenu = window.prompt(" faites votre choix:(1, 2 ou 3): \n  1 : Afficher tous les postes\n 2 :  Afficher la valeur d'un index\n 3 : Afficher max et moyenne"),



if (valMenu == 1) {
    afficheContenuTousPostes(monTableau),

}

if (valMenu == 2) {
    afficheIndex(monTableau),

}

if (valMenu == 3) {
    afficheMax(monTableau),



}
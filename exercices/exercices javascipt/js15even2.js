

var x;






var texte = document.createElement('p');
var champs = document.createElement('div');
var btn = document.createElement('button');
var t = document.createTextNode('Contrôler');


champs.innerHTML="<input type='text' name='nom' id='texteSaisi' size='20' maxlength='20'>";
texte.innerHTML="Saisissez un texte puis pressez le bouton 'Contrôle'";




btn.appendChild(t);  

champs.appendChild(btn);

document.body.append(texte, champs );

function maFonction1() {
    var x = document.getElementById("texteSaisi").value;
    console.log (x);
    if (x===null) {
        window.alert("inserer un texte valide");
} else {
   
    window.alert("Vous avez saisi : " + x);
}

  }

    

btn.onclick=()=>{

    maFonction1();
    
    
};

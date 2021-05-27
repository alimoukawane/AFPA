

var x;






let texte = document.createElement('p');
let champs = document.createElement('div');


champs.innerHTML="<input type='text' name='nom' id='texteSaisi' size='20' maxlength='20'><input type='submit' id='boutonValide' value='Contrôler'> ";
texte.innerHTML="Saisissez un texte puis pressez le bouton 'Contrôle'";







document.body.append(texte, champs, );

function maFonction1() {
    var x = document.getElementById("texteSaisi").value;
    
  }


    
let boutonValide=document.querySelector('#boutonValide');

console.log (boutonValide);

// boutonValide.addEventlistener('click',()=>{

//     window.alert("Vous avez saisi : " + x);
// });
// maFonction1();


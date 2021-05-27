document.querySelector('#a-supprimer').remove();

let header = document.createElement('header');
let sousHeader = document.createElement('nav');
let paragraphe = document.createElement('div');


header.style.backgroundColor ='#e3b04b';
header.style.text='22px';
header.style.color = "white";
header.innerHTML="<h1>Bienvenue</h1>";
document.body.append(header);

sousHeader.style.backgroundColor ='#f1d6ab';
sousHeader.innerHTML="<a href=''> Accueil / </a><a href=''>Une autre page  </a>" ;
document.body.append(sousHeader);


document.querySelector('h1').style.verticalAlign='90';
paragraphe.innerHTML="<p>Ceci est un paragraphe crée avec javascript</p>";
document.body.append(paragraphe);



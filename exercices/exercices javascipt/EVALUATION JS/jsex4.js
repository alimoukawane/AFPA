function calRem(tot){
    
return x;
}
//--------------------------------------------------------------------------------


var pu=0; //Prix unitaire
var qteCom=0; // quanté commandée
var port=0;


pu=window.prompt("Inserer le Prix unitaire :");
qteCom = window.prompt("Inserer le Prix unitaire :");
var tot=(pu*qteCom);
window.alert(tot);

var x=0;
    if(tot<100){
      x=0; 


    }
    if(tot>=100 && tot<=200){
         x= 5/100;

    }
if(tot>200){

    x=10/100;
}


console.log(x);
var rem=(x*tot);
console.log("la remise est de :"+ rem+ " Euros");

var port =6;
var totRem= tot-rem;

if(totRem>500){
    port=0;
}

if(totRem<=500){
    port=(2/100)*totRem;
    if(port<6){
        port=6;
    }
} 
var pap= parseInt( totRem) + parseInt( port);
console.log("le total remisé est de :"+totRem);
console.log("les frais de port sont de :"+port);
console.log( "le prix net à payer est de : "+pap );

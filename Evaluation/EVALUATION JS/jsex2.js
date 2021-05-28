var i = 0;



// focntion pour table de multiplication

function TableDeMultiplication(x) {



    if (isNaN(x) || x <= 0) {
        window.alert("Choissez un nombre valide");
        x = window.prompt("quelle table de multiplication souhaitez vous?");
    }

    for (i = 0; i < 11; i++) {
        var produit = i * x;
        document.write(i + " X " + x + " = " + produit + "<br/>");
        console.log(i + " X " + x + " = " + produit + "<br/>");

    }

}


var x = window.prompt("quelle table de multiplication souhaitez vous?");
TableDeMultiplication(x);
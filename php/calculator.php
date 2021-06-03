<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php

function calculator($a, $b){

    

    $addition= $a+$b;
    $soustraction=$a-$b;
    $division= $a/$b;
    $multiplication=$a*$b;

echo "la somme est de : ".$addition."<br>";
echo "la difference est de :".$soustraction."<br>";
echo " le quotient est de :". $division."<br>";
echo " le produit est de :". $multiplication."<br>";
}

calculator(14, 3);

?>
    
</body>
</html>
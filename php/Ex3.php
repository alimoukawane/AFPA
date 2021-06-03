<html>
    <body>
        <table border = '1'>
            <?php
                //Exercice 3 - Ecrire un script qui affiche la table de multiplication totale de {1,...,12} par {1,...,12}
                
               
               
                echo "<th>"." "."</th>";
                for ($a=0; $a<=12; $a++) {
                    echo "<th>".$a."</th>";
                }
               

                $b = 0;
                $c = array(0,1,2,3,4,5,6,7,8,9,10,11,12);
                echo "<tr>";
                for ($b=0; $b<=12; $b++) {
                    echo "<td>".$b."</td>";
                    for ($i=0; $i <= 12; $i++) {
                        echo "<td>".$b * $c[$i]." "."</td>";
                    } 
                    echo "<tr>";
                    
                }   
                ?>
        </table>
    </body>
</html>
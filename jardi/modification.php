<!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Modification d'un produit</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <?php
        require "connexion_bdd.php"; // Inclusion de notre bibliothèque de fonctions
        $db = connexionBase(); // Appel de la fonction de connexion
        $pro_id = $_GET["pro_id"];
   
        $requete1 = "SELECT cat_id, cat_nom, cat_parent FROM categories order by cat_nom";
        $result1 = $db->query($requete1);
    
        $requete = "SELECT * FROM produits where pro_id=".$pro_id;
        $result = $db->query($requete);
        $produit = $result->fetch(PDO::FETCH_OBJ); 

 
?>
    </head>
    <body> 
        <div class="container"> <!--container global de la page-->
                
            <?php include 'header/header.php'; ?>
       
            
            <div class="col-12 d-flex justify-content-center">
                <img src="public/images/<?=$pro_id?>" class="w-50" alt="Image responsive" title="<?=$pro_id.".".$produit->pro_photo;?>" >
            </div>

            

            <form name="Détail produit" id="Détail produit" method="POST" action="modification_script.php">
                <div class="form-group">
                    <label for="pro_id"><b>Identifiant Produit</b></label><input type="text" class="form-control" name="pro_id" id="pro_id" value="<?php echo $produit->pro_id?>" Readonly>
                    <label for="pro_ref"><b>Référence :</b></label><input type="text" class="form-control" name="pro_ref" id="pro_ref" value="<?php echo $produit->pro_ref?>">

                    <label for="cat_nom"><b>Catégorie :</b></label>
                    <select class="form-control" name="cat_nom" id="cat_nom">
             <?php
            
                    while ($row2= $result1->fetch(PDO::FETCH_OBJ))
                    {      
                     if($row2->cat_parent != NULL){
                            echo"<option value=".$row2->cat_id."";
                
                    // row1 : requête sur le produit                   
                    // row2 : requête sur la catégorie
                                    
                            if ($row2->cat_id == $produit->pro_cat_id) {echo" selected";}
                    
                            echo">".$row2->cat_nom."</option>\n"; //separation ligne SUR CODE SOURCE
                        }
                    }
            ?>
                  </select>
                    
                    <label for="pro_libelle"><b>Libéllé produit :</b></label><input type="text" class="form-control" name="pro_libelle" id="pro_libelle" value="<?php echo $produit->pro_libelle ?>">
                    <label for="pro_description"><b>Description produit :</b></label><input type="text" class="form-control" name="pro_description" id="pro_description" value="<?php echo $produit->pro_description?>">
                    <label for="pro_prix"><b>Prix :</b></label><input type="text" class="form-control" name="pro_prix" id="pro_prix" value="<?php echo $produit->pro_prix ?>">
                    <label for="pro_stock"><b>Quantité en stock :</b></label><input type="number" class="form-control" name="pro_stock" id="pro_stock" value="<?php echo $produit->pro_stock ?>">
                    <label for="pro_couleur"><b>Couleur Produit :</b></label><input type="text" class="form-control" name="pro_couleur" id="pro_couleur" value="<?php echo $produit->pro_couleur ?>">
                    
                    <label for="pro_photo"><b>Extension de la photo :</b></label>
                                <select class="form-control" name="pro_photo" id="pro_photo">
                                     <option <?php if ($produit->pro_photo == "jpg") {echo"selected";}?>>jpg</option>
                                     <option <?php if ($produit->pro_photo == "png") {echo"selected";}?>>png</option>
                                     <option <?php if ($produit->pro_photo == "gif") {echo"selected";}?>>gif</option>
                                </select>

                    <br>
                    <label for="pro_bloque"><b>Produit bloqué :</b></label>
                         <div class="form-check form-check-inline">
                            <label class="form-check-label" for="pro_bloque">Oui&nbsp</label><input class="form-check-input" type="radio" name="pro_bloque" id="pro_bloque1" value=1 <?php if ($produit->pro_bloque == 1) echo"checked"; ?>>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label" for="pro_bloque">Non&nbsp</label><input class="form-check-input" type="radio" name="pro_bloque" id="pro_bloque2" value=0  <?php if ($produit->pro_bloque == 0) echo"checked"; ?>>
                        </div>
                    <br>

                    <label for="pro_d_ajout"><b>Date d'ajout :</b></label><input type="text" class="form-control" name="pro_d_ajout" id="pro_d_ajout" value="<?php echo $produit->pro_d_ajout?>" Readonly>
                    <label for="pro_d_modif"><b>Date de modification :</b></label><input type="text" class="form-control" name="pro_d_modif" id="pro_d_modif" value='<?php echo date("yy-m-d");?>' Readonly>
                    
                   
                </div>  
            
                <?php 
                    if (isset ($_GET["erreur_ref"])){
                        if (($_GET["erreur_ref"]) == 1){
                            echo "Modification qui comporte un champs qui ne doit pas etre non null";
                            }
                    
                        if (($_GET["erreur_ref"]) == 3){
                            echo "Valeur Numérique psitive  pour le prix du produit, positive ou null pour le stock du produit";
                        }
                        if (($_GET["erreur_ref"]) == 4){
                            echo "La référence du produit existe déjà";
                        }
                        if  (($_GET["erreur_ref"]) == 5){
                            echo "Fichier non supporté";
                        }
                    }
                ?> 
           

            <div class="d-flex justify-content-center" name ="actionProduit">
                <a  class="btn btn-success" href="tableau.php">Retour</a>
                <button class="btn btn-primary ml-1" type="submit" name="submit" value="1" onclick="verif();">Enregistrer</button>
            </div>

            </form>

            <br>

        <?php include 'footer/footer.php'; ?>
<script>

    //vérifie si on envoit ou non le formulaire à "script_modif.php"
    function verif(){ 
        //Rappel : confirm() -> Bouton OK et Annuler, renvoit true ou false
        var resultat = confirm("Etes-vous certain de vouloir modifier cet enregistrement ?");

        //alert("retour :"+ resultat);

        if (resultat==false){
            alert("Vous avez annulé les modifications \nAucune modification ne sera apportée à cet enregistrement !");
            //annule l'évènement par défaut ... SUBMIT vers "script_modif.php"
            event.preventDefault();    
        }
    }
</script>
       
</div>



<!--<script src="public/js/evalContact.js"></script>-->
<!--fichiers Javascript nécessaires à Bootstrap-->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
    </html>

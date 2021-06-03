<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form action ="script_modif.php" method="post">

<div>
    <label>Identifiant de la station</label><br>
    <input type="text" value="<?php echo $row->sta_id ?>"  name="id" readonly> 
</div>
<br>

<div>
    <label for="nom_for_label">Nom de la station</label><br>
    <input type="text" value="<?php echo $row->sta_nom ?>" name="nom" id="nom_for_label">
</div>
<br>

<div>
    <label for="altitude_for_label">Altitude</label><br>
    <input type="text" value="<?php echo $row->sta_altitude ?>"  name="altitude" id="altitude_for_label">
</div>

<br>

<input type="submit" value="Valider les modifications">

</form>


    
</body>
</html>
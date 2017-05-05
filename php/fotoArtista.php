<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <title>Test singolo evento</title>
    <meta charset="utf-8">
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <script src="../js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body style="max-width:1200px; margin:0 auto;" >

 
        
    
<?php
$id_artista= $_POST["idArtista"];

include 'configurazione.php';
include 'connessione.php';
$sql=   "SELECT P.id, P.nome, P.cognome, P.alt_name, P.foto, P.foto_mini FROM Persona AS P WHERE P.id= ?";
    
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_artista);
$stmt->execute();
$stmt->bind_result($id, $nome, $cognome, $alt_name, $foto, $foto_mini);        
$stmt->fetch();
//HEADER
$daRitornare= '<div class="w3-container w3-orange w3-text-white"><h2>'.$nome.' '.$cognome.' <small>'.$alt_name.'</small></h2></div>';

$daRitornare.= '
<div id="paddingContenutoTranneHeader" class="w3-row w3-yellow">
    <div class="w3-half">
        <img src="'.$foto.'" class="w3-image" alt="! Nessuna foto inserita !">
    </div>';
    $daRitornare.= '
    <div class="w3-half padded">
        <div class="w3-white">
            <div class="w3-container w3-orange w3-text-white"><h3>Cambia foto</h3></div>
            <form action="uploadFotoArtista.php" method="post" enctype="multipart/form-data">
                <input type="file" name="fileToUpload" id="fileToUpload" class="w3-button w3-white">
                <input type="submit" value="Aggiorna foto artista" name="submit" class="w3-button w3-green w3-right">
                <input type="hidden" name="idArtista" id="idArtista" class="w3-button w3-white" value="'.$id_artista.'">
                <input type="hidden" name="urlAttuale" id="urlAttuale" class="w3-button w3-white" value="'.$foto.'">
                <input type="hidden" name="urlAttualeMini" id="urlAttualeMini" class="w3-button w3-white" value="'.$foto_mini.'">
            </form>
        </div>
    </div>
</div>';




$conn->close();


    
    echo $daRitornare;
    
?>
    
</body>

</html>
<?php
   


    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    
    
    $phpAV = $_POST["arrayValue"];

    $nome= $phpAV[0];
    $cognome = $phpAV[1];
    $alt_name = $phpAV[2];
    $titolo = $phpAV[3];
    $tipo = $phpAV[4];
    $link = $phpAV[5];

    $stmt = $conn->prepare("INSERT INTO Persona VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, NULL, NULL)");
    $stmt->bind_param("ssssiss", $nome, $cognome, $alt_name, $titolo, $tipo, $_POST["bio"], $link);
    $stmt->execute();
    $stmt->close();

?>
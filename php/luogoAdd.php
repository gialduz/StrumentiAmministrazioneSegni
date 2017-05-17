<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    
    
    $phpAV = $_POST["arrayValue"];


    $lettera= $phpAV[0];
    $colore = $phpAV[1];
    $nome = $phpAV[2];
    $latitudine = $phpAV[3];
    $longitudine = $phpAV[4];
    $citta = $phpAV[5];
    $tipo_via = $phpAV[6];
    $via = $phpAV[7];
    $numero_civico = $phpAV[8];
    
    $stmt = $conn->prepare("INSERT INTO Luogo VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL)");
    $stmt->bind_param("sssddsssis", $lettera, $colore, $nome, $latitudine, $longitudine, $citta, $tipo_via, $via, $numero_civico, $_POST["descrizione"]);
    $stmt->execute();
    $stmt->close();
?>
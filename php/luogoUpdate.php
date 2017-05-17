<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL    
    
    
    $phpAV = $_POST["arrayValue"];
    $id= $phpAV[0];
    $lettera= $phpAV[1];
    $colore= $phpAV[2];
    $nome= $phpAV[3];
    $latitudine= $phpAV[4];
    $longitudine= $phpAV[5];
    $citta= $phpAV[6];
    $tipo_via= $phpAV[7];
    $via= $phpAV[8];
    $numero_civico= $phpAV[9];
    $descrizione= $_POST["descrizioneE"];

    $stmt = $conn->prepare("UPDATE Luogo SET lettera= ?, colore= ?, nome= ?, latitudine= ?, longitudine= ?, citta= ?, tipo_via= ?, via= ?, numero_civico= ?, descrizione= ? WHERE id= ?");
    $stmt->bind_param("sssddsssisi", $lettera, $colore, $nome, $latitudine, $longitudine, $citta, $tipo_via, $via, $numero_civico, $descrizione, $id);
    $stmt->execute();
    $stmt->close();

?>
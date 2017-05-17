<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    
    
    $phpAV = $_POST["arrayValue"];
    $id= $phpAV[0];
    $nome= $phpAV[1];
    $cognome= $phpAV[2];
    $alt_name= $phpAV[3];
    $titolo= $phpAV[4];
    $tipo= $phpAV[5];

    $stmt = $conn->prepare("UPDATE Persona SET nome=?, cognome=?, alt_name=?, titolo=?, tipologia=?, biografia=? WHERE id= ?");
    $stmt->bind_param("ssssisi", $nome, $cognome, $alt_name, $titolo, $tipo, $_POST["bio"], $id);
    $stmt->execute();
    $stmt->close();
?>
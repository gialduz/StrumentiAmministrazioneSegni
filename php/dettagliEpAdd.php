<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $idTipo= $_POST[idTipo];
    if($idTipo== 'aggiungiRapporto'){
        $stmt = $conn->prepare("SELECT id FROM tipologiaEventoPersona WHERE 1 ORDER BY id DESC LIMIT 1");
        $stmt->bind_result($idTipo);        
        $stmt->execute();
        $stmt->fetch();
        $stmt->close();
    }

    $stmt = $conn->prepare("INSERT INTO eventoPersona VALUES (NULL, ?, ?, ?);");
    $stmt->bind_param("iii", $_POST[idEvento], $_POST[idPersona], $idTipo);
    $stmt->execute();
    $stmt->close();
?>
<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    
    $stmt = $conn->prepare("INSERT INTO tipologiaEventoPersona VALUES (NULL, ?)");
    $stmt->bind_param("s", $nuovoTipoEP);
    $nuovoTipoEP = $_POST[nuovoTipo];
    $stmt->execute();
    $stmt->close();
?>
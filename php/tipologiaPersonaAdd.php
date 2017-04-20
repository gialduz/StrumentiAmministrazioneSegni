<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $stmt = $conn->prepare("INSERT INTO tipologiaPersona VALUES (NULL, ?)");
    $stmt->bind_param("s", $nuovoTP);
    $nuovoTP = $_POST[nuovoTipo];
    $stmt->execute();
    $stmt->close();
?>
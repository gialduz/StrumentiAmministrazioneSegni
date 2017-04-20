<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $stmt = $conn->prepare("INSERT INTO tipologiaEvento VALUES (NULL, ?, NULL)");
    $stmt->bind_param("s", $nuovoTE);
    $nuovoTE = $_POST[nuovoTipo];
    $stmt->execute();
    $stmt->close();
?>
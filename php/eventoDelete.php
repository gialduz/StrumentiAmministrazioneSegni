<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $stmt = $conn->prepare("DELETE FROM Evento WHERE id = ?");
    $stmt->bind_param("i", $_POST["daCancellare"]);
    $stmt->execute();
    $stmt->close();
?>
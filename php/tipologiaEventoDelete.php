<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $stmt = $conn->prepare("DELETE FROM tipologiaEvento WHERE id=?");
    $stmt->bind_param("i", $idTE);
    $idTE = $_POST[idTipoEvento];
    $stmt->execute();
    $stmt->close();
?>
<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $stmt = $conn->prepare("DELETE FROM tipologiaPersona WHERE id=?");
    $stmt->bind_param("i", $idTP);
    $idTP = $_POST[idTipoPersona];
    $stmt->execute();
    $stmt->close();
?>
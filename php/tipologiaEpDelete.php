<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQ

    $stmt = $conn->prepare("DELETE FROM tipologiaEventoPersona WHERE id=?");
    $stmt->bind_param("i", $idTipoEP);
    $idTipoEP = $_POST[idTipoEP];
    $stmt->execute();
    $stmt->close();
?>
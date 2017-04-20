<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $stmt = $conn->prepare("UPDATE eventoPersona SET id_persona= ?, tipologia= ? WHERE id_istanza= ?");
    $stmt->bind_param("iii", $_POST[idPersonaEP], $_POST[idRapportoEP], $_POST[idIstanzaEP]);
    $stmt->execute();
    $stmt->close();
?>
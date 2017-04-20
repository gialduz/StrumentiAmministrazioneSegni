<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    
    $stmt = $conn->prepare("DELETE FROM eventoPersona WHERE id_istanza = ?");
    $stmt->bind_param("i", $_POST[idIstanzaEP]);
    $stmt->execute();
    $stmt->close();

?>
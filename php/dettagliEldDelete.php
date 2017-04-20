<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    
    $stmt = $conn->prepare("DELETE FROM eventoLuogoData WHERE id_istanza = ?");
    $stmt->bind_param("i", $_POST[idIstanza]);
    $stmt->execute();
    $stmt->close();
?>
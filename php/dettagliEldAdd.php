<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL


    $idLuogo = $_POST[idLuogo];
    $idEvento = $_POST[idEvento];

    $data = '2017-'.$_POST[mese].'-'.$_POST[giorno];
    $orario = ''.$_POST[ora].':'.$_POST[minuto].':00';
    $data_ora = $data." ".$orario;
    $speciale = $_POST["speciale"];

    $stmt = $conn->prepare("INSERT INTO eventoLuogoData VALUES (NULL, ?, ?, ?, ?, '', ?, ?);");

    $stmt->bind_param("iisssi", $idEvento, $idLuogo, $data, $orario, $data_ora, $speciale);
    $stmt->execute();
    $stmt->close();
?>
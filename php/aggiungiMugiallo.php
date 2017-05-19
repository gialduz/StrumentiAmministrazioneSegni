<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL


    $idLuogo = 27;
    $idEvento = 93;

    $data = '2017-12-09';
    $orario = '12:46:00';
    $data_ora = $data." ".$orario;
    $speciale = 0;

    $stmt = $conn->prepare("INSERT INTO eventoLuogoData VALUES (NULL, ?, ?, ?, ?, '', ?, ?);");

    $stmt->bind_param("iisssi", $idEvento, $idLuogo, $data, $orario, $data_ora, $speciale);
    $stmt->execute();
    $stmt->close();
?>
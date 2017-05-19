<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $data = '2017-'.$_POST[mese].'-'.$_POST[giorno];
    $orario = ''.$_POST[orario].':'.$_POST[minuto].':00';
    $data_ora = $data." ".$orario;
    $id_istanza = $_POST[idIstanza];
    $speciale = $_POST[speciale];

    $stmt = $conn->prepare("UPDATE eventoLuogoData SET data_ora= ?, speciale= ? WHERE id_istanza = ?");
    $stmt->bind_param("sii", $data_ora, $speciale, $id_istanza);
    $stmt->execute();
    $stmt->close();
?>
<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
    
    $phpAV = $_POST["arrayValue"];

    $id= $phpAV[0];
    $nome= test_input($phpAV[1]);
    $luogo= $phpAV[2];
    $durata= ($phpAV[3]);
    $tipo= test_input($phpAV[4]);
    $eta_min= ($phpAV[5]);
    $eta_max= ($phpAV[6]);
    $ticket= ($phpAV[7]);
    $speciale_ragazzi= $phpAV[8];

    $stmt = $conn->prepare("UPDATE Evento SET nome= ?, luogo= ?, durata= ?, tipologia= ?, eta_min= ?, eta_max= ?, ticket= ?, speciale_ragazzi= ?, descrizione_ita= ? WHERE id= ?");
    $stmt->bind_param("siiiiiiisi", $nome, $luogo, $durata, $tipo, $eta_min, $eta_max, $ticket, $speciale_ragazzi, $_POST["dITA"], $id);
    $stmt->execute();
    $stmt->close();
?>
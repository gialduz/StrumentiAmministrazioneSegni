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
    $nome= str_replace("'", "''",$nome);
    $durata= ($phpAV[2]);
    $tipo= test_input($phpAV[3]);
    $eta_min= ($phpAV[4]);
    $eta_max= ($phpAV[5]);
    $ticket= ($phpAV[6]);
    $speciale_ragazzi= $phpAV[7];

    $stmt = $conn->prepare("UPDATE Evento SET nome= ?, durata= ?, tipologia= ?, eta_min= ?, eta_max= ?, ticket= ?, speciale_ragazzi= ?, descrizione_ita= ?, descrizione_eng= ? WHERE id= ?");
    $stmt->bind_param("siiiiiissi", $nome, $durata, $tipo, $eta_min, $eta_max, $ticket, $speciale_ragazzi, $_POST["dITA"], $_POST["dENG"], $id);
    $stmt->execute();
    $stmt->close();
?>
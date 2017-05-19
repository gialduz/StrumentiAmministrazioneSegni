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

    $nome= test_input($phpAV[0]);
    $luogo = $phpAV[1];
    $durata = $phpAV[2];
    $tipo = $phpAV[3];
    $eta_min = $phpAV[4];
    $eta_max = $phpAV[5];
    $ticket = $phpAV[6];
    $speciale_ragazzi = $phpAV[7];
    $descrizione_ita = $_POST["dITA"];

    $stmt = $conn->prepare("INSERT INTO Evento (id, nome, luogo, durata, tipologia, eta_min, eta_max, ticket, speciale_ragazzi, descrizione_ita)
    VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("siiiiiiis", $nome, $luogo, $durata, $tipo, $eta_min, $eta_max, $ticket, $speciale_ragazzi, $descrizione_ita);
    $stmt->execute();
    $stmt->close();
?>
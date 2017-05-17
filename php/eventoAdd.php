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
    $durata = $phpAV[1];
    $tipo = $phpAV[2];
    $eta_min = $phpAV[3];
    $eta_max = $phpAV[4];
    $ticket = $phpAV[5];
    $speciale_ragazzi = $phpAV[6];
    $descrizione_ita = $_POST["dITA"];
    $descrizione_eng = $_POST["dENG"];

    $stmt = $conn->prepare("INSERT INTO Evento (id, nome, durata, tipologia, eta_min, eta_max, ticket, speciale_ragazzi, descrizione_ita, descrizione_eng)
    VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("siiiiiiss", $nome, $durata, $tipo, $eta_min, $eta_max, $ticket, $speciale_ragazzi, $descrizione_ita, $descrizione_eng);
    $stmt->execute();
    $stmt->close();
?>
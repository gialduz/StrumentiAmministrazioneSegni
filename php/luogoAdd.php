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


    $lettera= test_input($phpAV[0]);
    $colore = test_input($phpAV[1]);
    $nome = test_input($phpAV[2]);
    $nome= str_replace("'", "''",$nome);
    $latitudine = $phpAV[3];
    $longitudine = $phpAV[4];
    $citta = $phpAV[5];
    $tipo_via = $phpAV[6];
    $via = $phpAV[7];
    $numero_civico = $phpAV[8];
    
    $stmt = $conn->prepare("INSERT INTO Luogo VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL)");
    $stmt->bind_param("sssddsssis", $lettera, $colore, $nome, $latitudine, $longitudine, $citta, $tipo_via, $via, $numero_civico, $_POST["descrizione"]);
    $stmt->execute();
    $stmt->close();
?>
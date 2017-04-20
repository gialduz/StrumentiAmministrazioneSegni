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
    $lettera= test_input($phpAV[1]);
    $colore= $phpAV[2];
    $nome= $phpAV[3];
    $nome= str_replace("'", "''",$nome);
    $latitudine= ($phpAV[4]);
    $longitudine= test_input($phpAV[5]);
    $citta= ($phpAV[6]);
    $tipo_via= ($phpAV[7]);
    $via= ($phpAV[8]);
    $numero_civico= $phpAV[9];

    $stmt = $conn->prepare("UPDATE Luogo SET lettera= ?, colore= ?, nome= ?, latitudine= ?, longitudine= ?, citta= ?, tipo_via= ?, via= ?, numero_civico= ? WHERE id= ?");
    $stmt->bind_param("sssddsssii", $lettera, $colore, $nome, $latitudine, $longitudine, $citta, $tipo_via, $via, $numero_civico, $id);
    $stmt->execute();
    $stmt->close();

?>
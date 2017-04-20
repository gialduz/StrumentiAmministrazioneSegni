<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        $data= str_replace("'", "''",$data);//raddoppia apostrofo -> singolo apostrofo in sql, query vanno

        return $data;
    }
    
    $phpAV = $_POST["arrayValue"];

    $nome= test_input($phpAV[0]);
    $cognome = test_input($phpAV[1]);
    $alt_name = test_input($phpAV[2]);
    $titolo = test_input($phpAV[3]);
    $tipo = $phpAV[4];

    $stmt = $conn->prepare("INSERT INTO Persona VALUES (NULL, ?, ?, ?, ?, ?, 'testBio')");
    $stmt->bind_param("ssssi", $nome, $cognome, $alt_name, $titolo, $tipo);
    $stmt->execute();
    $stmt->close();

?>
<?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        $data= str_replace("'", "''",$data);
        return $data;
    }
    
    $phpAV = $_POST["arrayValue"];
    $id= $phpAV[0];
    $nome= test_input($phpAV[1]);
    $cognome= test_input($phpAV[2]);
    $alt_name= test_input($phpAV[3]);
    $titolo= test_input(($phpAV[4]));
    $tipo= $phpAV[5];

    $stmt = $conn->prepare("UPDATE Persona SET nome=?, cognome=?, alt_name=?, titolo=?, tipologia=? WHERE id= ?");
    $stmt->bind_param("ssssii", $nome, $cognome, $alt_name, $titolo, $tipo, $id);
    $stmt->execute();
    $stmt->close();
?>
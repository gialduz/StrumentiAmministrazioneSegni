<?php   

function stampaEventoAmministratore($conn) {
    // QUERY SELECT TABELLA EVENTO

    
    $stmt = $conn->prepare("SELECT E.id, E.nome AS evento, E.durata, E.eta_min, E.eta_max, E.ticket, E.speciale_ragazzi, E.descrizione_eng, tE.id AS tipoNum, tE.nome AS tipo FROM Evento AS E INNER JOIN tipologiaEvento AS tE ON e.tipologia=tE.id ORDER BY E.id");
    $stmt->execute();
    $stmt->bind_result($id, $evento, $durata, $eta_min, $eta_max, $ticket, $speciale_ragazzi, $descrizione_eng, $tipoNum, $tipo);
    

    $daRitornare="<table id='tabellaEventi' style='width:100%'>
                <th>id</th>
                <th>nome</th>
                <th>durata</th>
                <th>tipologia</th>
                <th>eta_min</th>
                <th>eta_max</th>
                <th>ticket</th>
                <th>speciale_ragazzi</th>
                <th>descrizioni?</th>
                <th>UPADTE</th>
                <th>DELETE</th>";

    while($stmt->fetch()) {
        $daRitornare.= "<tr class='nr'>"
            ."<td>" . $id."</td><td>" . $evento. "</td><td>" 
            . $durata. "</td><td class='uppato'>" 
            . $tipo.  "<p hidden class='idTipo'>#".$tipoNum."</p>" ."</td><td>" 
            . $eta_min."</td><td>" 
            . $eta_max. "</td><td>" 
            . $ticket. "</td><td>" 
            . $speciale_ragazzi. "</td><td>" 
            . $descrizione_eng. "</td>"."<td><a href='#' onClick='return false;'><img src='../img/edit_icon.png' style='max-width:25px' class='resp editBtn'></a></td>" 
            ."<td><a href='#' onClick='return false;'><img src='../img/cancel_icon.png' style='max-width:25px' class='resp delBtn'></a></td>" 
            ."</tr>";
    }

    $daRitornare.= "</table>";    
    $stmt->close();

    return $daRitornare."<p class='w3-text-white'>Posso dirti di esser calmo anche se non lo sono</p> ";
}


function stampaLuogoAmministratore($conn) {
    // QUERY SELECT TABELLA Luogo
    $stmt = $conn->prepare("SELECT * FROM Luogo AS L ORDER BY id");
    $stmt->execute();
    $stmt->bind_result($id, $id_lettera, $colore, $nome, $latitudine, $longitudine, $citta, $tipo_via, $via, $numero_civico);

    $daRitornare="<table id='tabellaLuoghi' style='width:100%'>
                <th>id</th>
                <th>id_lett</th>
                <th>colore</th>
                <th>nome</th>
                <th>latitudine</th>
                <th>longitudine</th>
                <th>citta?</th>
                <th>tipo_via</th>
                <th>via</th>
                <th>numero_civico</th>

                <th>UPADTE</th>
                <th>DELETE</th>";

    while($stmt->fetch()) {
        $daRitornare.= "<tr class='nr'>"
            ."<td>" . $id."</td><td>" . $id_lettera. "</td><td style='background-color: ".$colore."'>" 
            . $colore. "</td><td class='uppato'>" 
            . $nome.  "</td><td>" 
            . $latitudine."</td><td>" 
            . $longitudine. "</td><td>" 
            . $citta. "</td><td>" 
            . $tipo_via. "</td><td>"
            . $via. "</td><td>"
            . $numero_civico. "</td>"."<td><a href='#' onClick='return false;'><img src='../img/edit_icon.png' style='max-width:25px' class='resp editBtn'></a></td>" 
            ."<td><a href='#' onClick='return false;'><img src='../img/cancel_icon.png' style='max-width:25px' class='resp delBtn'></a></td>" 
            ."</tr>";
    }

    $daRitornare.= "</table>";    
    $stmt->close();
    return $daRitornare."<p class='w3-text-white'>Posso dirti di esser calmo anche se non lo sono</p> ";
}


function stampaPersonaAmministratore($conn) {
        // QUERY SELECT TABELLA Persona
    $stmt = $conn->prepare("SELECT P.id, P.nome, P.cognome, P.alt_name, P.titolo, P.tipologia, P.biografia, tP.nome FROM Persona AS P INNER JOIN tipologiaPersona AS tP ON P.tipologia=tP.id ORDER BY P.id");
    $stmt->execute();
    $stmt->bind_result($id, $nome, $cognome, $alt_name, $titolo, $id_tipologia, $biografia, $nome_tipologia);
    
    $daRitornare="<table id='tabellaPersona' style='width:100%'>
                    <th>id</th>
                    <th>nome</th>
                    <th>cognome</th>
                    <th>alt_name</th>
                    <th>titolo</th>
                    <th>tipologia</th>

                    <th>UPADTE</th>
                    <th>DELETE</th>";
    
    while($stmt->fetch()) {
        $daRitornare.= "<tr class='nr'>"
            ."<td>" 
            . $id."</td><td>" 
            . $nome. "</td><td>" 
            . $cognome. "</td><td>" 
            . $alt_name.  "</td><td>" 
            . $titolo.  "</td><td>" 
            . $nome_tipologia.  "<p hidden class='idTipoPers'>#".$id_tipologia."</p>" ."</td>" 
            ."<td><a href='#' onClick='return false;'><img src='../img/edit_icon.png' style='max-width:25px' class='resp editBtn'></a></td>" 
            ."<td><a href='#' onClick='return false;'><img src='../img/cancel_icon.png' style='max-width:25px' class='resp delBtn'></a></td>" 
            ."</tr>";
    }
    $daRitornare.= "</table>";    
    $stmt->close();
    return $daRitornare."<p class='w3-text-white'>Posso dirti di esser calmo anche se non lo sono</p> ";
}


?>
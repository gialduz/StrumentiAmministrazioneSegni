<?php   

function stampaEventoAmministratore($conn) {
    // QUERY SELECT TABELLA EVENTO

    
    $stmt = $conn->prepare("SELECT E.id, E.nome, L.id, L.nome, E.durata, E.eta_min, E.eta_max, E.ticket, E.speciale_ragazzi, E.famiglia, E.scuola, E.descrizione_ita, tE.id AS tipoNum, tE.nome AS tipo, E.foto FROM ((Evento AS E INNER JOIN tipologiaEvento AS tE ON E.tipologia=tE.id) INNER JOIN Luogo AS L ON E.luogo=L.id) ORDER BY E.id");
    $stmt->execute();
    $stmt->bind_result($id, $evento, $id_luogo, $nome_luogo, $durata, $eta_min, $eta_max, $ticket, $speciale_ragazzi, $famiglia, $scuola, $descrizione_ita, $tipoNum, $tipo, $foto);
    

    $daRitornare="<table id='tabellaEventi' style='width:100%' cellspacing='0'>
                <th>id</th>
                <th>nome</th>
                <th>luogo</th>
                <th>durata</th>
                <th>tipologia</th>
                <th>eta_min</th>
                <th>eta_max</th>
                <th>ticket</th>
                <th>sTeen</th>
                <th>famiglie</th>
                <th>scuole</th>
                <th>ITA</th>
                <th>foto</th>             
                
                <th>Edit</th>
                <th>Canc</th>";

    while($stmt->fetch()) {
        if($foto){
            $foto='<img class="w3-image" src="'.$foto.'">'; 
        }else{$foto='NO';}
        
        $daRitornare.= "<tr class='nr'>"
            ."<td>" . $id. "</td><td>" . $evento. "</td><td>" 
           // . $luogo. "</td><td>"
            . $nome_luogo.  "<p hidden class='idLuogo'>#".$id_luogo."</p>" ."</td><td>" 
            . $durata. "</td><td class='uppato'>" 
            . $tipo.  "<p hidden class='idTipo'>#".$tipoNum."</p>" ."</td><td>" 
            . $eta_min."</td><td>" 
            . $eta_max. "</td><td>" 
            . $ticket. "</td>"
            ."<td>" . $speciale_ragazzi. "</td>"
            ."<td>" . $famiglia. "</td>"
            ."<td>" . $scuola. "</td>"
            ."<td><p class='testoTagliato'>" . $descrizione_ita. "</p></td>"
            ."<td><a href='processaFotoEvento.php?id=".$id."'>". $foto.  "</a></td>"
            ."<td><a href='#' onClick='return false;'><img src='../img/edit_icon.png' style='max-width:25px' class='resp editBtn'></a></td>" 
            ."<td><a href='#' onClick='return false;'><img src='../img/cancel_icon.png' style='max-width:25px' class='resp delBtn'></a></td>" 
            ."</tr>";
    }

    $daRitornare.= "</table>";    
    $stmt->close();

    return $daRitornare."<p class='w3-text-white'>Posso dirti di esser calmo anche se non lo sono</p> ";
}


function stampaLuogoAmministratore($conn) {
    // QUERY SELECT TABELLA Luogo
    $stmt = $conn->prepare("SELECT * FROM Luogo AS L ORDER BY L.lettera");
    $stmt->execute();
    $stmt->bind_result($id, $id_lettera, $colore, $nome, $latitudine, $longitudine, $citta, $tipo_via, $via, $numero_civico, $descrizione, $foto);

    $daRitornare="<table id='tabellaLuoghi' style='width:100%' cellspacing='0'>
                <th>id</th>
                <th>id_lett</th>
                <th>colore</th>
                <th>nome</th>
                <th>latitudine</th>
                <th>longitudine</th>
                <th>citta?</th>
                <th>tipo_via</th>
                <th>via</th>
                <th>n.civ</th>
                <th>descrizione</th>
                <th>foto</th>

                <th>Edit</th>
                <th>Canc</th>";

    while($stmt->fetch()) {
        if($foto){
            $foto='<img class="w3-image" src="'.$foto.'">'; 
        }else{$foto='NO';}
        
        $daRitornare.= "<tr class='nr'>"
            ."<td>" . $id."</td><td>" . $id_lettera. "</td><td style='background-color: ".$colore."'>" 
            . $colore. "</td><td class='uppato'>" 
            . $nome.  "</td><td>" 
            . $latitudine."</td><td>" 
            . $longitudine. "</td><td>" 
            . $citta. "</td><td>" 
            . $tipo_via. "</td><td>"
            . $via. "</td><td>"
            . $numero_civico. "</td>"
            ."<td><p class='testoTagliato'>".$descrizione."</p></td>"
            ."<td><a href='processaFotoLuogo.php?id=".$id."'>". $foto.  "</a></td>"
            ."<td><a href='#' onClick='return false;'><img src='../img/edit_icon.png' style='max-width:25px' class='resp editBtn'></a></td>"
            ."<td><a href='#' onClick='return false;'><img src='../img/cancel_icon.png' style='max-width:25px' class='resp delBtn'></a></td>" 
            ."</tr>";
    }

    $daRitornare.= "</table>";    
    $stmt->close();
    return $daRitornare."<p class='w3-text-white'>Posso dirti di esser calmo anche se non lo sono</p> ";
}


function stampaPersonaAmministratore($conn) {
        // QUERY SELECT TABELLA Persona
    $stmt = $conn->prepare("SELECT P.id, P.nome, P.cognome, P.alt_name, P.titolo, P.tipologia, tP.nome, P.biografia, P.foto_mini, P.link FROM Persona AS P INNER JOIN tipologiaPersona AS tP ON P.tipologia=tP.id WHERE (tP.id = 1 || tP.id = 2) ORDER BY P.id");
    $stmt->execute();
    $stmt->bind_result($id, $nome, $cognome, $alt_name, $titolo, $id_tipologia, $nome_tipologia, $biografia, $foto, $link);
    

    
    
    $daRitornare="<table id='tabellaPersona' style='width:100%' cellspacing='0'>
                    <th>id</th>
                    <th class='soloFormPersona'>nome</th>
                    <th class='soloFormPersona'>cognome</th>
                    <th>alt_name</th>
                    <th class='soloFormPersona'>titolo</th>
                    <th>tipologia</th>
                    <th>biografia</th>
                    <th>link</th>
                    <th>foto</th>

                    <th>Edit</th>
                    <th>Canc</th>";
    
    while($stmt->fetch()) {
        if($foto){
            $foto='<div class="imgQuadrataArtista" style="background-image: url('.$foto.');">'; 
        }else{$foto='NO';}
        
        $daRitornare.= "<tr id='".$id."' class='rigaTabella rigaTipo".$id_tipologia."'>"
            ."<td>" 
            . $id."</td><td class='soloFormPersona'>" 
            . $nome. "</td><td class='soloFormPersona'>" 
            . $cognome. "</td><td>" 
            . $alt_name.  "</td><td class='soloFormPersona'>" 
            . $titolo.  "</td><td>"
            . $nome_tipologia.  "<p hidden class='idTipoPers'>#".$id_tipologia."</p>" ."</td><td><p class='testoTagliato'>" 
            . $biografia.  "</p> </td>"
            . "<td>".$link. "</td>" 
            ."<td><a href='processaFotoArtista.php?id=".$id."&tipologia=".$id_tipologia."'><div>". $foto.  "</div></a></td>"
            ."<td><a href='#' onClick='return false;'><img src='../img/edit_icon.png' style='max-width:25px' class='resp editBtn'></a></td>" 
            ."<td><a href='#' onClick='return false;'><img src='../img/cancel_icon.png' style='max-width:25px' class='resp delBtn'></a></td>" 
            ."</tr>";
    }
    $daRitornare.= "</table>";    
    $stmt->close();
    return $daRitornare."<p class='w3-text-white'>Posso dirti di esser calmo anche se non lo sono</p> ";
}


function stampaSponsorAmministratore($conn) {
        // QUERY SELECT TABELLA Persona
    $stmt = $conn->prepare("SELECT P.id, P.nome, P.cognome, P.alt_name, P.titolo, P.tipologia, tP.nome, P.biografia, P.foto_mini, P.link FROM Persona AS P INNER JOIN tipologiaPersona AS tP ON P.tipologia=tP.id WHERE (tP.id = 3 || tP.id = 4 || tP.id = 5 || tP.id = 6) ORDER BY P.id");
    $stmt->execute();
    $stmt->bind_result($id, $nome, $cognome, $alt_name, $titolo, $id_tipologia, $nome_tipologia, $biografia, $foto, $link);
    

    
    
    $daRitornare="<table id='tabellaPersona' style='width:100%' cellspacing='0'>
                    <th>id</th>
                    <th hidden>nome</th>
                    <th hidden>cognome</th>
                    <th>alt_name</th>
                    <th hidden>titolo</th>
                    <th>tipologia</th>
                    <th hidden>biografia</th>
                    <th>link</th>
                    <th>foto</th>

                    <th>Edit</th>
                    <th>Canc</th>";
    
    while($stmt->fetch()) {
        if($foto){
            $foto='<div class="imgQuadrataArtista" style="background-image: url('.$foto.');">'; 
        }else{$foto='NO';}
        
        $daRitornare.= "<tr id='".$id."' class='rigaTabella rigaTipo".$id_tipologia."'>"
            ."<td>" 
            . $id."</td><td hidden>" 
            . $nome. "</td><td hidden>" 
            . $cognome. "</td><td>" 
            . $alt_name.  "</td><td hidden>"
            . $titolo.  "</td><td>"
            . $nome_tipologia.  "<p hidden class='idTipoPers'>#".$id_tipologia."</p>" ."</td><td hidden><p class='testoTagliato'>" 
            . $biografia.  "</p> </td>"
            . "<td>".$link. "</td>" 
            ."<td><a href='processaFotoArtista.php?id=".$id."&tipologia=".$id_tipologia."'><div>". $foto.  "</div></a></td>"
            ."<td><a href='#' onClick='return false;'><img src='../img/edit_icon.png' style='max-width:25px' class='resp editBtn'></a></td>" 
            ."<td><a href='#' onClick='return false;'><img src='../img/cancel_icon.png' style='max-width:25px' class='resp delBtn'></a></td>" 
            ."</tr>";
    }
    $daRitornare.= "</table>";    
    $stmt->close();
    return $daRitornare."<p class='w3-text-white'>Posso dirti di esser calmo anche se non lo sono</p> ";
}





?>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    
    <title>Test singolo evento</title>
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
</head>

<body>
    <?php
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL


    $numeroEvento = $_POST["eventoDaPassare"];
  
    
    function stampaEventoPersonaAdmin($numeroEvento, $conn) {
        
        $stmt = $conn->prepare("SELECT ep.id_istanza, ep.id_evento, ep.id_persona, ep.tipologia, tep.nome AS tipo, P.nome AS nomeP, P.cognome AS cognomeP, P.alt_name, P.titolo FROM (eventoPersona AS ep INNER JOIN tipologiaEventoPersona AS tep ON ep.tipologia=tep.id) INNER JOIN Persona AS P ON ep.id_persona=P.id WHERE ep.id_evento = ?");
        $stmt->bind_param("i", $numeroEvento);
        $stmt->execute();
        $stmt->bind_result($id_istanza, $id_evento, $id_persona, $id_tipoEP, $tipoEP, $nomeP, $cognomeP, $alt_name, $titolo);
        
        $daRitornare=  "<script>var persona=[]; var tRapporto=[]</script>";
        
        $daRitornare.= "<hr>"
                    .'<h4 class="w3-khaki w3-padding-large w3-deep-orange" style="margin:0;"><i class="fa fa-users" aria-hidden="true"></i> Persone/Sponsor: </h4>'
                        ."<div id='' class='w3-row w3-padding-small w3-khaki'>"
                            ."<div class='w3-row rigaIstanza w3-brown'> <div class='w3-col m11 '>"
                                ."<div class='w3-twothird'>id_persona</div>"
                                ."<div class='w3-third'>tipoRapporto</div>"
                            ."</div>"
                            ."<div class='w3-col m1'>"
                                ."<div class='w3-half'>"."Edit"."</div>"
                                ."<div class='w3-half'>"."CANC"."</div>"
                            ."</div> </div></div>";
        while($stmt->fetch()) {
            $daRitornare.= "<div class='w3-row rigaIstanza w3-padding-small w3-khaki'>";
            $daRitornare.= "<div class='w3-col m11'>";
            $daRitornare.=  "<div class='w3-twothird'>" . $nomeP." ".$cognomeP." (".$alt_name.") //".$titolo."</div>";
            $daRitornare.=  "<div class='w3-third tipoRapporto'>". $tipoEP ."</div>";
            $daRitornare.= "</div>";
            $daRitornare.=  "<div class='w3-col m1'>"
                                ."<a href='#' onCLick='return false'><div id='edit#".$id_istanza."' class='w3-half w3-center w3-yellow w3-card editIstanzaPersona'> <i class='fa fa-pencil-square-o fa-2x' aria-hidden='true'></i> </div></a>"
                                ."<a href='#' onCLick='return false'><div id='".$id_istanza."' class='w3-half w3-center w3-red w3-card cancellaIstanzaPersona'> <i class='fa fa-times fa-2x' aria-hidden='true'></i> </div></a></div>"
                            ."</div>";
            $daRitornare.="</div>";
            
            //Aggiungi record in array
            $daRitornare.=  "<script>tRapporto[".$id_istanza."] = '".$id_tipoEP."';  </script>"; //array tRapporto con numero tipo
            $daRitornare.=  "<script>persona[".$id_istanza."] = '".$id_persona."';  </script>";

        }

        $stmt->close();
        return $daRitornare;
    }
    
    //STAMPE
    echo stampaEventoPersonaAdmin($numeroEvento, $conn);

    
    $conn->close();
    ?>
    
    
    <script src="../js/dettagliEp.js"></script>
</body>

</html>
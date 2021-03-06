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
    include 'mieFunzioni.php';
    require 'configurazione.php';// richiamo il file di configurazione
    require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL

    $numeroEvento = $_POST["eventoDaPassare"];
    
    function stampaRigaELD($data, $ora, $timestamp, $id_luogo, $nome_luogo, $speciale, $id_istanza, $esaurito) {
               
        $daRitornare= ""
            ."<div class='w3-row rigaIstanza'>"
                ."<div class='w3-col m9'>"
                    ."<div class='w3-half'>" . $data . "</div>"
                    ."<div class='w3-half'>" . $ora . "</div>"
                    //."<div class='w3-quarter'>" . $timestamp . "</div>"
                    //."<div class='w3-quarter'>" . $nome_luogo ."<b></b></div>"
                ."</div>"
                ."<div class='w3-col m3'>"
                    ."<div class='w3-quarter'>". $speciale ."</div>"
                    ."<div class='w3-quarter'>". $esaurito ."</div>"
                    ."<a href='#' onCLick='return false'>"
                        ."<div id='edit#". $id_istanza ."' class='w3-quarter w3-center w3-yellow w3-card editIstanza'>"
                            ."<i class='fa fa-pencil-square-o fa-2x' aria-hidden='true'></i>"
                    ."</div></a>"
                    ."<a href='#' onClick='return false'>"
                        ."<div id='". $id_istanza ."' class='w3-quarter w3-center w3-red w3-card cancellaIstanza'>"
                        ."<i class='fa fa-times fa-2x' aria-hidden='true'></i>"
                    ."</div></a>"
                ."</div>"
            ."</div>";
        
        //Aggiungi record in arrayTIMESTAMPS e luoghi
        $daRitornare.=  "<script>luogo[".$id_istanza."] = '".$id_luogo."';  </script>";
        $daRitornare.=  "<script>speciale[".$id_istanza."] = '".$speciale."';  </script>";
        $daRitornare.=  "<script>arrayEsaurito[".$id_istanza."] = '".$esaurito."';  </script>";
        $daRitornare.=  "<script>timeStamps[".$id_istanza."] = '".$timestamp."';  </script>";

        return $daRitornare;
    }
    
    function stampaQuandoDoveAdmin($numeroEvento, $conn) {
        $stmt = $conn->prepare("SELECT eld.id_istanza, eld.data_ora, L.id, L.nome, eld.speciale, eld.esaurito FROM ((eventoLuogoData AS eld INNER JOIN Evento AS E ON E.id=eld.id_evento) INNER JOIN Luogo AS L ON E.luogo=L.id) WHERE E.id = ? ORDER BY eld.data_ora");
        $stmt->bind_param("i", $numeroEvento);
        $stmt->execute();
        $stmt->bind_result($id_istanza, $data_ora, $id_luogo, $nome_luogo, $speciale, $esaurito);

        
        $daRitornare=  "<script>var timeStamps= []; luogo= []; speciale= []; arrayEsaurito= [];  </script>";
        $daRitornare.= "<h4 style='margin:0;' class='w3-indigo w3-padding-large'><i class='fa fa-calendar' aria-hidden='true'></i> Appuntamenti: </h4>"
                        . "<div id='dataBox' class='w3-row-padding w3-cyan'>"
                            ."<div class='w3-row rigaIstanza w3-blue'> <div class='w3-col m9'>"
                                ."<div class='w3-half'>DATA</div>"
                                ."<div class='w3-half'>ORARIO</div>"
                                //."<div class='w3-quarter'><b>(TIMESTAMP)</b></div>"
                                //."<div class='w3-quarter'>LUOGO</div>"
                            ."</div>"
                            ."<div class='w3-col m3'>"
                                ."<div class='w3-quarter'>"."Speciale"."</div>"
                                ."<div class='w3-quarter'>"."Esaurito"."</div>"

                                ."<div class='w3-quarter'>"."Edit"."</div>"
                                ."<div class='w3-quarter'>"."CANC"."</div>"
                            ."</div>"
                        ."</div>";
        
        while($stmt->fetch()) {
            //funzione stampa riga
            $daRitornare.= stampaRigaELD(dataIta($data_ora), soloOra($data_ora), $data_ora, $id_luogo, $nome_luogo, $speciale, $id_istanza, $esaurito);
        }

        $daRitornare.= "</div>";        
        
        $stmt->close();
        return $daRitornare;
    }
    
    
    
    
    echo stampaQuandoDoveAdmin($numeroEvento, $conn);

    $conn->close();
    ?>
    
    <script src="../js/dettagliEld.js"></script>
    
</body>

</html>
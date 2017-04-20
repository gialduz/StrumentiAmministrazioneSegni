<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    
    <title>Test singolo evento</title>
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="../js/jquery.js"></script>
</head>
    <?php
            require 'configurazione.php';// richiamo il file di configurazione
            require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    ?>
<body style="max-width:1200px; margin:0 auto;">
    
     <!-- "banner" -->
    <div class="w3-row w3-center w3-xxlarge">
        <a href="../amministrazione.html"><div class="w3-third w3-deep-orange w3-hover-orange"><i class='fa fa-home fa-2x' aria-hidden='true'></i> Amministrazione</div></a>
        <div class="w3-twothird w3-dark-grey"><i class='fa fa-list-alt fa-2x' aria-hidden='true'></i> Modifica elenchi categorie</div></div>
    
    
    <div class="w3-row">
        <div class="w3-panel w3-yellow w3-card-4">
            <h3 style="margin:0">ATTENZIONE!</h3>
            <p>Non è possibile cancellare tipi ATTUALMENTE ASSEGNATI</p>
        </div>
        
        <!-- TIPO EVENTO -->
        <div class="w3-col m4 w3-container">
            <h2 class="w3-green">Tipo EVENTO</h2>
            
            <div class="w3-blue">
                <label>Nuovo tipoEvento</label>
                <input id="addTE" class="w3-input w3-col m9 w3-pale-yellow" type="text">
                <input id="addSubmitTE" class="w3-input w3-col m3" type="button" value="Submit">

            </div>
            
            <?php
            function stampaTipoEvento($conn) {
                $stmt = $conn->prepare("SELECT id, nome FROM tipologiaEvento AS te WHERE 1");
                $stmt->execute();
                $stmt->bind_result($id, $nome);
                
                $daRitornare.= "<br><hr>";
                while($stmt->fetch()) {
                    $daRitornare.= "<div class='w3-row rigaIstanza w3-border w3-border-orange'>";
                    $daRitornare.=      "<div class='w3-col m11'>";
                    $daRitornare.=      $nome;
                    $daRitornare.=      "</div>";
                    $daRitornare.=      "<div class='w3-col m1'>"
                                            ."<a href='#' onCLick='return false'><div id='TE#".$id."' class='w3-center w3-text-red cancellaTipoEvento'> <i class='fa fa-times fa-2x' aria-hidden='true'></i> </div></a>"
                                        ."</div>";
                    $daRitornare.="</div>";
                }
                $stmt->close();
                return $daRitornare;
            }

            //STAMPE
            echo stampaTipoEvento($conn);

            ?>
        </div>
        
        <!-- TIPO PERSONA -->
        <div class="w3-col m4 w3-container">
            <h2 class="w3-blue">Tipo PERSONA</h2>
            <div class="w3-amber">
                <label>Nuovo tipoPersona</label>
                <input id="addTP" class="w3-input w3-col m9 w3-pale-blue" type="text">
                <input id="addSubmitTP" class="w3-input w3-col m3" type="button" value="Submit">

            </div>
            
            <?php
            function stampaTipoPersona($conn) {
                $stmt = $conn->prepare("SELECT id, nome FROM tipologiaPersona AS tp WHERE 1");
                $stmt->execute();
                $stmt->bind_result($id, $nome);

                $daRitornare.= "<br><hr>";
                while($stmt->fetch()) {
                    $daRitornare.= "<div class='w3-row rigaIstanza w3-border w3-border-blue'>";
                    $daRitornare.=      "<div class='w3-col m11'>";
                    $daRitornare.=      $nome;
                    $daRitornare.=      "</div>";
                    $daRitornare.=      "<div class='w3-col m1'>"
                                            ."<a href='#' onCLick='return false'><div id='TP#".$id."' class='w3-center w3-text-red cancellaTipoPersona'> <i class='fa fa-times fa-2x' aria-hidden='true'></i> </div></a>"
                                        ."</div>";
                    $daRitornare.="</div>";
                }

                $stmt->close();
                return $daRitornare;
            }

            //STAMPE
            echo stampaTipoPersona($conn);
            ?>
        </div>
        
        <!-- TIPO RAPPORTO -->
        <div class="w3-col m4 w3-container">
            <h2 class="w3-blue">Tipo Rapporto</h2>
            <div class="w3-orange">
                <label>Nuovo tipoRapporto</label>
                <input id="addTR" class="w3-input w3-col m9 w3-pale-red" type="text">
                <input id="addSubmitTR" class="w3-input w3-col m3" type="button" value="Submit">

            </div>
            
            <?php
            function stampaTipoRapporto($conn) {
                
                $stmt = $conn->prepare("SELECT id, nome FROM tipologiaEventoPersona AS tep WHERE 1");
                $stmt->execute();
                $stmt->bind_result($id, $nome);

                $daRitornare.= "<br><hr>";
                while($stmt->fetch()) {
                    $daRitornare.= "<div class='w3-row rigaIstanza w3-border w3-border-green'>";
                    $daRitornare.=      "<div class='w3-col m11'>";
                    $daRitornare.=      $nome;
                    $daRitornare.=      "</div>";
                    $daRitornare.=      "<div class='w3-col m1'>"
                                            ."<a href='#' onCLick='return false'><div id='TEP#".$id."' class='w3-center w3-text-red cancellaTipoRapporto'> <i class='fa fa-times fa-2x' aria-hidden='true'></i> </div></a>"
                                        ."</div>";
                    $daRitornare.="</div>";
                }

                $stmt->close();
                return $daRitornare;
            }

            //STAMPE
            echo stampaTipoRapporto($conn);

            $conn->close();
            ?>
        </div>
    </div>
    
    
    <script>
        // TIPO EVENTO
        $('#addSubmitTE').click(function () {
            var popupVerifica = confirm("Vuoi davvero AGGIUNGERE questo tipo di EVENTO?");
            var nuovoTipo= $('#addTE').val();
            if (popupVerifica == true && nuovoTipo!="") {

                $.ajax({
                    type: "POST"
                    , url: "../php/tipologiaEventoAdd.php"
                    , data: {
                        nuovoTipo: nuovoTipo
                    }
                }).done(function () {
                    
                    location.reload();
                });
            }
            else {
                location.reload();
            }
        });
        $('.cancellaTipoEvento').click(function () {
            var popupVerifica = confirm("Vuoi davvero CANCELLARE questo tipo di evento?");
            var daPassare = $(this).attr("id").split('#')[1];
            if (popupVerifica == true) {
                $.ajax({
                    type: "POST"
                    , url: "../php/tipologiaEventoDelete.php"
                    , data: {
                        idTipoEvento: daPassare
                    }
                }).done(function () {
                    location.reload();
                });
            }
            else {
                location.reload();
            }
        });
        
        // TIPO PERSONA
        $('#addSubmitTP').click(function () {
            var popupVerifica = confirm("Vuoi davvero AGGIUNGERE questo tipo di PERSONA?");
            var nuovoTipoP= $('#addTP').val();
            if (popupVerifica == true && nuovoTipoP!="") {
                //alert(nuovoTipoP);
                $.ajax({
                    type: "POST"
                    , url: "../php/tipologiaPersonaAdd.php"
                    , data: {
                        nuovoTipo: nuovoTipoP
                    }
                }).done(function () {
                    
                    location.reload();
                });
            }
            else {
                location.reload();
            }
        });
        $('.cancellaTipoPersona').click(function () {
            var popupVerifica = confirm("Vuoi davvero CANCELLARE questo tipo di evento?");
            var daPassare = $(this).attr("id").split('#')[1];
            if (popupVerifica == true) {
                $.ajax({
                    type: "POST"
                    , url: "../php/tipologiaPersonaDelete.php"
                    , data: {
                        idTipoPersona: daPassare
                    }
                }).done(function () {
                    location.reload();
                });
            }
            else {
                location.reload();
            }
        });
        
        // TIPO RAPPORTO
        $('#addSubmitTR').click(function () {
            var popupVerifica = confirm("Vuoi davvero AGGIUNGERE questo tipo di rapporto?");
            var nuovoTipo= $('#addTR').val();
            if (popupVerifica == true && nuovoTipo!="") {
                $.ajax({
                    type: "POST"
                    , url: "../php/tipologiaEpAdd.php"
                    , data: {
                        nuovoTipo: nuovoTipo
                    }
                }).done(function () {
                    
                    location.reload();
                });
            }
            else {
                location.reload();
            }
        });
        $('.cancellaTipoRapporto').click(function () {
            var popupVerifica = confirm("Vuoi davvero CANCELLARE questo tipo di rapporto?");
            var daPassare = $(this).attr("id").split('#')[1];
            if (popupVerifica == true) {
                $.ajax({
                    type: "POST"
                    , url: "../php/tipologiaEpDelete.php"
                    , data: {
                        idTipoEP: daPassare
                    }
                }).done(function () {
                    location.reload();
                });
            }
            else {
                location.reload();
            }
        });
    </script>
    
</body>

</html>
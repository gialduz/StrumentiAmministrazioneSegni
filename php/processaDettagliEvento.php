<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    
    <title>tabella DETTAGLIO Evento</title>
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/processaDettagliEvento.js"></script>
    
    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- DATEPICKER STUFF -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="../js/jquery.ui.datepicker-it.js"></script>
    

    
    <?php
        require 'configurazione.php';// richiamo il file di configurazione
        require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    
    ?>
</head>

<body style="max-width:1200px; margin:0 auto;" class="w3-border w3-border-red">    
    
    <!-- "banner" -->
    <div class="w3-row w3-center w3-xxlarge ">
        <a href="../amministrazione.html"><div class="w3-third w3-deep-orange w3-hover-orange"><i class='fa fa-home fa-2x' aria-hidden='true'></i> Amministrazione</div></a>
        <div class="w3-twothird w3-teal"><i class='fa fa-info-circle fa-2x' aria-hidden='true'></i> Dettagli Evento</div>
    </div>
    
    <!-- select evento (MAIN) -->
    <form id="sceltaEvento"> 
        
        
        <select style="font-size:25px; margin-top:50px;" id="selectEvento" name="selectTipo" class="w3-select w3-yellow w3-hover-amber">
            <label>Nome Evento:</label>

            <option value='0'> - scegli evento -</option>
            <?php 
            $stmt = $conn->prepare("SELECT id, nome FROM Evento WHERE 1 ORDER BY id");
            $stmt->execute();
            $stmt->bind_result($id, $nome); 

            while($stmt->fetch()){
                echo "<option value=".$id.">" . $nome . "</option>";
            }
            ?>
        </select>
    </form>
    
    <!-- wrap LUOGHI e DATE -->
    <div id="wrapEventoLuogoData"></div>
    <!-- add, edit -->
    <div class="w3-bar w3-cyan" style="padding-top:25px">
        <button id="addBtn" class="w3-bar-item w3-button w3-green"><i class="fa fa-plus" aria-hidden="true"></i> Aggiungi</button>
        <button id="editBtn" class="w3-bar-item w3-button w3-yellow" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Modifica</button>
        <button style="float:right" class="w3-bar-item w3-button w3-orange chiudiMenu"><i class="fa fa-times " aria-hidden="true"></i> Chiudi men&ugrave;</button>

    </div>
    <div id="addTab" class="tabs" style="display:none">
        <div id="addBox" class="w3-row-padding w3-green">
            <br>
            <div class="w3-twothird">
                <div class="w3-twothird">
                    Scegli la data: <input type="text" id="addCalendario" class="w3-input w3-border">
                    <script>
                        $(function() {
                            $.datepicker.setDefaults($.datepicker.regional['it']);
                            $("#addCalendario").datepicker({
                                onClose: function(dateText, inst) {
                                    $('#addMese').val(dateText.split('/')[1]);
                                    $('#addGiorno').val(dateText.split('/')[0]);
                                }
                            });
                        });
                    </script>
                </div>
                <div class="w3-third w3-hide">
                    <label>Giorno</label>
                    <input type="number" id="addGiorno" min="1" max="31" name="giorno" value="" readonly="true" class="w3-input w3-border ">
                </div>
                <div class="w3-third w3-hide">
                    <label>Mese</label>
                    <input type="number" id="addMese" min="1" max="12" name="mese" value="" readonly="true" class="w3-input w3-border ">
                </div>
                <div class="w3-third">
                    <div class="w3-half">
                        <label>Ora (0-23)</label>
                        <input type="number" id="addOra" min="0" max="23" name="mese" value="" class="w3-input w3-border">
                    </div>
                    <div class="w3-half">
                        <label>Minuti (step5)</label>
                        <input type="number" id="addMinuto" min="0" max="59" step="5" name="mese" value="" class="w3-input w3-border">
                    </div>
                </div>
            </div>
        
            <div class="w3-third">
                <label>Luogo</label>
                <select id="addLuogo" name="selectLuogo" class="w3-select">
                    <option value='0'> - </option>
                    <?php 
                    $stmt = $conn->prepare("SELECT id, lettera, nome FROM Luogo WHERE 1");
                    $stmt->execute();
                    $stmt->bind_result($id, $lettera, $nome);
                    

                    while($stmt->fetch()){
                        echo "<option value=".$id.">". $lettera ." - " . $nome . "</option>";
                    }
                    $stmt->close();
                    ?>
                </select>
                <label>Evento Speciale?</label>
                <input id="addSpeciale" class="w3-check" type="checkbox">
                <input id="addSubmit" type="button" value="Submit">
            </div>

        </div>
    </div>
    <div id="editTab" class="tabs" style="display:none">
        <div id="editBoxELD" class="w3-row-padding w3-yellow">
            <br>
            <div class="w3-twothird">
                <div class="w3-twothird">
                    Scegli la data: <input type="text" id="calendarioEdit" class="w3-input w3-border">
                    <script>
                        $(function() {
                            $.datepicker.setDefaults($.datepicker.regional['it']);
                            $("#calendarioEdit").datepicker({
                                onClose: function(dateText, inst) {
                                    $('#editMese').val(dateText.split('/')[1]);
                                    $('#editGiorno').val(dateText.split('/')[0]);
                                }
                            });
                        });
                    </script>
                </div>
                <div class="w3-third w3-hide">
                    <label>Giorno</label>
                    <input type="number" id="editGiorno" min="1" max="31" name="giorno" value="" readonly="true" class="w3-input w3-border ">
                </div>
                <div class="w3-third w3-hide">
                    <label>Mese</label>
                    <input type="number" id="editMese" min="1" max="12" name="mese" value="" readonly="true" class="w3-input w3-border ">
                </div>
                <div class="w3-third">
                    <div class="w3-half">
                        <label>Ora (0-23)</label>
                        <input type="number" id="editOra" min="0" max="23" name="mese" value="" class="w3-input w3-border">
                    </div>
                    <div class="w3-half">
                        <label>Minuti (step5)</label>
                        <input type="number" id="editMinuto" min="0" max="59" step="5" name="mese" value="" class="w3-input w3-border">
                    </div>
                </div>


            </div>

            <div class="w3-third">
                <label>Luogo</label>
                <select id="editLuogo" name="selectLuogo" class="w3-select">
                    <option value='0'> - </option>
                    <?php 
                    $stmt = $conn->prepare("SELECT id, lettera, nome FROM Luogo WHERE 1");
                    $stmt->execute();
                    $stmt->bind_result($id, $lettera, $nome);
                    

                    while($stmt->fetch()){
                        echo "<option value=".$id.">". $lettera ." - " . $nome . "</option>";
                    }
                    $stmt->close();
                    ?>
                </select>
                <label>Evento Speciale?</label>
                <input id="editSpeciale" class="w3-check" type="checkbox">
                <input id="editSubmit" type="button" value="Submit">
            </div>
        </div>
    </div>
    
    <!-- wrap E-PERSONA -->
    <div id="wrapEventoPersona"></div>
    <!-- add, edit -->
    <div class="w3-bar w3-khaki" style="padding-top:25px">
        <button id="addBtnEP" class="w3-bar-item w3-button w3-green"><i class="fa fa-plus" aria-hidden="true"></i> Aggiungi</button>
        <button id="editBtnEP" class="w3-bar-item w3-button w3-yellow" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Modifica</button>
        <button style="float:right" class="w3-bar-item w3-button w3-orange chiudiMenu"><i class="fa fa-times " aria-hidden="true"></i> Chiudi men&ugrave;</button>
    </div>
    <div id="addTabEP" class="tabs" style="display:none">
        <div id="addBoxEP" class="w3-row-padding w3-green">
            <br>
            <div class="w3-twothird">
                <label>Persona</label>
                <select id="addPersonaEP"  class="w3-select">
                    <option value='0'> - </option>
                    <?php 
                    $stmt = $conn->prepare("SELECT id, nome, cognome, alt_name FROM Persona WHERE 1");
                    $stmt->execute();
                    $stmt->bind_result($id, $nome, $cognome, $alt_name);
                    
                    while($stmt->fetch()){
                         echo "<option value=".$id.">". $nome." ".$cognome." '".$alt_name."' ". "</option>";
                    }
                    $stmt->close();
                    ?>
                </select>
            </div>
            <div class="w3-third ">
                <label>TIPO RAPPORTO</label>
                <select id="addRapportoEP" class="w3-select">
                    <option value='0'> - </option>
                    <?php 
                    $stmt = $conn->prepare("SELECT id, nome FROM tipologiaEventoPersona WHERE 1");
                    $stmt->execute();
                    $stmt->bind_result($id, $nome);
                    

                    while($stmt->fetch()){
                        echo "<option value=".$id.">" . $nome . "</option>";
                    }
                    $stmt->close();
                    ?>
                    <option value='aggiungiRapporto'> [+] Aggiungi NUOVO RAPPORTO </option>
                    
                </select>
                <label>Nuovo tipoRapporto</label>
                <input id="addTipoRapporto" class="w3-input" type="text">
            </div>
               


        
            <div class="w3-third">

                <input id="addSubmitEP" type="button" value="Submit">
            </div>
        
        </div>
    </div>
    <div id="editTabEP" class="tabs" style="display:none">
        <div id="editBoxEP" class="w3-row-padding w3-yellow">
            <br>
            <div class="w3-twothird">
                <label>Persona</label>
                <select id="editPersonaEP"  class="w3-select">
                    <option value='0'> - </option>
                    <?php 
                    $stmt = $conn->prepare("SELECT id, nome, cognome, alt_name FROM Persona WHERE 1");
                    $stmt->execute();
                    $stmt->bind_result($id, $nome, $cognome, $alt_name);
                    
                    while($stmt->fetch()){
                         echo "<option value=".$id.">". $nome." ".$cognome." '".$alt_name."' ". "</option>";
                    }
                    $stmt->close();
                    ?>
                </select>
            </div>
            <div class="w3-third ">

                <label>TIPO RAPPORTO</label>
                <select id="editRapportoEP" class="w3-select">
                    <option value='0'> - </option>
                    <?php 
                    $stmt = $conn->prepare("SELECT id, nome FROM tipologiaEventoPersona WHERE 1");
                    $stmt->execute();
                    $stmt->bind_result($id, $nome);
                    

                    while($stmt->fetch()){
                        echo "<option value=".$id.">" . $nome . "</option>";
                    }
                    $stmt->close();
                    ?>
                    <!--<option value='aggiungiRapporto'> [+] Aggiungi NUOVO RAPPORTO </option>-->
                    
                </select>
                <!--<label>Nuovo tipoRapporto</label>
                <input id="editTipoRapporto" class="w3-input" type="text">-->
            </div>
            <div class="w3-third">
                <input id="editSubmitEP" type="button" value="Submit">
            </div>
        </div>
    </div>
    
    

    <?php
    $conn->close();
    ?>
    <div class="w3-center" style="height:100px"><br>FINE</div>
</body>

</html>
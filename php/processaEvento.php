<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    
    <title>tabella evento</title>
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="../js/jquery.js"></script>
    
    <?php
        require 'configurazione.php';// richiamo il file di configurazione
        require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    ?>
</head>

<body style="max-width:1200px; margin:0 auto;">    
    <div id="corpo">
    <div class="w3-row">
        <a href="../amministrazione.html"><div class="w3-quarter w3-center w3-xxlarge w3-blue w3-hover-cyan "><i class="fa fa-home fa-2x"></i> Home</div></a>
        <div class="w3-threequarter w3-center w3-xxlarge w3-purple"><i class="fa fa-table fa-2x"></i> EVENTI</div>
    </div>  
    
    <div id="addBox">
        <div class="w3-yellow w3-row">
            <h3>Aggiungi evento</h3>
            <form id="addForm">
                <div class="w3-row">
                    <div class="w3-twothird">
                        <div class="w3-half">
                            <label>Nome</label>
                            <input type="text" name="nome" value="" class="w3-input w3-border">
                        </div>
                        <div class="w3-half">
                            <div class="w3-half">
                                <label>Luogo</label>
                                <select id="addLuogo" name="selectLuogo" class="w3-select">
                                    <option value='0'> - </option>
                                    <?php 
                                    $stmt = $conn->prepare("SELECT id, nome FROM Luogo WHERE 1");
                                    $stmt->execute();
                                    $stmt->bind_result($id, $nome);

                                    while($stmt->fetch()){
                                        echo "<option value=".$id.">" .$nome. "</option>";
                                    }
                                    $stmt->close();
                                    ?>
                                </select>
                            </div>
                            <div class="w3-quarter">
                                <label>Durata</label>
                                <input type="number" name="durata" value="" class="w3-input w3-border">
                            </div>
                            <div class="w3-quarter">
                                <label>Tipo</label>
                                <!--<input type="text" name="tipologia" value="" class="w3-input w3-border uppato">-->
                                <select id="addTipo" name="selectTipo" class="w3-select">
                                    <option value='0'> - </option>
                                    <?php 
                                    $stmt = $conn->prepare("SELECT id, nome FROM tipologiaEvento WHERE 1");
                                    $stmt->execute();
                                    $stmt->bind_result($id, $nome);

                                    while($stmt->fetch()){
                                        echo "<option value=".$id.">" .$nome. "</option>";
                                    }
                                    $stmt->close();
                                    ?>
                                </select>

                                <!-- WRAP AUTOMATICO SELECT -->
                            </div>
                        </div>
                    </div>
                
                    <div class="w3-third">
                        <div class="w3-half">
                            <div class="w3-half">
                                <label>Eta' MIN</label>
                                <input type="number" name="eta_min" value="0" style="width: 5em;" class="w3-input w3-border">
                            </div>
                            <div class="w3-half">
                                <label>Eta' MAX</label>
                                <input type="number" name="eta_max" value="0" style="width: 5em;" class="w3-input w3-border">
                            </div>
                        </div>
                        <div class="w3-half">
                            <div class="w3-half">
                                <label>Ticket</label>
                                <input type="number" value="0" min="0" max="1" name="ticket" style="width: 3em;" class="w3-input w3-border">
                            </div>
                            <div class="w3-half">
                                <label>Spec_ragazzi</label>
                                <input type="number" value="0" min="0" max="1" name="speciale_ragazzi" style="width: 3em;" class="w3-input w3-border">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="w3-row">
                    <div class="w3-half w3-center">
                        <label>Descrizione ITA</label>
                        <textarea id="descrizione_ita" rows="4" cols="50"></textarea>
                    </div>
                </div>
                
            <input id="addSubmit" class="w3-button w3-right" type="button" value="Submit">
            </form>
        </div>
    </div>

    <div id='editBox'>
        <div class="w3-row w3-cyan">
            <h3>Modifica evento</h3>
            <form id="editForm">
                <div class="w3-row">
                    <div class="w3-half">
                        <div class="w3-col s2">
                            <label>Id</label>
                            <input type="number" name="daAggiornare" id="idEdit" readonly="true" class="w3-input w3-border">
                        </div>
                        <div class="w3-col m10">
                            <div class="w3-half">
                                <label>Nome</label>
                                <input type="text" name="nome" id="nomeEdit" class="w3-input w3-border">
                            </div>
                            <div class="w3-quarter">
                                <label>Luogo</label>
                                <select id="luogoEdit" name="luogoEdit" class="w3-select">
                                    <option value='0'> - </option>
                                    <?php 
                                    $stmt = $conn->prepare("SELECT id, nome FROM Luogo WHERE 1");
                                    $stmt->execute();
                                    $stmt->bind_result($id, $nome);

                                    while($stmt->fetch()){
                                        echo "<option value=".$id.">" .$nome. "</option>";
                                    }
                                    $stmt->close();
                                    ?>
                                </select>
                            </div>
                            <div class="w3-quarter">
                                <label>Durata</label>
                                <input type="number" name="durata" id="durataEdit" class="w3-input w3-border">
                            </div>
                        </div>
                    </div>
                    <div class="w3-half">
                        <div class="w3-half">
                            <div class="w3-half">
                                <label>Tipo</label>
                                <select id="tipoEdit" name="selectTipo" class="w3-select">
                                    <option value='0'> - </option>
                                    <?php 
                                    $stmt = $conn->prepare("SELECT id, nome FROM tipologiaEvento WHERE 1");
                                    $stmt->execute();
                                    $stmt->bind_result($id, $nome);

                                    while($stmt->fetch()){
                                        echo "<option value=".$id.">" .$nome. "</option>";
                                    }
                                    $stmt->close();
                                    ?>
                                </select>


                            </div>
                            <div class="w3-half">
                                <div class="w3-half">
                                    <label>Eta' MIN</label>
                                    <input type="number" name="eta_min" id="minEdit" class="w3-input w3-border">
                                </div>
                                <div class="w3-half">
                                <label>Eta' MAX</label>
                                <input type="number" name="eta_max" id="maxEdit" class="w3-input w3-border">
                                </div>
                            </div>
                        </div>
                        <div class="w3-quarter">
                            <div class="w3-half">
                                <label>Ticket</label>
                                <input type="number" min="0" max="1" name="ticket" id="ticketEdit" class="w3-input w3-border">
                            </div>
                            <div class="w3-half">
                                <label>Sp_ragazzi</label>
                                <input type="number" min="0" max="1" name="speciale_ragazzi" id="stEdit" class="w3-input w3-border">
                            </div>
                        <!--descrizioneIta: <input type="text" name="descrizione_ita"><br>
                        descrizioneEng: <input type="text" name="descrizione_eng"><br>-->
                        </div>
                    </div>
                    
                    
                    <div class="w3-row">
                        <div class="w3-half w3-center">
                            <label>Descrizione ITA</label>
                            <textarea id="descrizione_itaE" rows="4" cols="50"></textarea>
                        </div>
                    </div>
                    
                    
                    <div class="w3-quarter w3-right">
                        <label></label> <br>
                        <input id="editSubmit" type="button" value="Conferma">
                    </div>
                </div>

            </form>
            
            <a href="#" onClick="return false;"><i id="closeUpd" class="fa fa-close w3-xxlarge" style="float:right"> [annulla modifiche]</i></a>
        </div>
    </div>
    <script>$("#editBox").hide();</script>

    
    <?php
    include 'stampaAmministratore.php';
    echo stampaEventoAmministratore($conn);
    $conn->close();
    ?>
    
    <div id="spazioPerFixedUPD" class="w3-center" style="height:250px">Fine</div>

    
    <script src="../js/eventoDelete.js"></script>
    <script src="../js/eventoUpdate.js"></script>
    <script src="../js/eventoAdd.js"></script>
    <script src="../js/formReset.js"></script>

    </div>
    
</body>

</html>
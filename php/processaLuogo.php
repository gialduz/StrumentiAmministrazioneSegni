<html >

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    
    <title>tabella Luogo</title>
    
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
        <div class="w3-threequarter w3-center w3-xxlarge w3-blue"><i class="fa fa-globe fa-2x"></i> LUOGHI</div>
    </div> 
    
    
    <div id="addBox" lang="en-US">
        <div class="w3-yellow w3-row">
            <h3>Aggiungi Luogo<small> lettera e' UNICA, select con SELECT DISTINCT</small></h3>
            <form id="addForm">
                <div class="w3-half">
                    <div class="w3-third">
                        <div class="w3-half">
                            <label>Lettera</label>
                            <input type="text" name="lettera" value="" class="w3-input w3-border">
                        </div>
                        <div class="w3-half">
                            <label>Colore</label>
                            <select id="addColore" name="selectColore" class="w3-select">
                                <option value='0'> - </option>
                                <?php 
                                $stmt = $conn->prepare("SELECT DISTINCT colore FROM luogo WHERE 1");
                                $stmt->execute();
                                $stmt->bind_result($colore);

                                while($stmt->fetch()){
                                    echo "<option value=".$colore.">" .$colore. "</option>";
                                }
                                $stmt->close();
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="w3-twothird">
                        
                        <label>Nome</label>
                        <input type="text" name="nome" value="" class="w3-input w3-border">
                            
                    </div>
                </div>
                <div class="w3-half">
                    <div class="w3-half">
                        <div class="w3-half">
                            <label>Latitudine</label>
                            <input type="number" name="latitudine" value="0" step="0.0001" class="w3-input w3-border">
                        </div>
                        <div class="w3-half">
                            <label>Longitudine</label>
                            <input type="number" name="longitudine" value="0" step="0.0001" class="w3-input w3-border">
                        </div>
                        
                    </div>
                    <div class="w3-half">
                        <div class="w3-col">
                            <label>Citta??</label>
                            <input type="text" name="citta" value="" class="w3-input w3-border">
                        </div>
                        <div class="w3-quarter">
                            <label>Tipo Via</label>
                            <select id="addTipo" name="selectTipo" class="w3-select">
                                <option value='0'> - </option>
                                <?php 
                                $stmt = $conn->prepare("SELECT DISTINCT tipo_via FROM luogo WHERE 1");
                                $stmt->execute();
                                $stmt->bind_result($tipo_via);

                                while($stmt->fetch()){
                                    echo "<option value=".$tipo_via.">" .$tipo_via. "</option>";
                                }
                                $stmt->close();
                                ?>
                            </select>                        
                        </div>
                        <div class="w3-half">
                            <label>Via</label>
                            <input type="text" name="via" class="w3-input w3-border">
                        </div>
                        <div class='w3-quarter'>
                            <label>N. Civico</label>
                            <input type="number" value="0" min="0" name="numero_civico" class="w3-input w3-border">
                        </div>
                    </div>
                    <!--descrizioneIta: <input type="text" name="descrizione_ita"><br>
                    descrizioneEng: <input type="text" name="descrizione_eng"><br>-->
                </div>
                
                <div class="w3-row">
                    <div class="w3-twothird w3-center">
                        <label>descrizione</label>
                        <textarea id="descrizione" rows="4" cols="50"></textarea>
                    </div>
                    <div class="w3-third w3-center">
                        <input id="addSubmit" type="button" value="Submit">
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    
    <div id="editBox" lang="en-US">
        <div class="w3-cyan w3-row">
            <h3>Modifica Luogo</h3>
            <form id="editForm">
                <div class="w3-half">
                    <div class="w3-half">
                        <div class="w3-third">
                            <label>Id</label>
                            <input id="editId" type="number" name="id" value="" readonly="true" class="w3-input w3-border">
                        </div>
                        <div class="w3-third">
                            <label>Lettera</label>
                            <input id="editLettera" type="text" name="lettera" value="" class="w3-input w3-border">
                        </div>
                        <div class="w3-third">
                            <label>colore</label>
                            <select id="editColore" name="selectColore" class="w3-select">
                                <option value='0'> - </option>
                                <?php 
                                $stmt = $conn->prepare("SELECT DISTINCT colore FROM luogo WHERE 1");
                                $stmt->execute();
                                $stmt->bind_result($colore);

                                while($stmt->fetch()){
                                    echo "<option value=".$colore.">" .$colore. "</option>";
                                }
                                $stmt->close();
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="w3-half">
                        
                        <label>Nome</label>
                        <input id="editNome" type="text" name="nome" value="" class="w3-input w3-border">
                            
                    </div>
                </div>
                <div class="w3-half">
                    <div class="w3-half">
                        <div class="w3-half">
                            <label>Latitudine</label>
                            <input id="editLatitudine" type="number" name="latitudine" value="0" step="0.0001" class="w3-input w3-border">
                        </div>
                        <div class="w3-half">
                            <label>Longitudine</label>
                            <input id="editLongitudine" type="number" name="longitudine" value="0" step="0.0001" class="w3-input w3-border">
                        </div>
                        
                    </div>
                    <div class="w3-half">
                        <div class="w3-col">
                            <label>Citta??</label>
                            <input id="editCitta" type="text" name="citta" value="" class="w3-input w3-border">
                        </div>
                        <div class="w3-quarter">
                            <label>Tipo Via</label>
                            <select id="editTipoVia" name="selectTipo" class="w3-select">
                                <option value='0'> - </option>
                                <?php 
                                $stmt = $conn->prepare("SELECT DISTINCT tipo_via FROM luogo WHERE 1");
                                $stmt->execute();
                                $stmt->bind_result($tipo_via);

                                while($stmt->fetch()){
                                    echo "<option value=".$tipo_via.">" .$tipo_via. "</option>";
                                }
                                $stmt->close();
                                ?>
                            </select>                        
                        </div>
                        <div class="w3-half">
                            <label>Via</label>
                            <input id="editVia" type="text" name="via" class="w3-input w3-border">
                        </div>
                        <div class="w3-quarter">
                            <label>N. Civico</label>
                            <input id="editNumeroCivico" type="number" value="0" min="0" name="numero_civico" class="w3-input w3-border">
                        </div>
                    </div>
                </div>
                
                
                
                <div class="w3-row">
                    <div class="w3-twothird w3-center">
                        <label>descrizione</label>
                        <textarea id="descrizioneE" rows="4" cols="50"></textarea>
                    </div>
                    <div class="w3-third w3-center">
                        <input id="editSubmit" type="button" value="Submit">
                    </div>
                </div>
            
            </form>
            
             <a href="#" onClick="return false;"><i id="closeUpd" class="fa fa-close w3-xxlarge" style="float:right"> [annulla modifiche]</i></a>
        </div>
    </div>
    <script>$("#editBox").hide();</script>
    
    <?php
    
    include 'stampaAmministratore.php';
    echo stampaLuogoAmministratore($conn);
    ?>
    
    <div id="spazioPerFixedUPD" class="w3-center" style="height:250px">Fine</div>

    <script src="../js/luogoAdd.js"></script>
    <script src="../js/luogoDelete.js"></script>
    <script src="../js/luogoUpdate.js"></script>


    <?php
    $conn->close();
    ?>
    
    </div>
</body>

</html>
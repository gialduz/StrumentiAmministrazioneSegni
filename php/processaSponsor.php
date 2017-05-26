<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    
    <title>tabella Persona</title>
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="../js/jquery.js"></script>
    
    <?php
        require 'configurazione.php';// richiamo il file di configurazione
        require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
    ?>
</head>

<body style="max-width:1200px; margin:0 auto;" class="w3-border w3-border-red">   
    <div id="corpo">
    
    <div class="w3-row">
        <a href="../amministrazione.html"><div class="w3-quarter w3-center w3-xxlarge w3-blue w3-hover-cyan "><i class="fa fa-home fa-2x"></i> Home</div></a>
        <div class="w3-threequarter w3-center w3-xxlarge w3-deep-orange w3-text-white"><i class="fa fa-money fa-2x"></i> SPONSOR</div>
    </div> 
    
    
    <div id="addBox" class="padded10 w3-green">
        <div class="w3-row">
            <h3>Aggiungi</h3>
            <form id="addForm">
                <div class="w3-row">
                    <div class="w3-half">
                            <!--<label>Nome</label>-->
                            <input type="hidden" name="nome" value="" class="w3-input w3-border">
                            <!--<label>Cognome</label>-->
                            <input type="hidden" name="cognome" value="" class="w3-input w3-border">
                        
                        <label>ALT_NAME</label>
                        <input type="text" name="alt_name" value="" class="w3-input w3-border">
                    </div>
                    <div class="w3-half">
                            <!--<label>Titolo</label>-->
                            <input type="hidden" name="titolo" value="" class="w3-input w3-border">
                        <div class="w3-third">
                            <label>Tipologia</label>
                            <select id="addTipo" name="selectTipo" class="w3-select">
                                <option value='0'> - </option>
                                <?php 
                                $stmt = $conn->prepare("SELECT id, nome FROM tipologiaPersona WHERE (id = 3 || id = 4 || id = 5 || id = 6)");
                                $stmt->execute();
                                $stmt->bind_result($id, $nome);

                                while($stmt->fetch()){
                                    echo "<option value=".$id.">" .$nome. "</option>";
                                }
                                $stmt->close();
                                ?>
                            </select>                        
                        </div>
                        <div class="w3-twothird">
                            <label>Link</label>
                            <input type="text" id="addLink" name="addLink" value="" class="w3-input w3-border">
                        </div>
                    </div>
                </div>
                <div class="w3-row">
                    <!--
                    <div class="w3-threequarter w3-center">
                        <label>biografia</label>
                        <textarea id="biografia" rows="4" cols="50"></textarea>
                    </div>
                    -->
                    
                    
                
                    <div class="w3-col">
                        <input id="addSubmit" class="w3-button w3-right" type="button" value="Submit">
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    
    
    <div id="editBox" style="width:80%;" class="padded10 w3-yellow">
        <div class="w3-row">
            <h3>Modifica
                <a href="#" onClick="return false;"><span id="closeUpd" class='w3-right padded10 w3-red w3-round' style="font-size:14px">Annulla Modifiche <i class="fa fa-close w3-xlarge"></i></span></a> 
            </h3>
            <form id="editForm">
                
                    <!--<label>id</label>-->
                    <input id="editId" type="hidden" name="id" value="" readonly="true" class="w3-input w3-border">
                    <div class="w3-half">
                            <!--<label>Nome</label>-->
                            <input id="editNome" type="hidden" name="nome" value="" class="w3-input w3-border">
                            <!--<label>Cognome</label>-->
                            <input id="editCognome" type="hidden" name="cognome" value="" class="w3-input w3-border">
                        
                        <label>ALT_NAME</label>
                        <input id="editAltName" type="text" name="alt_name" value="" class="w3-input w3-border">
                    </div>
                    <div class="w3-half">
                            <!--<label>Titolo</label>-->
                            <input id="editTitolo" type="hidden" name="titolo" value="" class="w3-input w3-border">
                        <div class="w3-third">
                            <label>Tipologia</label>
                            <select id="editTipo" name="selectTipo" class="w3-select">
                                <option value='0'> - </option>
                                <?php 
                                $sql = "SELECT id, nome FROM tipologiaPersona WHERE (id = 3 || id = 4 || id = 5 || id = 6)";
                                $result = $conn->query($sql);   
                                while($row = $result->fetch_assoc()){
                                echo "<option value='".$row["id"]."'>" . $row['nome'] . "</option>";
                                }

                                ?>
                            </select>                        
                        </div>
                        
                        <div class="w3-twothird">
                            <label>Link</label>
                            <input type="text" id="editLink" name="editLink" value="" class="w3-input w3-border">
                        </div>
                        
                        
                    </div>        
                
                <!--
                <div class="w3-twothird w3-center">
                    <label>biografia</label>
                    <textarea id="biografiaE" rows="4" cols="50"></textarea>
                </div>
                -->
                
                
                
                <input id="editSubmit" class="w3-button w3-right" type="button" value="Submit">
            </form>
            
             
        </div>
    </div>
    <script>$('#editBox').hide();</script>
    
    


    
    <?php
    
    include 'stampaAmministratore.php';
    echo stampaSponsorAmministratore($conn);
    ?>
    
    <div id="spazioPerFixedUPD" class="w3-center" style="height:200px">Fine</div>
        </div>
    <?php
    $conn->close();
    ?>
    
        
    <script>
        
        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : sParameterName[1];
                }
            }
        };
        
        
        //PREpendo filtro persona/sponsor/etc..
        var filtroPersona= "<div class='w3-grey w3-row w3-padding'>"+
                                "<div id='btnProduzione' class='w3-col s2 w3-button w3-blue' onClick='filtraTipoPersona(3);'>Produzione</div>"+
                                "<div id='btnSponsor' class='w3-col s2 w3-button w3-green' onClick='filtraTipoPersona(4);'>Sponsor</div>"+
                                "<div id='btnPatocinio' class='w3-col s2 w3-button w3-orange' onClick='filtraTipoPersona(5);'>Patrocinio</div>"+
                                "<div id='btnAltro' class='w3-col s2 w3-button w3-purple' onClick='filtraTipoPersona(6);'>Altro</div>"+
                                "<div class='w3-col s2 w3-button w3-black w3-right' onClick='rimuoviFiltroTipoPersona();'>[TUTTO]</div>"+
                            "</div>"
        $("#tabellaPersona").before(filtroPersona);
        function filtraTipoPersona(tipo){
            sessionStorage["ultimaTipologiaSponsor"] = tipo;
            //alert(sessionStorage["ultimaTipologiaSponsor"]);
            $(".rigaTabella").hide();
            $(".rigaTipo"+tipo).show();
            $("#addTipo").val(tipo); //scelgo categoria cliccata
        }
        function rimuoviFiltroTipoPersona(){
            $(".rigaTabella").show();
        }
        
        
        
        var id= getUrlParameter('id');
        var tipologia= getUrlParameter('tipologia');
        //alert(id+" T:"+tipologia);
        if(tipologia==3){$("#btnProduzione").trigger("click");}
        if(tipologia==4){$("#btnSponsor").trigger("click");}
        if(tipologia==5){$("#btnPatocinio").trigger("click");}
        if(tipologia==6){$("#btnAltro").trigger("click");}
        
        if(id && tipologia){
            $("html, body").animate({ scrollTop: $('#'+id).offset().top }, 100);
            // do fading 3 times
            for(i=0;i<3;i++) {
                $('#'+id).fadeTo('slow', 0.5).fadeTo('slow', 1.0);
            }
        }
        //FINGO CLICK ARTISTI
        //$( "#btnProduzione" ).trigger( "click" );
        filtraTipoPersona(sessionStorage["ultimaTipologiaSponsor"]);
    </script>
    
    <script src="../js/personaAdd.js"></script>
    <script src="../js/personaDelete.js"></script>
    <script src="../js/personaUpdate.js"></script>
    
    
</body>

</html>
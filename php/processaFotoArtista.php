<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <title>Gestione foto artisti</title>
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <script src="../js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body style="max-width:800px; margin:0 auto;">
    <div id="corpo">
        <!-- "banner" -->
        <?php 
            if($_GET["tipologia"] == 1 || $_GET["tipologia"] == 2) echo '<a href="../php/processaPersona.php?id='.$_GET["id"].'&tipologia='.$_GET["tipologia"].'">';
            if($_GET["tipologia"] == 3 || $_GET["tipologia"] == 4 || $_GET["tipologia"] == 5 || $_GET["tipologia"] == 6) echo '<a href="../php/processaSponsor.php?id='.$_GET["id"].'&tipologia='.$_GET["tipologia"].'">';
        ?>
        <!--<a href="../php/processaPersona.php">-->
            <div class="w3-row w3-center w3-xlarge w3-green">
                <div class="w3-third w3-hover-orange"><i class='fa fa-undo fa-2x' aria-hidden='true'></i> </div>
                <div class="w3-twothird"> Torna alla lista artisti</div>
            </div>
        </a>

        <!-- select evento (MAIN) -->
        <form id="sceltaArtista"> 
            <select style="font-size:25px; margin-top:50px;" id="selectArtista" name="selectArtista" class="w3-select w3-yellow w3-hover-amber">
                <label>Scegli Artista:</label>

                <option value='0'> - scegli evento -</option>
                <?php 

                require 'configurazione.php';
                require 'connessione.php';
                $stmt = $conn->prepare("SELECT id, nome, cognome, alt_name FROM Persona WHERE 1 ORDER BY id");
                $stmt->execute();
                $stmt->bind_result($id, $nome, $cognome, $alt_name);

                while($stmt->fetch()){
                    echo "<option value=".$id.">" . $nome ." ".$cognome." - ".$alt_name. "</option>";
                }
                $stmt->close();
                ?>
            </select>
        </form>
        
        <hr>
        <div id='wrapArtista'></div>

        <script>
            //
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
            
            $("#selectArtista").val(getUrlParameter('id'));
            
            //GESTIONE SELECT EVENTO 
            
            if($("#selectArtista").val() != 0) {
                $("#wrapArtista").load("fotoArtista.php", {'idArtista': $("#selectArtista").val()});
            }
            $("#sceltaArtista").change(function() {
                    $("#wrapArtista").load("fotoArtista.php", {'idArtista': $("#selectArtista").val()});
                    //onChange chiamo pagina evento
                });
                
            // /GESTIONE SELECT EVENTO
        </script>
    </div>
</body>

</html>
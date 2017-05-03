<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <title>Gestione foto eventi</title>
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <script src="../js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body style="max-width:800px; margin:0 auto;">
    <div id="corpo">
        <!-- "banner" -->
        <a href="../php/processaEvento.php">
            <div class="w3-row w3-center w3-xlarge w3-green">
                <div class="w3-third w3-hover-orange"><i class='fa fa-undo fa-2x' aria-hidden='true'></i> </div>
                <div class="w3-twothird"> Torna alla lista eventi</div>
            </div>
        </a>
        
        <!-- select evento (MAIN) -->
        <form id="sceltaEvento"> 
            <select style="font-size:25px; margin-top:50px;" id="selectEvento" name="selectEvento" class="w3-select w3-yellow w3-hover-amber">
                <label>Scegli Evento:</label>

                <option value='0'> - scegli evento -</option>
                <?php 

                require 'configurazione.php';
                require 'connessione.php';
                $stmt = $conn->prepare("SELECT id, nome FROM Evento WHERE 1 ORDER BY id");
                $stmt->execute();
                $stmt->bind_result($id, $nome);

                while($stmt->fetch()){
                    echo "<option value=".$id.">" . $nome . "</option>";
                }
                $stmt->close();
                ?>
            </select>
        </form>
        
        <hr>
        <div id='wrapEvento'></div>

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
            
            $("#selectEvento").val(getUrlParameter('id'));
            
            //GESTIONE SELECT EVENTO 
            
            if($("#selectEvento").val() != 0) {
                $("#wrapEvento").load("fotoEvento.php", {'idEvento': $("#selectEvento").val()});
            }
            $("#sceltaEvento").change(function() {
                    $("#wrapEvento").load("fotoEvento.php", {'idEvento': $("#selectEvento").val()});
                    //onChange chiamo pagina evento
                });
                
            // /GESTIONE SELECT EVENTO
        </script>
    </div>
</body>

</html>
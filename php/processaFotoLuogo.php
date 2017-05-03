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
        <a href="../php/processaLuogo.php">
            <div class="w3-row w3-center w3-xlarge w3-green">
                <div class="w3-third w3-hover-orange"><i class='fa fa-undo fa-2x' aria-hidden='true'></i> </div>
                <div class="w3-twothird"> Torna alla lista Luoghi</div>
            </div>
        </a>
        
        <!-- select luogo (MAIN) -->
        <form id="sceltaLuogo"> 
            <select style="font-size:25px; margin-top:50px;" id="selectLuogo" name="selectLuogo" class="w3-select w3-yellow w3-hover-amber">
                <label>Scegli Luogo:</label>

                <option value='0'> - scegli luogo -</option>
                <?php 

                require 'configurazione.php';
                require 'connessione.php';
                $stmt = $conn->prepare("SELECT id, nome FROM Luogo WHERE 1 ORDER BY id");
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
        <div id='wrapLuogo'></div>

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
            
            $("#selectLuogo").val(getUrlParameter('id'));
            
            //GESTIONE SELECT Luogo 
            
            if($("#selectLuogo").val() != 0) {
                $("#wrapLuogo").load("fotoLuogo.php", {'idLuogo': $("#selectLuogo").val()});
            }
            $("#sceltaLuogo").change(function() {
                    $("#wrapLuogo").load("fotoLuogo.php", {'idLuogo': $("#selectLuogo").val()});
                    //onChange chiamo pagina Luogo
                });
                
            // /GESTIONE SELECT Luogo
        </script>
    </div>
</body>

</html>
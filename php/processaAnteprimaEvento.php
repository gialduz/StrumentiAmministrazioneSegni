<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <title>Test singolo evento</title>
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <script src="../js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body style="max-width:800px; margin:0 auto;" class="w3-border w3-border-red">

    <!-- "banner" -->
    <div class="w3-row w3-center w3-xlarge">
        <a href="../amministrazione.html"><div class="w3-third w3-deep-orange w3-hover-orange"><i class='fa fa-home fa-2x' aria-hidden='true'></i> Amministrazione</div></a>
        <div class="w3-twothird w3-pale-yellow"><i class='fa fa-map-o fa-2x' aria-hidden='true'></i> Anteprima</div>
    </div>
    
    <!-- select evento (MAIN) -->
    <form id="sceltaEvento"> 
        <select style="font-size:25px; margin-top:50px;" id="selectEvento" name="selectTipo" class="w3-select w3-yellow w3-hover-amber">
            <label>Nome Evento:</label>

            <option value='0'> - scegli evento -</option>
            <?php 
            
            require 'configurazione.php';// richiamo il file di configurazione
            require 'connessione.php';// richiamo lo script responsabile della connessione a MySQL
            $stmt = $conn->prepare("SELECT id, nome FROM Evento WHERE 1 ORDER BY id");
            $stmt->execute();
            $stmt->bind_result($id, $nome);

            while($stmt->fetch()){
                echo "<option value=".$id.">" . $nome . "</option>";
            }
            ?>
            $stmt->close();
        </select>
    </form>
    
    <div id='wrapAnteprima'></div>
    
<script>
    //GESTIONE SELECT EVENTO 
    if($("#selectEvento").val() != 0) {
        $("#wrapAnteprima").load("anteprimaEvento.php", {'eventoDaPassare': $("#selectEvento").val()});
    }
    $( "#sceltaEvento" ).change(function() {
            $("#wrapAnteprima").load("anteprimaEvento.php", {'eventoDaPassare': $("#selectEvento").val()});
            //onChange chiamo pagina evento
        });
    // /GESTIONE SELECT EVENTO
</script>
    
</body>

</html>
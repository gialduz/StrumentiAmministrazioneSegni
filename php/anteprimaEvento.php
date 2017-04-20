<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0">
    <title>Test singolo evento</title>
    <meta charset="utf-8">
    
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/stile.css">
    <script src="../js/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body style="max-width:800px; margin:0 auto;" >

 
        
    
<?php

include 'mieFunzioni.php';



$numeroEvento = $_POST[eventoDaPassare];
echo stampaEvento($numeroEvento);
?>
    
</body>

</html>
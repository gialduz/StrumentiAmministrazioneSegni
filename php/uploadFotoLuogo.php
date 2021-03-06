
<?php
$id_luogo= $_POST["idLuogo"];
$url_attuale= $_POST["urlAttuale"];

//GESTIONE UPLOAD FOTO Luogo

$target_dir = "../..//App/img/luogo/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 0;
}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 1500000) {
    echo "Sorry, your file is too large.(Img must be <1.5MB)";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        //UPLOAD FOTO RIUSCITO
        if(file_exists($url_attuale)) {
            //Cancello vecchia img
            unlink($url_attuale);
        }
        
        
        require 'configurazione.php';
        require 'connessione.php';
        $stmt = $conn->prepare("UPDATE Luogo SET foto = ? WHERE id = ?;");
        
        $stmt->bind_param("si", $target_file, $id_luogo); //target_file è il path completo di file
        $stmt->execute();

        $stmt->close();
        
        
        
        
        
        header("location: processaFotoLuogo.php?id=".$id_luogo);
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
?>


<?php
$id_artista= $_POST["idArtista"];
$url_attuale= $_POST["urlAttuale"];
$url_attuale_mini= $_POST["urlAttualeMini"];
$tipologia= $_POST["tipologia"];


//GESTIONE UPLOAD FOTO ARTISTA

$target_dir = "../..//App/img/artista/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$target_file_mini = $target_dir . "mini/" . basename($_FILES["fileToUpload"]["name"]);

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
if ($_FILES["fileToUpload"]["size"] > 1000000) {
    echo "Sorry, your file is too large.(<1MB)";
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
    $immagineDaCaricare = $_FILES["fileToUpload"]["tmp_name"];
    if (move_uploaded_file($immagineDaCaricare, $target_file)) {
        //UPLOAD FOTO RIUSCITO
        if(file_exists($url_attuale)) {
            //Cancello vecchia img
            unlink($url_attuale);
        }
        
        
        // COMPRESSIONE   --------------
        function compress($source, $destination, $quality) {

            $info = getimagesize($source);

            if ($info['mime'] == 'image/jpeg') 
                $image = imagecreatefromjpeg($source);

            elseif ($info['mime'] == 'image/gif') 
                $image = imagecreatefromgif($source);

            elseif ($info['mime'] == 'image/png') 
                $image = imagecreatefrompng($source);

            imagejpeg($image, $destination, $quality);

            return $destination;
        }
        
        
        
        $source_img = $target_file;
        $destination_img = $target_file_mini;
        
            //elimino vecchia foto mini
        if (file_exists($url_attuale_mini)) {
            unlink($url_attuale_mini);
        }

        $d = compress($source_img, $destination_img, 50);
        // /Compressione
        
        
        // CROP 50x50 - overwrite  -----------------------
            //Your Image
        $imgSrc = $destination_img;
        
            //getting the image dimensions
        list($width, $height) = getimagesize($imgSrc);

            //saving the image into memory (for manipulation with GD Library)
        $myImage = imagecreatefromjpeg($imgSrc);

            // calculating the part of the image to use for thumbnail
        if ($width > $height) {
          $y = 0;
          $x = ($width - $height) / 2;
          $smallestSide = $height;
        } else {
          $x = 0;
          $y = ($height - $width) / 2;
          $smallestSide = $width;
        }

            // copying the part into thumbnail
        $thumbSize = 100;
        $thumb = imagecreatetruecolor($thumbSize, $thumbSize);
        imagecopyresampled($thumb, $myImage, 0, 0, $x, $y, $thumbSize, $thumbSize, $smallestSide, $smallestSide);
        
        imagejpeg($thumb, $target_file_mini);
        // /Crop 50x50
        
        require 'configurazione.php';
        require 'connessione.php';
        $stmt = $conn->prepare("UPDATE Persona SET foto = ?, foto_mini= ? WHERE id = ?;");
        
        $stmt->bind_param("ssi", $target_file, $target_file_mini, $id_artista); //target_file è il path completo di file
        $stmt->execute();

        $stmt->close();
        
        
        
        
        
        header("location: processaFotoArtista.php?id=".$id_artista."&tipologia=".$tipologia);
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
?>

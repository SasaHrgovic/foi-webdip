<?php
$gr_image = "";
function upload_image() {
    global $baza, $gr_image;
    if(isset($_FILES['image']['name']) && ($_FILES['image']['name'] != "")){
        $image_name = $_FILES['image']['name'];
        $image_size =$_FILES['image']['size'];
        $image_tmp =$_FILES['image']['tmp_name'];
        $image_type=$_FILES['image']['type'];
        $image_extension = strtolower(pathinfo($image_name, PATHINFO_EXTENSION));

        if (!in_array($image_extension, array('jpg','jpeg','png','gif'))) {
            $gr_image = "Slika nije podržanog formata (jpg, png, gif)";
            return;
        }
        if ($image_size > 2097152) {
            $gr_image = "Slika je prevelika.";
            return;
        }
        else {
            $new_name = sha1(mt_rand(10000,99999).time());
            $new_name = $new_name . '.' . $image_extension;
            if(move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/" . $new_name)) {
                $upit = "insert into slike (name, mime, size) values ('$new_name','$image_type','$image_size')";
                $baza->updateDB($upit);
                $upit = "select slika_id from slike where name = '$new_name'";
                $slika_id = mysqli_fetch_array($baza->selectDB($upit))['slika_id'];
                return $slika_id;
            }
            else {
                $gr_image = "Upload slike nije uspio";
            }
        }
    }
    else return 'NULL';
}
?>
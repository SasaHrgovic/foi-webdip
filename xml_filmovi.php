<?php
require_once ('./aplikacijski_okvir.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><filmovi>';
    while($polje = $rezultat->fetch_array()){
        $film_id = $polje['film_id'];
        $naziv = $polje['naziv'];
        $trajanje = $polje['trajanje'];
        echo "<film film_id='$film_id' naziv='$naziv' trajanje='$trajanje'/>";
    }
    echo "</filmovi>";
}

 if($_SERVER["REQUEST_METHOD"] == "GET"){
    $upit = "select film_id, naziv, trajanje from filmovi where obrisan='0'";
    $rezultat = $baza->selectDB($upit);
    generiraj_xml($rezultat);
 }
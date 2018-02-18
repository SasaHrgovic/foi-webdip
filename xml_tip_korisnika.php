<?php
require_once ('./aplikacijski_okvir.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><tipovi_korisnika>';
    while($polje = $rezultat->fetch_array()){
        $tip_id = $polje['tip_id'];
        $naziv = $polje['naziv'];
        echo "<tip_korisnika tip_id='$tip_id' naziv='$naziv'/>";
    }
    echo "</tipovi_korisnika>";
}

if($_SERVER["REQUEST_METHOD"] == "GET"){
    $upit = "select tip_id, naziv from tip_korisnika where obrisan='0'";
    $rezultat = $baza->selectDB($upit);
    generiraj_xml($rezultat);
}
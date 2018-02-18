<?php
include_once './baza.class.php';
$baza = new Baza();
$baza->spojiDB();

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><zanrovi>';
    while($polje = $rezultat->fetch_array()){
        $zanr_id = $polje['zanr_id'];
        $naziv = $polje['naziv'];
        echo "<zanr zanr_id='$zanr_id' naziv='$naziv'/>";
    }
    echo "</zanrovi>";
}

if($_SERVER["REQUEST_METHOD"] == "GET"){
    $upit = "select * from zanrovi where obrisan='0'";
    $rezultat = $baza->selectDB($upit);
    generiraj_xml($rezultat);
}
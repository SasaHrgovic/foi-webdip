<?php
include_once './baza.class.php';
$baza = new Baza();
$baza->spojiDB();

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><drzave>';
    while($polje = $rezultat->fetch_array()){
        $drzava_id = $polje['drzava_id'];
        $naziv = $polje['naziv'];
        echo "<drzava drzava_id='$drzava_id' naziv='$naziv'/>";
    }
    echo "</drzave>";
}

if($_SERVER["REQUEST_METHOD"] == "GET"){
    $upit = "select * from drzave where obrisan='0'";
    $rezultat = $baza->selectDB($upit);
    generiraj_xml($rezultat);
}
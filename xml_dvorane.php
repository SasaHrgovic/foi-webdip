<?php
require_once ('./aplikacijski_okvir.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><dvorane>';
    while($polje = $rezultat->fetch_array()){
        $dvorana_id = $polje['dvorana_id'];
        $broj = $polje['broj'];
        $broj_mjesta = $polje['broj_mjesta'];
        echo "<dvorana dvorana_id='$dvorana_id' broj='$broj' broj_mjesta='$broj_mjesta'/>";
    }
    echo "</dvorane>";
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['lokacija_id']) && ($_GET['lokacija_id']) != ""){
    $id = $_GET['lokacija_id'];
    $upit = "select dvorane.dvorana_id, dvorane.broj, dvorane.broj_mjesta from dvorane, lokacije where dvorane.lokacija_id = lokacije.lokacija_id and lokacije.lokacija_id = '$id' and dvorane.obrisan='0'";
    $rezultat = $baza->selectDB($upit);  
    generiraj_xml($rezultat);
}
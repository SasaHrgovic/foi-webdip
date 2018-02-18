<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><projekcije>';
    while($polje = $rezultat->fetch_array()){
        $projekcija_id = $polje['projekcija_id'];
        $naziv = $polje['naziv'];
        $vrijeme_pocetak = $polje['vrijeme_pocetak'];

        echo "<projekcija projekcija_id='$projekcija_id' naziv='$naziv' vrijeme_pocetak='$vrijeme_pocetak'/>";
    }
    echo "</projekcije>";
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != ""){
    $dvorana_id = $_GET['dvorana_id'];
    $vrijeme = getPomak();
    $upit = "select projekcija_id, naziv, vrijeme_pocetak from projekcije_pogled where dvorana_id = '$dvorana_id' and vrijeme_pocetak > '$vrijeme'";
    $rezultat = $baza->selectDB($upit); 
    generiraj_xml($rezultat); 
}
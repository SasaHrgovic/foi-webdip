<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><projekcije>';
    while($polje = $rezultat->fetch_array()){
        $projekcija_id = $polje['projekcija_id'];
        $dvorana_id = $polje['dvorana_id'];
        $naziv = $polje['naziv'];
        $vrijeme_pocetak = $polje['vrijeme_pocetak'];
        $vrijeme_pocetak = date("d.m.Y H:i:s", strtotime($vrijeme_pocetak));
        $film_id = $polje['film_id'];
        $datum = substr($vrijeme_pocetak, 0, 10);
        $vrijeme = substr($vrijeme_pocetak, -8);

        $upit = "select slike.name from slike, projekcije_pogled, filmovi where slike.slika_id = filmovi.slika_id and filmovi.film_id = projekcije_pogled.film_id and projekcije_pogled.projekcija_id=$projekcija_id";
        $slika = mysqli_fetch_array($baza->selectDB($upit))['name'];

        echo "<projekcija projekcija_id='$projekcija_id' dvorana_id='$dvorana_id' naziv='$naziv' datum='$datum' vrijeme='$vrijeme' film_id='$film_id' slika='$slika'/>";
    }
    echo "</projekcije>";
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['lokacija_id']) && ($_GET['lokacija_id']) != ""){
    $lokacija_id = $_GET['lokacija_id'];
    $vrijeme = getPomak();
    $upit = "select projekcija_id, naziv, vrijeme_pocetak, film_id from projekcije_pogled where lokacija_id = '$lokacija_id' and vrijeme_pocetak > '$vrijeme' limit 3";
    $rezultat = $baza->selectDB($upit); 
    generiraj_xml($rezultat); 
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['lokacija']) && ($_GET['lokacija']) != ""){
    $lokacija_id = $_GET['lokacija'];
    $vrijeme = getPomak();
    $upit = "select projekcija_id, naziv, vrijeme_pocetak, dvorana_id, film_id from projekcije_pogled where lokacija_id = '$lokacija_id' and vrijeme_pocetak > '$vrijeme'";
    $rezultat = $baza->selectDB($upit); 
    generiraj_xml($rezultat); 
}
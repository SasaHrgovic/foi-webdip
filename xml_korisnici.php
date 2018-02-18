<?php
require_once ('./aplikacijski_okvir.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><korisnici>';
    while($polje = $rezultat->fetch_array()){
        $korisnik_id = $polje['korisnik_id'];
        $ime = $polje['ime'];
        $prezime = $polje['prezime'];
        echo "<korisnik korisnik_id='$korisnik_id' ime='$ime' prezime='$prezime'/>";
    }
    echo "</korisnici>";
}

 if($_SERVER["REQUEST_METHOD"] == "GET"){
    $upit = "select korisnik_id, ime, prezime from korisnici where obrisan='0'";
    $rezultat = $baza->selectDB($upit);
    generiraj_xml($rezultat);
 }
<?php
require_once ('./aplikacijski_okvir.php');

function generiraj_xml($rezultat1, $rezultat2){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><preklapanja>';
    while($polje1 = $rezultat1->fetch_array()){
        $naziv = $polje1['naziv'];
        $pocetak = $polje1['vrijeme_pocetak'];
        $zavrsetak = $polje1['vrijeme_zavrsetak'];
        echo "<pocetak naziv='$naziv' pocetak='$pocetak' zavrsetak='$zavrsetak'/>";
    }
    while($polje2 = $rezultat2->fetch_array()){
        $naziv = $polje2['naziv'];
        $pocetak = $polje2['vrijeme_pocetak'];
        $zavrsetak = $polje2['vrijeme_zavrsetak'];
        echo "<zavrsetak naziv='$naziv' pocetak='$pocetak' zavrsetak='$zavrsetak'/>";
    }
    echo "</preklapanja>";
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != ""){
    $film_id = $_GET['film_id'];
    $dvorana_id = $_GET['dvorana_id'];
    $vrijeme_pocetak = $_GET['vrijeme'];

    $upit = "select trajanje from filmovi where film_id='$film_id'";
    $trajanje = mysqli_fetch_array($baza->selectDB($upit))['trajanje'];
    $trajanje = ($trajanje + 30)*60;

    $vrijeme_zavrsetak = strtotime($vrijeme_pocetak) + $trajanje;
    $vrijeme_zavrsetak = date("Y-m-d H:i:s", $vrijeme_zavrsetak);

    $upit = "select naziv, vrijeme_pocetak, vrijeme_zavrsetak from projekcije_pogled where vrijeme_pocetak between '$vrijeme_pocetak' and '$vrijeme_zavrsetak' limit 1";
    $rezultat1 = $baza->selectDB($upit);  
    $upit = "select naziv, vrijeme_pocetak, vrijeme_zavrsetak from projekcije_pogled where vrijeme_zavrsetak between '$vrijeme_pocetak' and '$vrijeme_zavrsetak' limit 1";
    $rezultat2 = $baza->selectDB($upit);
    generiraj_xml($rezultat1, $rezultat2);
}
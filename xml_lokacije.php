<?php
require_once ('./aplikacijski_okvir.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><lokacije>';
    while($polje = $rezultat->fetch_array()){
        $lokacija_id = $polje['lokacija_id'];
        $naziv = $polje['naziv'];

        echo "<lokacija lokacija_id='$lokacija_id' naziv='$naziv'/>";
    }
    echo "</lokacije>";
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['dohvati_lokacije']) && ($_GET['dohvati_lokacije']) != ""){
    if(isset($_SESSION['korisnik_id'])){
        if($_SESSION['tip_id'] == 1) {
            $upit = "select lokacija_id, naziv from lokacije where obrisan='0'";
        }
        elseif($_SESSION['tip_id'] == 2) {
            $moderator_id = $_SESSION['korisnik_id'];
            $upit = "select lokacija_id, naziv from lokacije where moderator_id='$moderator_id' and obrisan='0'";
        }
        else {
            $upit = "select lokacija_id, naziv from lokacije where obrisan='0'";
        }
    }
    else {
        $upit = "select lokacija_id, naziv from lokacije where obrisan='0'";
    }
    $rezultat = $baza->selectDB($upit);  
    generiraj_xml($rezultat);
}
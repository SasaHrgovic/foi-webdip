<?php
require_once ('./aplikacijski_okvir.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><tipovi_radnje>';
    while($polje = $rezultat->fetch_array()){
        $tip_radnje_id = $polje['tip_radnje_id'];
        $radnja = $polje['radnja'];
        echo "<tip_radnje tip_radnje_id='$tip_radnje_id' radnja='$radnja'/>";
    }
    echo "</tipovi_radnje>";
}

if($_SERVER["REQUEST_METHOD"] == "GET"){
    $upit = "select tip_radnje_id, radnja from tip_radnje where obrisan='0'";
    $rezultat = $baza->selectDB($upit);
    generiraj_xml($rezultat);
}
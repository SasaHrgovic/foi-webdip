<?php
require_once ('./aplikacijski_okvir.php');

function generiraj_xml($rezultat){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><radnje>';
    while($polje = $rezultat->fetch_array()){
        $radnja = $polje['radnja'];
        echo "<radnja radnja='$radnja'/>";
    }
    echo "</radnje>";
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['tip_radnje_id']) && ($_GET['tip_radnje_id']) != ""){
    $tip_radnje_id = $_GET['tip_radnje_id'];
    $upit = "select distinct(opis) as radnja from dnevnik where tip_radnje_id=$tip_radnje_id and obrisan='0'";
    $rezultat = $baza->selectDB($upit);
    generiraj_xml($rezultat);
}
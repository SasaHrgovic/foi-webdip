<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if(isset($_SESSION['korisnik_id'])){
    $korisnik = $_SESSION['korisnik_id'];
    $vrijeme = getPomak();
    $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'lokacije.php', '3')";
    $baza->updateDB($upit);
}

$lat = $long = "";
 if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['lat']) && ($_GET['lat']) != "" && isset($_GET['long']) && ($_GET['long']) != ""){
     $lat = $_GET['lat'];
     $long = $_GET['long'];
 }

$skripta = "<script type='text/javascript' src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDNlknVcXJW5wcEAqEtreBe7FjHDtAZKTc'></script><script src='js/maps.js'></script><script src='js/analytics.js'></script>";
$title = "Lokacije";
$smarty->assign('title', $title);
$smarty->assign('skripta', $skripta);
$smarty->assign('lat', $lat);
$smarty->assign('long', $long);
$smarty->display('header.tpl');
$smarty->display('lokacije.tpl');
$smarty->display('footer.tpl');

ob_flush();
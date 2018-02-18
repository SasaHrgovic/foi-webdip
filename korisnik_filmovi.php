<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if(isset($_SESSION['korisnik_id'])){
    $korisnik = $_SESSION['korisnik_id'];
    $vrijeme = getPomak();
    $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'korisnik_filmovi.php', '3')";
    $baza->updateDB($upit);
}

$film_id = "";
if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['film_id']) && ($_GET['film_id']) != ""){
     $film_id = $_GET['film_id'];
}

$skripta = "<script src='js/analytics.js'></script><script src='js/korisnik_filmovi.js'></script>";

$title = "Filmovi";
$smarty->assign('title', $title);
$smarty->assign('skripta', $skripta);
$smarty->assign('film_id', $film_id);
$smarty->display('header.tpl');
$smarty->display('korisnik_filmovi.tpl');
$smarty->display('footer.tpl');

ob_flush();
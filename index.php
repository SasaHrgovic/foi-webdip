<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if(isset($_SESSION['korisnik_id'])){
    $korisnik = $_SESSION['korisnik_id'];
    $vrijeme = getPomak();
    $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'index.php', '3')";
    $baza->updateDB($upit);
}

$skripta = "<script src='js/carousel.js'></script><script src='js/ajax_index.js'></script><script src='js/analytics.js'></script>";

$title = "Početna";
$smarty->assign('title', $title);
$smarty->assign('skripta', $skripta);
$smarty->display('header.tpl');
$smarty->display('index.tpl');
$smarty->display('footer.tpl');

?>   
        
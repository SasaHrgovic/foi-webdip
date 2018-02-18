<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] < 3) {
        $korisnik = $_SESSION['korisnik_id'];
        $vrijeme = getPomak();
        $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'moderator_projekcije.php', '3')";
        $baza->updateDB($upit);

        $skripta = "<script src='js/ajax_projekcije.js'></script><script src='js/analytics.js'></script>";
        $title = "Dodaj projekciju";
        $smarty->assign('title', $title);
        $smarty->assign('skripta', $skripta);
        $smarty->display('header.tpl');
        $smarty->display('moderator_panel.tpl');
        $smarty->display('moderator_projekcije.tpl');
        $smarty->display('footer.tpl');
    }
}

ob_flush();
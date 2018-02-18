<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if(isset($_SESSION['korisnik_id'])){
        $korisnik = $_SESSION['korisnik_id'];
        $vrijeme = getPomak();
        $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'korisnik_odobreno.php', '3')";
        $baza->updateDB($upit);

        $skripta = "<script src='js/ajax_odobreno.js'></script><script src='js/analytics.js'></script>";
        $title = "Moje rezervacije";
        $smarty->assign('title', $title);
        $smarty->assign('skripta', $skripta);
        $smarty->display('header.tpl');
        $smarty->display('korisnik_panel.tpl');
        $smarty->display('korisnik_odobreno.tpl');
        $smarty->display('footer.tpl');
}

ob_flush();
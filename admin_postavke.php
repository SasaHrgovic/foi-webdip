<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] == 1) {
        
        $vrijeme_pomak = getPomak();
        $stranice_vrijednost = getStranice();
        $korisnik = $_SESSION['korisnik_id'];
        $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme_pomak', '$korisnik', 'admin_postavke.php', '3')";
        $baza->updateDB($upit);

        $skripta = "<script src='js/ajax_postavke.js'></script><script src='js/analytics.js'></script>";
        $title = "Postavke";
        $smarty->assign('title', $title);
        $smarty->assign('skripta', $skripta);
        $smarty->assign('vrijeme_pomak', $vrijeme_pomak);
        $smarty->assign('stranice_vrijednost', $stranice_vrijednost);
        $smarty->display('header.tpl');
        $smarty->display('admin_panel.tpl');
        $smarty->display('admin_postavke.tpl');
        $smarty->display('footer.tpl');
    }
}
ob_flush();
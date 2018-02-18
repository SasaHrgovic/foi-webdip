<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] == 1) {
        $korisnik = $_SESSION['korisnik_id'];
        $vrijeme = getPomak();
        $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'admin_dvorane.php', '3')";
        $baza->updateDB($upit);

        $skripta = "<script src='js/ajax_dvorane.js'></script><script src='js/analytics.js'></script>";
        $title = "Dvorane";
        $smarty->assign('title', $title);
        $smarty->assign('skripta', $skripta);
        $smarty->display('header.tpl');
        $smarty->display('admin_panel.tpl');
        $smarty->display('admin_dvorane.tpl');
        $smarty->display('footer.tpl');
    }
}
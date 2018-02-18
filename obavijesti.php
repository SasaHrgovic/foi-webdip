<?php
require_once ('./aplikacijski_okvir.php');

$poruka = $greska_poruka = "";

if($_SERVER["REQUEST_METHOD"] == "GET"){
    if (isset($_GET['greska']) && ($_GET['greska']) != "") {
        $greska = $_GET['greska'];
        switch ($greska) {
            case 1:
                $greska_poruka = "Vaš račun je blokiran zbog prevelikog broja neuspjelih prijava. Obratite se administratoru.";
                break;
            case 2:
                $greska_poruka = "Korisnički račun još uvijek nije aktiviran";
                break;
        }
    }
    elseif (isset($_GET['obavijest']) && ($_GET['obavijest']) != "") {
        $obavijest = $_GET['obavijest'];
        switch ($obavijest) {
            case 1:
                $poruka = "Vaša registracija je zaprimljena. Na vašu e-mail adresu poslan je aktivacijski link koji vrijedi 24 sata.";
        }
    }
    
}

$smarty->assign('greska_poruka', $greska_poruka);
$smarty->assign('poruka', $poruka);
$smarty->display('header.tpl');
$smarty->display('obavijesti.tpl');
$smarty->display('footer.tpl');
ob_flush();

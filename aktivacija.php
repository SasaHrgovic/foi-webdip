<?php
require_once ('./aplikacijski_okvir.php');
$poruka = "";

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['kod']) && ($_GET['kod']) != "") {
    $baza = new Baza();
    $baza->spojiDB();
    $kod = $_GET['kod'];

    $upit = "select * from korisnici where aktivacijski_kod='$kod'";
    if ($baza->selectDB($upit)->num_rows == 0) {
        $poruka = "Korisnik nije registriran ili je kod neispravan";
    }
    else {
        $poruka = "Aktiviran";
        $upit = "select aktivan from korisnici where aktivacijski_kod='$kod'";
        if(mysqli_fetch_array($baza->selectDB($upit))['aktivan'] == 1) {
            $poruka = "Aktivacijski kod je već iskorišten";
        }
        else {
            $upit = "select vrijeme from korisnici where aktivacijski_kod='$kod'";
            $vrijeme = strtotime(mysqli_fetch_array($baza->selectDB($upit))['vrijeme'])/3600;
            $trenutno = strtotime("now")/3600 + 2;
            echo $razlika = ($trenutno - $vrijeme);
            if ($razlika < 24) {
                $upit = "update korisnici set aktivan=1 where aktivacijski_kod='$kod'";
                $baza->updateDB($upit);
                $upit = "select korisnik_id from korisnici where aktivacijski_kod='$kod'";
                $id = mysqli_fetch_array($baza->selectDB($upit))['korisnik_id'];
                //header("Location: detalji_korisnika.php?korisnik_id=$id");
            }
            else {
                $poruka = "Aktivacijski kod je istekao";
            }
        }
    }
}
else {
    $poruka = "Aktivacijski kod nije postavljen";
}

$smarty->assign('poruka', $poruka);
$smarty->display('header.tpl');
$smarty->display('obavijesti.tpl');
$smarty->display('footer.tpl');
ob_flush();
?>
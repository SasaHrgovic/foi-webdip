<?php
include_once 'baza.class.php';

$registracija = $prijava_odjava = $panel = $profil_nav = $slika_nav = "";
if(isset($_SESSION['korisnik_id'])){
    $korisnik_id = $_SESSION['korisnik_id'];
    $baza = new Baza();
    $baza->spojiDB();
    $upit = "select slike.name from slike, korisnici where korisnici.korisnik_id = '$korisnik_id' and korisnici.slika_id = slike.slika_id";
    $rezultat = $baza->selectDB($upit);
    while($polje = $rezultat->fetch_array()){
        $slika_link = $polje['name'];
        $slika_nav = "<a href='#'><img class='slika_nav' src='uploads/" . $slika_link. "' alt=''></a>";
    }
    $prijava_odjava = '<li><a href="odjava.php">Odjava</a></li>';
    $ime_nav = $_SESSION['ime'];
    $profil_nav = "<li><a href='#'>$ime_nav</a></li>";
    if ($_SESSION['tip_id'] == 1) {
        $panel = '<li><a href="admin_lokacije.php">Admin</a></li><li><a href="moderator_filmovi.php">Moderator</a></li><li><a href="korisnik_rezervacije.php">Rezervacije</a></li>';
    }
    elseif ($_SESSION['tip_id'] == 2) {
        $panel = '<li><a href="moderator_filmovi.php">Moderator</a></li><li><a href="korisnik_rezervacije.php">Rezervacije</a></li>';
    }
    elseif ($_SESSION['tip_id'] == 3) {
        $panel = '<li><a href="korisnik_rezervacije.php">Rezervacije</a></li>';
    }
}
else {
    $registracija = '<li><a href="registration.php">Registracija</a></li>';
    $prijava_odjava = '<li><a href="prijava.php">Prijava</a></li>';
}

$smarty->assign('registracija', $registracija);
$smarty->assign('prijava_odjava',$prijava_odjava);
$smarty->assign('panel',$panel);
$smarty->assign('profil_nav', $profil_nav);
$smarty->assign('slika_nav', $slika_nav);
?>

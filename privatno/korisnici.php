<?php
include_once '../baza.class.php';
$baza = new Baza();
$baza->spojiDB();
require_once ('../smarty/libs/Smarty.class.php');
$smarty = new Smarty();
session_start();
ob_start();

/*PANEL*/
$registracija = $prijava_odjava = $panel = $profil_nav = $slika_nav = "";
if(isset($_SESSION['korisnik_id'])){
    $korisnik_id = $_SESSION['korisnik_id'];
    $baza = new Baza();
    $baza->spojiDB();
    $upit = "select slike.name from slike, korisnici where korisnici.korisnik_id = '$korisnik_id' and korisnici.slika_id = slike.slika_id";
    $rezultat = $baza->selectDB($upit);
    while($polje = $rezultat->fetch_array()){
        $slika_link = $polje['name'];
        $slika_nav = "<a href='#'><img class='slika_nav' src='../uploads/" . $slika_link. "' alt=''></a>";
    }
    $prijava_odjava = '<li><a href="../odjava.php">Odjava</a></li>';
    $ime_nav = $_SESSION['ime'];
    $profil_nav = "<li><a href='#'>$ime_nav</a></li>";
    if ($_SESSION['tip_id'] == 1) {
        $panel = '<li><a href="../admin_lokacije.php">Admin</a></li><li><a href="../moderator_filmovi.php">Moderator</a></li><li><a href="../korisnik_rezervacije.php">Rezervacije</a></li>';
    }
    elseif ($_SESSION['tip_id'] == 2) {
        $panel = '<li><a href="../moderator_filmovi.php">Moderator</a></li><li><a href="../korisnik_rezervacije.php">Rezervacije</a></li>';
    }
    elseif ($_SESSION['tip_id'] == 3) {
        $panel = '<li><a href="../korisnik_rezervacije.php">Rezervacije</a></li>';
    }
}
else {
    $registracija = '<li><a href="../registration.php">Registracija</a></li>';
    $prijava_odjava = '<li><a href="../prijava.php">Prijava</a></li>';
}

$smarty->assign('registracija', $registracija);
$smarty->assign('prijava_odjava',$prijava_odjava);
$smarty->assign('panel',$panel);
$smarty->assign('profil_nav', $profil_nav);
$smarty->assign('slika_nav', $slika_nav);
/*PANEL*/

$upit = "select korisnik_id, ime, prezime, korime, lozinka, email, tip_id from korisnici where obrisan='0'";
$rezultat = $baza->selectDB($upit);

$tablica = '<table>
<thead><tr>
<th>ID</th>
<th>Ime</th>
<th>Prezime</th>
<th>Korime</th>
<th>Lozinka</th>
<th>Email</th>
</thead>
</tr>
</thead><tbody>';

while ($korisnik=$rezultat->fetch_array()) {
    $tablica .= "<tr>";
    $tablica .= "<td>";
    $tablica .= $korisnik["korisnik_id"];
    $tablica .= "</td>";
    $tablica .= "<td>";
    $tablica .= $korisnik["ime"];
    $tablica .= "</td>";
    $tablica .= "<td>";
    $tablica .= $korisnik["prezime"];
    $tablica .= "</td>";
    $tablica .= "<td>";
    $tablica .= $korisnik["korime"];
    $tablica .= "</td>";
    $tablica .= "<td>";
    $tablica .= $korisnik["lozinka"];
    $tablica .= "</td>";
    $tablica .= "<td>";
    $tablica .= $korisnik["email"];
    $tablica .= "</td>";
    $tablica .= "</tr>";
}
$tablica.= "</tbody></table>";

$skripta = "<script src='../js/analytics.js'></script>";
$title = "Ispis korisnika";
$smarty->template_dir = "../templates";
$smarty->compile_dir = "../templates_c";
$smarty->assign('title', $title);
$smarty->assign('skripta', $skripta);
$smarty->assign('tablica',$tablica);
$smarty->display('../templates/ik_header.tpl');
$smarty->display('../templates/ispis_korisnika.tpl');
$smarty->display('../templates/footer.tpl');
ob_flush();
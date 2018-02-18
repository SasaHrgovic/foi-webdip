<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');
include_once './upload.php';

function generiraj_xml($rezultat, $numPage){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><korisnici>';
    while($polje = $rezultat->fetch_array()){
        $korisnik_id = $polje['korisnik_id'];
        $ime = $polje['ime'];
        $prezime = $polje['prezime'];
        $korime = $polje['korime'];
        $datum_rodjenja = $polje['datum_rodjenja'];
        $spol = $polje['spol'];
        $drzava_naziv = $polje['drzava_naziv'];
        $telefon = $polje['telefon'];
        $email = $polje['email'];
        $slika_id = $polje['slika_id'];
        $obavijesti = $polje['obavijesti'];
        $tip_naziv = $polje['tip_naziv'];
        $vrijeme = $polje['vrijeme'];
        $aktivan = $polje['aktivan'];
        $promasaj_broj = $polje['promasaj_broj'];

        $upit = "select name from slike where slika_id = '$slika_id'";
        $slika = mysqli_fetch_array($baza->selectDB($upit))['name'];

        echo "<korisnik korisnik_id='$korisnik_id' ime='$ime' prezime='$prezime' korime='$korime' datum_rodjenja='$datum_rodjenja' spol='$spol' drzava_naziv='$drzava_naziv' telefon='$telefon' email='$email' slika='$slika' obavijesti='$obavijesti' tip_naziv='$tip_naziv' vrijeme='$vrijeme' aktivan='$aktivan' promasaj_broj='$promasaj_broj'/>";
    }
    echo "<pages>$numPage</pages>";
    echo "</korisnici>";
}

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] == 1) {
        $stranice_br = getStranice();

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pn']) && ($_GET['pn']) != ""){
            $page = $_GET['pn'];
            $per_page = $stranice_br;
            if ($page != 1) $start = ($page-1) * $per_page;
            else $start=0;

            $upit = "select * from korisnici where obrisan='0'";
            $rezultat = $baza->selectDB($upit);
            $numArticles = $rezultat->num_rows;
            $numPage = ceil($numArticles / $per_page);

            if(isset($_GET['q']) && ($_GET['q']) != "") {
                $q = $_GET['q'];
                $upit = "select * from korisnici_pogled where (ime like '" . $q . "%' or prezime like '" . $q . "%' or korime like '" . $q . "%' or datum_rodjenja like '" . $q . "%' or drzava_naziv like '" . $q . "%' or telefon like '" . $q . "%' or email like '" . $q . "%' or tip_naziv like '" . $q . "%' or vrijeme like '" . $q . "%') limit $per_page offset $start;";
                if(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                    $sort = $_GET['sort'];
                    $type = $_GET['type'];
                    $upit = "select * from korisnici_pogled where (ime like '" . $q . "%' or prezime like '" . $q . "%' or korime like '" . $q . "%' or datum_rodjenja like '" . $q . "%' or drzava_naziv like '" . $q . "%' or telefon like '" . $q . "%' or email like '" . $q . "%' or tip_naziv like '" . $q . "%' or vrijeme like '" . $q . "%') order by $sort $type limit $per_page offset $start;";
                }
            }
            elseif(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                $sort = $_GET['sort'];
                $type = $_GET['type'];
                $upit = "select * from korisnici_pogled order by $sort $type limit $per_page offset $start";
            }
            else {
                $upit = "select * from korisnici_pogled limit $per_page offset $start";
            }
            $rezultat = $baza->selectDB($upit);  
            generiraj_xml($rezultat, $numPage);
        }


        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['aktiviraj_id']) && ($_GET['aktiviraj_id']) != ""){
            $id = $_GET['aktiviraj_id'];
            $upit = "update korisnici set aktivan='1' where korisnik_id=$id";
            $baza->updateDB($upit);
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['deaktiviraj_id']) && ($_GET['deaktiviraj_id']) != ""){
            $id = $_GET['deaktiviraj_id'];
            $upit = "update korisnici set aktivan='0' where korisnik_id=$id";
            $baza->updateDB($upit);
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['blokiraj_id']) && ($_GET['blokiraj_id']) != ""){
            $id = $_GET['blokiraj_id'];
            $upit = "update korisnici set promasaj_broj='4' where korisnik_id=$id";
            $baza->updateDB($upit);
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['odblokiraj_id']) && ($_GET['odblokiraj_id']) != ""){
            $id = $_GET['odblokiraj_id'];
            $upit = "update korisnici set promasaj_broj='0' where korisnik_id=$id";
            $baza->updateDB($upit);
        }

        if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['tip_id']) && ($_GET['tip_id']) != "" && isset($_GET['korisnik_id']) && ($_GET['korisnik_id']) != "") {
            $tip_id = $_GET['tip_id'];
            $korisnik_prom_id = $_GET['korisnik_id'];
            $upit = "update korisnici set tip_id='$tip_id' where korisnik_id='$korisnik_prom_id'";
            $baza->updateDB($upit);
        }
    }
}
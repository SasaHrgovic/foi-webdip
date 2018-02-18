<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');
include_once ('./phpqrcode.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] < 3) {
        $stranice_br = getStranice();
        function generiraj_xml($rezultat, $numPage){
            global $baza;
            header("Content-Type:application/xml");
            echo '<?xml version="1.0" encoding="utf-8"?><rezervacije>';
            while($polje = $rezultat->fetch_array()){
                $rezervacija_id = $polje['rezervacija_id'];
                $film_naziv = $polje['film_naziv'];
                $vrijeme_pocetak = $polje['vrijeme_pocetak'];
                $vrijeme = $polje['vrijeme'];
                $odobrenje = $polje['odobrenje'];
                $odobrenje_vrijeme = $polje['odobrenje_vrijeme'];
                $ime = $polje['ime'];
                $prezime = $polje['prezime'];
                echo "<rezervacija rezervacija_id='$rezervacija_id' film_naziv='$film_naziv' vrijeme_pocetak='$vrijeme_pocetak' vrijeme='$vrijeme' odobrenje='$odobrenje' odobrenje_vrijeme='$odobrenje_vrijeme' ime='$ime' prezime='$prezime'/>";
            }
            echo "<pages>$numPage</pages>";
            echo "</rezervacije>";
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pn']) && ($_GET['pn']) != ""){
            $page = $_GET['pn'];
            $per_page = $stranice_br;
            if ($page != 1) $start = ($page-1) * $per_page;
            else $start=0;

            if(isset($_GET['lokacija_id']) && ($_GET['lokacija_id']) != "") {
                $lokacija_id = $_GET['lokacija_id'];
                $where_lokacija = "and lokacija_id=$lokacija_id";
            }
            else $where_lokacija = "";

            if(isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != "") {
                $dvorana_id = $_GET['dvorana_id'];
                $where_dvorana = "and dvorana_id=$dvorana_id";
            }
            else $where_dvorana = "";

            if(isset($_GET['projekcija_id']) && ($_GET['projekcija_id']) != "") {
                $projekcija_id = $_GET['projekcija_id'];
                $where_projekcija = "and projekcija_id=$projekcija_id";
            }
            else $where_projekcija = "";

            if(isset($_GET['q']) && ($_GET['q']) != "") {
                $q = $_GET['q'];
                $where_q = "and (film_naziv like '" . $q . "%' or vrijeme_pocetak like '" . $q . "%' or vrijeme like '" . $q . "%' or odobrenje_vrijeme like '" . $q . "%' or ime like '" . $q . "%' or prezime like '" . $q . "%')";
            }
            else {
                $where_q = "";
            }

            if(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                $sort = $_GET['sort'];
                $type = $_GET['type'];
                $sql_sort = "order by $sort $type";
            }
            else {
                $sql_sort = "";
            }

            $vrijeme = getPomak();
            $upit_br = "select * from rezervacije_pogled where vrijeme_pocetak > '$vrijeme' $where_lokacija $where_dvorana $where_projekcija $where_q $sql_sort";
            $rezultat_br = $baza->selectDB($upit_br);
            $numArticles = $rezultat_br->num_rows;
            $numPage = ceil($numArticles / $per_page);

            $upit = "select * from rezervacije_pogled where vrijeme_pocetak > '$vrijeme' $where_lokacija $where_dvorana $where_projekcija $where_q $sql_sort limit $per_page offset $start";
            $rezultat = $baza->selectDB($upit); 
            generiraj_xml($rezultat, $numPage);
        }

        function posalji_mail($rezervacija_id, $status){
            global $baza;
            $id = $rezervacija_id;
            $upit = "select korisnici.email, korisnici.ime from korisnici, rezervacije where korisnici.korisnik_id = rezervacije.korisnik_id and rezervacije.rezervacija_id = $id";
            $rezultat = $baza->selectDB($upit);
            while($polje = $rezultat->fetch_array()){
                $ime = $polje['ime'];
                $email = $polje['email'];
            }
            $upit = "select film_naziv, vrijeme_pocetak from rezervacije_pogled where rezervacija_id=$id";
            $rezultat = $baza->selectDB($upit);
            while($polje = $rezultat->fetch_array()){
                $film = $polje['film_naziv'];
                $vrijeme_pocetak = $polje['vrijeme_pocetak'];
            }
            if($status == "prihvaćena") {
                $upit = "select sjedala.redak_broj, sjedala.sjedalo_broj from sjedala, sjedalo_rezervacija where sjedalo_rezervacija.rezervacija_id = $id and sjedalo_rezervacija.sjedalo_id=sjedala.sjedalo_id";
                $rezultat = $baza->selectDB($upit);
                $sjedala = "";
                while($polje = $rezultat->fetch_array()){
                    $redak_broj = $polje['redak_broj'];
                    $sjedalo_broj = $polje['sjedalo_broj'];
                    $sjedala = $sjedala . "R" . $redak_broj . "S" .$sjedalo_broj . "; ";
                }
                $poruka_sjedala = "Za ovu projekciju rezervirali ste sljedeća mjesta: $sjedala";
                $qr_podatci = "Rezervacija: $id Sjedala $sjedala";
                $qr_datoteka = sha1(mt_rand(10000,99999).time());
                $qr_datoteka = $qr_datoteka . '.png'; 
                $qr_putanja = "/var/www/WebDiP/2015_projekti/WebDiP2015x030/ulaznice/" . $qr_datoteka;
                QRcode::png($qr_podatci, $qr_putanja, QR_ECLEVEL_H, 4);
            }
            else $poruka_sjedala = "";
            $naslov = "Rezervacija broj $id";
            $poruka = "<html><head><title>Rezervacija</title></head><body><p>Poštovani/a $ime <br><br> Vaša rezervacija za film $film koji počinje u terminu $vrijeme_pocetak je $status.</p><br><p>$poruka_sjedala</p><img src='https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/ulaznice/$qr_datoteka' alt='' /></body></html>";
            $headers = "MIME-Version: 1.0" . "\r\n";
            $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
            $headers .= 'From: <shrgovic@outlook.com>' . "\r\n";
            mail($email, $naslov, $poruka, $headers);
            return true;
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['delete_id']) && ($_GET['delete_id']) != ""){
            $id = $_GET['delete_id'];
            $upit = "update rezervacije set obrisan='1' where rezervacija_id=$id";
            $baza->updateDB($upit);
            $upit = "update sjedalo_rezervacija set obrisan='1' where rezervacija_id=$id";
            $baza->updateDB($upit);
            $status = "odbijena";
            posalji_mail($id, $status);
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['approve_id']) && ($_GET['approve_id']) != ""){
            $id = $_GET['approve_id'];
            $odobrenje_vrijeme = getPomak();
            $upit = "update rezervacije set odobrenje='1', odobrenje_vrijeme='$odobrenje_vrijeme' where rezervacija_id=$id";
            $baza->updateDB($upit);
            $status = "prihvaćena";
            posalji_mail($id, $status);
        }
    }
}

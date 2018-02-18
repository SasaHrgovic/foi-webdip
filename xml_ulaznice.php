<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');

if(isset($_SESSION['korisnik_id'])){
    $stranice_br = getStranice();
    function generiraj_xml($rezultat, $numPage){
        global $baza;
        header("Content-Type:application/xml");
        echo '<?xml version="1.0" encoding="utf-8"?><ulaznice>';
        while($polje = $rezultat->fetch_array()){
            $ulaznica_id = $polje['ulaznica_id'];
            $rezervacija_id = $polje['rezervacija_id'];
            $ime = $polje['ime'];
            $prezime = $polje['prezime'];
            $film_naziv = $polje['film_naziv'];
            $vrijeme = $polje['vrijeme'];

            $upit = "select s.name from ulaznice u join slike s on s.slika_id=u.slika_id where u.ulaznica_id=$ulaznica_id";
            $slika = mysqli_fetch_array($baza->selectDB($upit))['name'];

            $upit1 = "select sjedala.redak_broj, sjedala.sjedalo_broj from sjedala, sjedalo_rezervacija where sjedalo_rezervacija.rezervacija_id = $rezervacija_id and sjedalo_rezervacija.sjedalo_id=sjedala.sjedalo_id";
            $rezultat1 = $baza->selectDB($upit1);
            $sjedala = "";
            while($polje1 = $rezultat1->fetch_array()){
                $redak_broj = $polje1['redak_broj'];
                $sjedalo_broj = $polje1['sjedalo_broj'];
                $sjedala = $sjedala . "R" . $redak_broj . "S" .$sjedalo_broj . "; ";
            }
            echo "<ulaznica ulaznica_id='$ulaznica_id' ime='$ime' prezime='$prezime' film_naziv='$film_naziv' vrijeme='$vrijeme' slika='$slika' sjedala='$sjedala'/>";
        }
        echo "<pages>$numPage</pages>";
        echo "</ulaznice>";
    }

    if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pn']) && ($_GET['pn']) != ""){
        $page = $_GET['pn'];
        $per_page = $stranice_br;
        if ($page != 1) $start = ($page-1) * $per_page;
        else $start=0;

        if(isset($_GET['lokacija_id']) & ($_GET['lokacija_id']) != "") {
            $lokacija_id = $_GET['lokacija_id'];
            $where_lokacija = "and rp.lokacija_id=$lokacija_id";
        }
        else {
            $where_lokacija = "";
        }
        if(isset($_GET['dvorana_id']) & ($_GET['dvorana_id']) != "") {
            $dvorana_id = $_GET['dvorana_id'];
            $where_dvorana = "and rp.dvorana_id=$dvorana_id";
        }
        else {
            $where_dvorana = "";
        }
        if(isset($_GET['projekcija_id']) & ($_GET['projekcija_id']) != "") {
            $projekcija_id = $_GET['projekcija_id'];
            $where_projekcija = "and rp.projekcija_id=$projekcija_id";
        }
        else {
            $where_projekcija = "";
        }

        if(isset($_GET['q']) && ($_GET['q']) != "") {
            $q = $_GET['q'];
            $where_q = "and (rp.ime like '" . $q . "%' or rp.prezime like '" . $q . "%' or rp.film_naziv like '" . $q . "%' or rp.vrijeme like '" . $q . "%')";
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
        $upit_br = "select rp.ime, rp.prezime, rp.film_naziv, u.vrijeme from rezervacije_pogled rp join ulaznice u on rp.rezervacija_id = u.rezervacija_id where 1=1 $where_lokacija $where_dvorana $where_projekcija $where_q $sql_sort";
        $rezultat_br = $baza->selectDB($upit_br);
        $numArticles = $rezultat_br->num_rows;
        $numPage = ceil($numArticles / $per_page);

        $upit = "select u.ulaznica_id, rp.rezervacija_id, rp.ime, rp.prezime, rp.film_naziv, u.vrijeme from rezervacije_pogled rp join ulaznice u on rp.rezervacija_id = u.rezervacija_id where 1=1 $where_lokacija $where_dvorana $where_projekcija $where_q $sql_sort limit $per_page offset $start";
        $rezultat = $baza->selectDB($upit); 
        generiraj_xml($rezultat, $numPage);
    }
}
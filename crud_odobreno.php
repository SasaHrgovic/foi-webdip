<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');
include_once './upload.php';

if(isset($_SESSION['korisnik_id'])){
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

            $upit = "select s.name from ulaznice u join slike s on s.slika_id=u.slika_id where u.rezervacija_id=$rezervacija_id";
            $slika = mysqli_fetch_array($baza->selectDB($upit))['name'];
            echo "<rezervacija rezervacija_id='$rezervacija_id' film_naziv='$film_naziv' vrijeme_pocetak='$vrijeme_pocetak' vrijeme='$vrijeme' odobrenje='$odobrenje' odobrenje_vrijeme='$odobrenje_vrijeme' ime='$ime' prezime='$prezime' slika='$slika'/>";
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
            $where_filter = "and lokacija_id=$lokacija_id";
        }
        if(isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != "") {
            $dvorana_id = $_GET['dvorana_id'];
            $where_filter = "and dvorana_id=$dvorana_id";
        }
        if(isset($_GET['projekcija_id']) && ($_GET['projekcija_id']) != "") {
            $projekcija_id = $_GET['projekcija_id'];
            $where_filter = "and projekcija_id=$projekcija_id";
        }
        else {
            $where_filter = "";
        }

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

        $korisnik_id = $_SESSION['korisnik_id'];

        $upit_br = "select * from rezervacije_pogled where korisnik_id=$korisnik_id $where_filter $where_q $sql_sort";
        $rezultat_br = $baza->selectDB($upit_br);
        $numArticles = $rezultat_br->num_rows;
        $numPage = ceil($numArticles / $per_page);

        $upit = "select * from rezervacije_pogled where korisnik_id=$korisnik_id $where_filter $where_q $sql_sort limit $per_page offset $start";
        $rezultat = $baza->selectDB($upit); 
        generiraj_xml($rezultat, $numPage);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_rezervacija']) && ($_POST['id_rezervacija']) != "") {
        $id_rezervacija = $_POST['id_rezervacija'];
        $image_id = upload_image();
        $vrijeme = getPomak();
        $upit = "insert into ulaznice (rezervacija_id, vrijeme, slika_id) values ('$id_rezervacija', '$vrijeme', '$image_id')";
        $baza->updateDB($upit);
    }
}
<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');
include_once './upload.php';

function generiraj_xml($rezultat, $numPage){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><filmovi>';
    while($polje = $rezultat->fetch_array()){
        $film_id = $polje['film_id'];
        $naziv = $polje['film_naziv'];
        $naziv_original = $polje['naziv_original'];
        $zanr = $polje['zanr_naziv'];
        $zanr_id = $polje['zanr_id'];
        $drzava = $polje['drzava_naziv'];
        $drzava_id = $polje['drzava_id'];
        $redatelj = $polje['redatelj'];
        $godina = $polje['godina'];
        $uloge = $polje['uloge'];
        $opis = $polje['opis'];
        $trajanje = $polje['trajanje'];

        $upit = "select slike.name from slike, filmovi where slike.slika_id = filmovi.slika_id and filmovi.film_id = $film_id";
        $slika = mysqli_fetch_array($baza->selectDB($upit))['name'];

        echo "<film film_id='$film_id' naziv='$naziv' naziv_original='$naziv_original' zanr='$zanr' zanr_id='$zanr_id' drzava='$drzava' drzava_id='$drzava_id' redatelj='$redatelj' godina='$godina' uloge='$uloge' opis='$opis' trajanje='$trajanje' slika='$slika'/>";
    }
    echo "<pages>$numPage</pages>";
    echo "</filmovi>";
}

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] < 3) {
        $stranice_br = getStranice();
        $korisnik = $_SESSION['korisnik_id'];

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pn']) && ($_GET['pn']) != ""){
            $page = $_GET['pn'];
            $per_page = $stranice_br;
            if ($page != 1) $start = ($page-1) * $per_page;
            else $start=0;

            if(isset($_GET['q']) && ($_GET['q']) != "") {
                $q = $_GET['q'];
                $where_q = "and (film_naziv like '" . $q . "%' or naziv_original like '" . $q . "%' or zanr_naziv like '" . $q . "%' or drzava_naziv like '" . $q . "%' or redatelj like '" . $q . "%' or godina like '" . $q . "%' or uloge like '" . $q . "%' or trajanje like '" . $q . "%')";
            }
            else $where_q = "";

            if(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                $sort = $_GET['sort'];
                $type = $_GET['type'];
                $sql_sort = "order by $sort $type";
            }
            else $sql_sort = "";

            $upit_br = "select * from filmovi_pogled where 1=1 $where_q";
            $rezultat_br = $baza->selectDB($upit_br);
            $numArticles = $rezultat_br->num_rows;
            $numPage = ceil($numArticles / $per_page); 

            $upit = "select * from filmovi_pogled where 1=1 $where_q $sql_sort limit $per_page offset $start";
            $rezultat = $baza->selectDB($upit);  
            generiraj_xml($rezultat, $numPage);
        }

        /*TOOODOOO*/
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['naziv'])) {
            $naziv = $_POST['naziv'];
            $naziv_original = $_POST['naziv_original'];
            $zanr_id = $_POST['zanr_id'];
            $drzava_id = $_POST['drzava_id'];
            $redatelj = $_POST['redatelj'];
            $godina = $_POST['godina'];
            $uloge = $_POST['uloge'];
            $opis = $_POST['opis'];
            $trajanje = $_POST['trajanje'];

            if(isset($_POST['film_id']) && ($_POST['film_id']) != ""){
                $film_id = $_POST['film_id'];
                $upit = "update filmovi set naziv='$naziv', naziv_original='$naziv_original', zanr_id='$zanr_id', drzava_id='$drzava_id', redatelj='$redatelj', godina='$godina', uloge='$uloge', opis='$opis', trajanje='$trajanje' where film_id='$film_id'";
                $baza->updateDB($upit);
                $vrijeme = getPomak();
                $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Ažuriranje filma', '2')";
                $baza->updateDB($upit);
            }
            else {
                $upit = "insert into filmovi (naziv, naziv_original, zanr_id, drzava_id, redatelj, godina, uloge, opis, trajanje) values ('$naziv', '$naziv_original', '$zanr_id', '$drzava_id', '$redatelj', '$godina', '$uloge', '$opis', '$trajanje')";
                $baza->updateDB($upit);
                $vrijeme = getPomak();
                $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Dodavanje filma', '2')";
                $baza->updateDB($upit);
            }
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['delete_id']) && ($_GET['delete_id']) != ""){
            $id = $_GET['delete_id'];
            $upit = "update filmovi set obrisan='1' where film_id=$id";
            $baza->updateDB($upit);
            $vrijeme = getPomak();
            $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Brisanje filma', '2')";
            $baza->updateDB($upit);
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['update_id']) && ($_GET['update_id']) != ""){
            $id = $_GET['update_id'];
            $numPage = 0;
            $upit = "select * from filmovi_pogled where film_id = $id";
            $rezultat = $baza->selectDB($upit);  
            generiraj_xml($rezultat, $numPage);
        }
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_film']) && ($_POST['id_film']) != "") {
            $id_film = $_POST['id_film'];
            $image_id = upload_image();
            $upit = "update filmovi set slika_id='$image_id' where film_id='$id_film'";
            $baza->updateDB($upit);
        }
    }
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['korisnik_film']) && ($_GET['korisnik_film']) != "") {
    $korisnik_film=$_GET['korisnik_film'];
    $numPage = 0;
    $upit = "select * from filmovi_pogled where film_id = $korisnik_film";
    $rezultat = $baza->selectDB($upit);  
    generiraj_xml($rezultat, $numPage);
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['korisnik_filmovi']) && ($_GET['korisnik_filmovi']) != "") {
    $numPage = 0;
    $upit = "select * from filmovi_pogled";
    $rezultat = $baza->selectDB($upit);  
    generiraj_xml($rezultat, $numPage);
}

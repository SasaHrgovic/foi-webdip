<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] == 1) {
        $stranice_br = getStranice();
        function generiraj_xml($rezultat, $numPage){
            global $baza;
            header("Content-Type:application/xml");
            echo '<?xml version="1.0" encoding="utf-8"?><lokacije>';
            while($polje = $rezultat->fetch_array()){
                $lokacija_id = $polje['lokacija_id'];
                $naziv = $polje['naziv'];
                $ulica = $polje['ulica'];
                $broj = $polje['broj'];
                $postanski_broj = $polje['postanski_broj'];
                $grad = $polje['grad'];
                $drzava_id = $polje['drzava_id'];
                $latitude = $polje['latitude'];
                $longitude = $polje['longitude'];
                $telefon = $polje['telefon'];
                $upit = "select drzave.naziv from drzave, lokacije where drzave.drzava_id = lokacije.drzava_id and lokacije.lokacija_id = $lokacija_id";
                $drzava = mysqli_fetch_array($baza->selectDB($upit))['naziv'];
                $upit = "select korisnici.ime, korisnici.prezime from korisnici, lokacije where korisnici.korisnik_id = lokacije.moderator_id and lokacije.lokacija_id = $lokacija_id";
                $moderator_ime = mysqli_fetch_array($baza->selectDB($upit))['ime'];
                $moderator_prezime = mysqli_fetch_array($baza->selectDB($upit))['prezime'];
                echo "<lokacija lokacija_id='$lokacija_id' naziv='$naziv' ulica='$ulica' broj='$broj' postanski_broj='$postanski_broj' grad='$grad' drzava_id='$drzava_id' drzava='$drzava' latitude='$latitude' longitude='$longitude' telefon='$telefon' moderator_ime='$moderator_ime' moderator_prezime='$moderator_prezime'/>";
            }
            echo "<pages>$numPage</pages>";
            echo "</lokacije>";
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pn']) && ($_GET['pn']) != ""){
            $page = $_GET['pn'];
            $per_page = $stranice_br;
            if ($page != 1) $start = ($page-1) * $per_page;
            else $start=0;

            $upit = "select * from lokacije where obrisan='0'";
            $rezultat = $baza->selectDB($upit);
            $numArticles = $rezultat->num_rows;
            $numPage = ceil($numArticles / $per_page);

            if(isset($_GET['q']) && ($_GET['q']) != "") {
                $q = $_GET['q'];
                $upit = "select * from lokacije where obrisan='0' and (naziv like '" . $q . "%' or ulica like '" . $q . "%' or postanski_broj like '" . $q . "%' or grad like '" . $q . "%' or telefon like '" . $q . "%') limit $per_page offset $start;";
                if(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                    $sort = $_GET['sort'];
                    $type = $_GET['type'];
                    $upit = "select * from lokacije where obrisan='0' and (naziv like '" . $q . "%' or ulica like '" . $q . "%' or postanski_broj like '" . $q . "%' or grad like '" . $q . "%' or telefon like '" . $q . "%') order by $sort $type limit $per_page offset $start;";
                }
            }
            elseif(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                $sort = $_GET['sort'];
                $type = $_GET['type'];
                $upit = "select * from lokacije where obrisan='0' order by $sort $type limit $per_page offset $start";
            }
            else {
                $upit = "select * from lokacije where obrisan='0' limit $per_page offset $start";
            }
            $rezultat = $baza->selectDB($upit);  
            generiraj_xml($rezultat, $numPage);
        }

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $naziv = $_POST['naziv'];
            $ulica = $_POST['ulica'];
            $broj = $_POST['broj'];
            $postanski_broj = $_POST['postanski_broj'];
            $grad = $_POST['grad'];
            $drzava_id = $_POST['drzava'];
            $telefon = $_POST['telefon'];
            $latitude = $_POST['latitude'];
            $longitude = $_POST['longitude'];
            $moderator_id = $_POST['moderator_id'];

            if(isset($_POST['lokacija_id']) && ($_POST['lokacija_id']) != ""){
                echo "Postavljena";
                $lokacija_id = $_POST['lokacija_id'];
                $upit = "update lokacije set naziv='$naziv', ulica='$ulica', broj='$broj', postanski_broj='$postanski_broj', grad='$grad', drzava_id='$drzava_id', latitude='$latitude', longitude='$longitude', telefon='$telefon', moderator_id='$moderator_id' where lokacija_id='$lokacija_id'";
                $baza->updateDB($upit);
            }
            else {
                $upit = "insert into lokacije (naziv, ulica, broj, postanski_broj, grad, drzava_id, latitude, longitude, telefon, moderator_id) values ('$naziv', '$ulica', '$broj', '$postanski_broj', '$grad', '$drzava_id', '$latitude', '$longitude', '$telefon', '$moderator_id')";
                $baza->updateDB($upit);
            }
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['delete_id']) && ($_GET['delete_id']) != ""){
            $id = $_GET['delete_id'];
            $upit = "update lokacije set obrisan='1' where lokacija_id=$id";
            $baza->updateDB($upit);
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['update_id']) && ($_GET['update_id']) != ""){
            $id = $_GET['update_id'];
            $numPage = 0;
            $upit = "select * from lokacije where lokacija_id = $id and obrisan='0'";
            $rezultat = $baza->selectDB($upit);  
            generiraj_xml($rezultat, $numPage);
        }
    }
}

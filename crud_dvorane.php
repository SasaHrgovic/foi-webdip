<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] == 1) {
        $korisnik = $_SESSION['korisnik_id'];
        function generiraj_xml($rezultat){
            global $baza;
            header("Content-Type:application/xml");
            echo '<?xml version="1.0" encoding="utf-8"?><dvorane>';
            while($polje = $rezultat->fetch_array()){
                $dvorana_id = $polje['dvorana_id'];
                $broj_mjesta = $polje['broj_mjesta'];
                echo "<dvorana dvorana_id='$dvorana_id' broj_mjesta='$broj_mjesta'/>";
            }
            echo "</dvorane>";
        }

        //dohvaćanje dvorana određene lokacije
        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['lokacija_id']) && ($_GET['lokacija_id']) != ""){
            $lokacija_id = $_GET['lokacija_id'];
            $upit = "select * from dvorane where lokacija_id = '$lokacija_id' and obrisan='0';";  
            $rezultat = $baza->selectDB($upit);  
            generiraj_xml($rezultat);
        }

        //insert i update retka
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $kapacitet = $_POST['kapacitet'];
            $lokacija_id = $_POST['lokacija_id'];

            if(isset($_POST['dvorana_id']) && ($_POST['dvorana_id']) != ""){
                $dvorana_id = $_POST['dvorana_id'];
                $upit = "update dvorane set broj_mjesta='$kapacitet' where dvorana_id='$dvorana_id'";
                $baza->updateDB($upit);
                $vrijeme = getPomak();
                $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Ažuriranje dvorane', '2')";
                $baza->updateDB($upit);
            }
            else {
                $upit = "insert into dvorane (broj_mjesta, lokacija_id) values ('$kapacitet', '$lokacija_id')";
                $baza->updateDB($upit);
                $vrijeme = getPomak();
                $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Dodavanje dvorane', '2')";
                $baza->updateDB($upit);
            }
        }

        //brisanje retka
        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['delete_id']) && ($_GET['delete_id']) != ""){
            $id = $_GET['delete_id'];
            $upit = "update dvorane set obrisan='1' where dvorana_id=$id";
            $baza->updateDB($upit);
            $vrijeme = getPomak();
            $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Brisanje dvorane', '2')";
            $baza->updateDB($upit);
        }

        //dohvaćanje podataka za update formu
        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['update_id']) && ($_GET['update_id']) != ""){
            $id = $_GET['update_id'];
            $upit = "select * from dvorane where dvorana_id = $id and obrisan='0'";
            $rezultat = $baza->selectDB($upit);  
            generiraj_xml($rezultat);
        }
    }
}

<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] == 1) {
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['stranice'])) {
            $stranice = $_POST['stranice'];
            $upit = "update postavke set vrijednost='$stranice' where postavka_id='2'";
            $baza->updateDB($upit);
        }
    }
}

function getStranice() {
    global $baza;
    $upit = "select vrijednost from postavke where postavka_id='2'";
    $stranice = mysqli_fetch_array($baza->selectDB($upit))['vrijednost'];
    return $stranice;
}
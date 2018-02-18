<?php
require_once ('./aplikacijski_okvir.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] == 1) {
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['pomak'])) {
            $pomak = $_POST['pomak'];
            $upit = "update postavke set vrijednost='$pomak' where postavka_id='1'";
            $baza->updateDB($upit);
        }
    }
}

function getPomak() {
    global $baza;
    $upit = "select vrijednost from postavke where postavka_id='1'";
    $pomak = mysqli_fetch_array($baza->selectDB($upit))['vrijednost'];

    $addChange = new DateTime(date("Y-m-d H:i:s", strtotime(sprintf("+%d hours", $pomak))));
    $vrati_pomak = $addChange->format("Y-m-d H:i:s");

    return $vrati_pomak;
}
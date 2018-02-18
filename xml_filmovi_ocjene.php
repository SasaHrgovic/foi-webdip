<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['film_id']) && ($_GET['film_id']) != "") {
    $film_id = $_GET['film_id'];
    $upit = "select count(*) as 'like_broj' from filmovi_ocjene where film_id=$film_id and ocjena='1' and obrisan='0'";
    $like_broj = mysqli_fetch_array($baza->selectDB($upit))['like_broj'];
    $upit = "select count(*) as 'dislike_broj' from filmovi_ocjene where film_id=$film_id and ocjena='0' and obrisan='0'";
    $dislike_broj = mysqli_fetch_array($baza->selectDB($upit))['dislike_broj'];
    if (isset($_SESSION['korisnik_id'])) {
        $korisnik_id = $_SESSION['korisnik_id'];
        $upit = "select ocjena from filmovi_ocjene where film_id = $film_id and korisnik_id=$korisnik_id and obrisan='0'";
        $rezultat = $baza->selectDB($upit);
        if ($rezultat->num_rows == 0) {
            $ocjena = "2";
        }
        else{
            $ocjena = mysqli_fetch_array($rezultat)['ocjena'];
        }
    }
    else {
        $ocjena = "2";
    }
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><filmovi_ocjene>';
    echo "<film_ocjena like_broj='$like_broj' dislike_broj='$dislike_broj' ocjena='$ocjena'/>";
    echo "</filmovi_ocjene>";
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['film_ocjena']) && ($_GET['film_ocjena']) != "" && isset($_GET['ocjena']) && ($_GET['ocjena']) != "") {
    $film_id = $_GET['film_ocjena'];
    $ocjena = $_GET['ocjena'];
    $vrijeme = getPomak();
    $korisnik_id = $_SESSION['korisnik_id'];
    $upit= "select count(*) as 'postoji' from filmovi_ocjene where film_id=$film_id and korisnik_id=$korisnik_id";
    $postoji = mysqli_fetch_array($baza->selectDB($upit))['postoji'];
    if($postoji == 1) {
        $upit = "update filmovi_ocjene set ocjena='$ocjena', vrijeme='$vrijeme', obrisan='0' where film_id='$film_id' and korisnik_id='$korisnik_id'";
    }
    else {
        $upit = "insert into filmovi_ocjene (film_id, korisnik_id, ocjena, vrijeme) values ('$film_id','$korisnik_id', '$ocjena', '$vrijeme')";
    }
    $baza->updateDB($upit);
}
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['film_ocjena_del']) && ($_GET['film_ocjena_del']) != "") {
    $film_id = $_GET['film_ocjena_del'];
    $korisnik_id = $_SESSION['korisnik_id'];
    $upit = "update filmovi_ocjene set obrisan='1' where film_id='$film_id' and korisnik_id='$korisnik_id'";
    $baza->updateDB($upit);
}

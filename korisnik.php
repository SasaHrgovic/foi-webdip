<?php
require_once ('./aplikacijski_okvir.php');

header("Content-Type:application/xml");
echo '<?xml version="1.0" encoding="utf-8"?><korisnici>';
$korisnik = $_GET['korisnik'];
$upit = "select * from korisnici where korime = '$korisnik'";
$rezultat = $baza->selectDB($upit);
$pronadjen = 0;
while($polje = $rezultat->fetch_array()){
    if($korisnik == $polje[3]){
        $pronadjen = 1;
    }
}
echo "<korisnik>$pronadjen</korisnik>";
echo "</korisnici>";
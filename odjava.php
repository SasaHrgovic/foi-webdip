<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

$korisnik = "";
$korisnik = $_SESSION['korisnik_id'];
$vrijeme = getPomak();

$upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Korisnik se odjavio iz sustava', '1')";
$baza->updateDB($upit);
$_SESSION = array();
session_destroy();

header("Location: index.php");

ob_flush();
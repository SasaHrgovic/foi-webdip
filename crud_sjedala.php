<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');

/* CREATE */
if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != "" && isset($_GET['br_redaka']) && ($_GET['br_redaka']) != ""){
    $br_redaka = $_GET['br_redaka'];
    $dvorana_id = $_GET['dvorana_id'];
    //max retci
    $upit = "select max(redak_broj) as najveci_broj from sjedala where dvorana_id='$dvorana_id' and obrisan='0'";
    if(mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'] == ""){
        $max_retci = 0;
    }
    else {
        $max_retci = mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'];
        $br_redaka = $br_redaka + $max_retci;
    }

    $upit = "select max(sjedalo_broj) as najveci_broj from sjedala where dvorana_id=$dvorana_id and redak_broj=1 and obrisan='0'";
    if(mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'] == ""){
        $br_stupaca = 1;
    }
    else {
        $br_stupaca = mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'];
    }

    //ovo je za dodavanje redaka
    for ($i=$max_retci+1; $i<=$br_redaka; $i++) {
        for ($j=1; $j<=$br_stupaca; $j++) {
            $upit = "insert into sjedala (redak_broj, sjedalo_broj, dvorana_id) values ($i, $j, $dvorana_id)";
            $baza->updateDB($upit); 
        }
    }
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != "" && isset($_GET['br_stupaca']) && ($_GET['br_stupaca']) != ""){
    //max stupci
    $br_stupaca = $_GET['br_stupaca'];
    $dvorana_id = $_GET['dvorana_id'];
    $upit = "select max(sjedalo_broj) as najveci_broj from sjedala where dvorana_id=$dvorana_id and redak_broj=1 and obrisan='0'";
    if(mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'] == ""){
        $max_stupci = 0;
    }
    else {
        $max_stupci = mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'];
        $br_stupaca = $br_stupaca + $max_stupci;
    }

     //max retci
    $upit = "select max(redak_broj) as najveci_broj from sjedala where dvorana_id='$dvorana_id' and obrisan='0'";
    if(mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'] == ""){
        $br_redaka = 1;
    }
    else {
        $br_redaka = mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'];
    }

        //dodavanje stupaca
    for ($i=1; $i<=$br_redaka; $i++) {
        for ($j=$max_stupci+1; $j<=$br_stupaca; $j++) {
            $upit = "insert into sjedala (redak_broj, sjedalo_broj, dvorana_id) values ($i, $j, $dvorana_id)";
            $baza->updateDB($upit); 
        }
    }
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != "" && isset($_GET['del_rows']) && ($_GET['del_rows']) != ""){
    $del_rows = $_GET['del_rows'];
    $dvorana_id = $_GET['dvorana_id'];

    $upit = "select max(redak_broj) as najveci_broj from sjedala where dvorana_id='$dvorana_id' and obrisan='0'";
    if(mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'] == ""){
        exit;
    }
    else {
        $br_redaka = mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'];
        $br_redaka;
        $ostatak = $br_redaka - $del_rows;
        $upit = "delete from sjedala where dvorana_id='$dvorana_id' and redak_broj>'$ostatak'";
        $baza->updateDB($upit); 
    }
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != "" && isset($_GET['del_cols']) && ($_GET['del_cols']) != ""){
    $del_cols = $_GET['del_cols'];
    $dvorana_id = $_GET['dvorana_id'];

    $upit = "select max(sjedalo_broj) as najveci_broj from sjedala where dvorana_id='$dvorana_id' and obrisan='0'";
    if(mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'] == ""){
        exit;
    }
    else {
        $br_stupaca = mysqli_fetch_array($baza->selectDB($upit))['najveci_broj'];
        $ostatak = $br_stupaca - $del_cols;
        $upit = "delete from sjedala where dvorana_id='$dvorana_id' and sjedalo_broj>'$ostatak'";
        $baza->updateDB($upit); 
    }
}

/* PRVO PRONAĆI REDAK S NAJVEĆIM BROJEM PRIPAZIT NA DVORANU*/
//select max redak_broj where dvorana_id...

/*rekurzivno dodavanje sjedala*/

/*generiranje xml-a*/

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['dvorana_id']) && isset($_GET['dohvati'])){
    $dvorana_id = $_GET['dvorana_id'];
    $upit = "select redak_broj from sjedala where dvorana_id='$dvorana_id' and obrisan='0' group by redak_broj";
    $rezultat1 = $baza->selectDB($upit); 
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><sjedala>';
    while($polje1 = $rezultat1->fetch_array()){
        $broj_retka = $polje1['redak_broj'];
        echo "<redak broj_retka='$broj_retka'>";
        $upit = "select sjedalo_id,sjedalo_broj from sjedala where redak_broj = '$broj_retka' and dvorana_id='$dvorana_id' and obrisan='0'";
        $rezultat2 = $baza->selectDB($upit);
        while($polje2 = $rezultat2->fetch_array()){
            $broj_sjedala = $polje2['sjedalo_broj'];
            $sjedalo_id = $polje2['sjedalo_id'];
            echo "<sjedalo id='$sjedalo_id' broj_sjedala='$broj_sjedala'/>";
        }
        echo "</redak>";
    }
    echo "</sjedala>";
}

if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['projekcija_id'])){
    $projekcija_id = $_GET['projekcija_id'];
    $upit = "select dvorana_id from projekcije where projekcija_id='$projekcija_id'";
    $dvorana_id = mysqli_fetch_array($baza->selectDB($upit))['dvorana_id'];
    $upit = "select redak_broj from sjedala where dvorana_id='$dvorana_id' and obrisan='0' group by redak_broj";
    $rezultat1 = $baza->selectDB($upit); 
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><sjedala>';
    while($polje1 = $rezultat1->fetch_array()){
        $broj_retka = $polje1['redak_broj'];
        echo "<redak broj_retka='$broj_retka'>";
        $upit = "select sjedalo_id,sjedalo_broj from sjedala where redak_broj = '$broj_retka' and dvorana_id='$dvorana_id' and obrisan='0'";
        $rezultat2 = $baza->selectDB($upit);
        while($polje2 = $rezultat2->fetch_array()){
            $broj_sjedala = $polje2['sjedalo_broj'];
            $sjedalo_id = $polje2['sjedalo_id'];
            //provjerit kasnije
            $upit3 = "select sjedalo_rezervacija.prodano from sjedalo_rezervacija, rezervacije where rezervacije.obrisan='0' and rezervacije.projekcija_id = $projekcija_id and rezervacije.rezervacija_id = sjedalo_rezervacija.rezervacija_id and sjedalo_rezervacija.sjedalo_id = $sjedalo_id";
            $prodano = mysqli_fetch_array($baza->selectDB($upit3))['prodano'];
            echo "<sjedalo id='$sjedalo_id' broj_sjedala='$broj_sjedala' prodano='$prodano'/>";
        }
        echo "</redak>";
    }
    echo "</sjedala>";
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $projekcija_id = $_POST['projekcija_id'];
    $korisnik_id = $_SESSION['korisnik_id'];
    $vrijeme = getPomak();
    $odabrana_sjedala = $_POST['ids'];
    $upit = "insert into rezervacije (projekcija_id, korisnik_id, vrijeme) values ('$projekcija_id', '$korisnik_id', '$vrijeme'); SELECT LAST_INSERT_ID() as 'zadnji_id';";
    $polje = $baza->multiQuery($upit);
    $rezervacija_id = $polje['zadnji_id'];
    $sjedala_length = count($odabrana_sjedala);
    for ($x=0; $x < $sjedala_length; $x++) {
        $sjedalo_id = $odabrana_sjedala[$x];
        $upit = "insert into sjedalo_rezervacija (rezervacija_id, sjedalo_id, prodano) values ('$rezervacija_id','$sjedalo_id','1')";
        $baza->updateDB($upit);
    }
}
<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
include_once './upload.php';

$gr_ime = $gr_prezime = $gr_korime = $gr_lozinka1 = $gr_lozinka2 = $gr_dan = $gr_mjesec = $gr_godina = $gr_spol = $gr_drzava = $gr_tel = $gr_email = $gr_obavijesti = $gr_captcha = "";
$datum_rodjenja = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ime = $_POST['ime'];
    $prezime = $_POST['prezime'];
    $korime = $_POST['korime'];
    $lozinka1 = $_POST['lozinka1'];
    $lozinka2 = $_POST['lozinka2'];
    $dan = $_POST['dan'];
    $mjesec = $_POST['mjesec'];
    $godina = $_POST['godina'];
    $spol = $_POST['spol'];
    $drzava = $_POST['drzava'];
    $tel = $_POST['tel'];
    $email = $_POST['email'];
    $obavijesti = $_POST['obavijesti'];
    if(isset($_POST['g-recaptcha-response'])) $captcha=$_POST['g-recaptcha-response'];
    //echo '<pre>', print_r($_POST), '</pre>';

    function provjeri($polje){
        $greska = '';
        if (!isset($polje) || strlen(trim($polje)) == 0) {
            $greska = 'Ovo polje ne smije biti prazno!';
        } else {
            $greska = "";
        }
        return $greska;
    }

    function provjeri_ime(){
        global $ime, $gr_ime;
        if($gr_ime = provjeri($ime)) return false;
        elseif (strlen(trim($ime))<2 || strlen(trim($ime))>20) {
            $gr_ime = "Minimalno 2, maksimalno 20 znakova.";
        }
        elseif(preg_match("/\d/", $ime)) {
            $ime = "Ne smijete koristiti brojeve";
        }
        if(strlen($gr_ime) == 0) return true;
    }

    function provjeri_prezime(){
        global $prezime, $gr_prezime;
        if($gr_prezime = provjeri($prezime)) return false;
        elseif (strlen(trim($prezime))<2 || strlen(trim($prezime))>30) {
            $gr_prezime = "Minimalno 2, maksimalno 30 znakova.";
        }
        elseif(preg_match("/\d/", $prezime)) {
            $prezime = "Ne smijete koristiti brojeve";
        }
        if(strlen($gr_prezime) == 0) return true;
    }

    function provjeri_korime(){
        global $korime, $gr_korime, $baza;
        if($gr_korime = provjeri($korime)) return false;
        elseif (strlen(trim($korime))<6 || strlen(trim($korime))>20) {
            $gr_korime = "Korisničko ime mora imati između 6 i 20 znakova.";
        }
        elseif(!preg_match('/^[a-zA-Z0-9_-]{6,20}$/', $korime)) {
            $gr_korime = "Može sadržavati brojke, slova i znakove _ i -";
        }
        $upit = "select * from korisnici where korime='$korime'";
        $rezultat = $baza->selectDB($upit);
        if($rezultat->num_rows != 0){ 
            $gr_korime = "Korisničko ime je zauzeto";
        }
        if(strlen($gr_korime) == 0) return true;
    }

    function provjeri_lozinka(){
        global $lozinka1, $gr_lozinka1;
        if($gr_lozinka1 = provjeri($lozinka1)) return false;
        elseif (strlen($lozinka1) < 8) {
            $gr_lozinka1 = "Lozinka mora imati najmanje 8 znakova";
        }
        elseif (!preg_match("/\d/",$lozinka1) || !preg_match("/[A-Z]{1,}/",$lozinka1) || !preg_match("/[a-z]{1,}/",$lozinka1) || !preg_match("/[!,-,#,$,?]{1,}/", $lozinka1)) {
            $gr_lozinka1 = "Mora imati velika i mala slova, brojke i znakove";
        }
        if(strlen($gr_lozinka1) == 0) return true;
    }

    function provjeri_podudaranje(){
        global $lozinka1, $lozinka2, $gr_lozinka2;
        if($gr_lozinka2 = provjeri($lozinka2)) return false;
        if($lozinka1 !== $lozinka2) {
            $gr_lozinka2 = "Lozinke se ne podudaraju";
        }
        if(strlen($gr_lozinka2) == 0) return true;
    }
    
    function provjeri_dan(){
        global $dan, $gr_dan;
        if($gr_dan = provjeri($dan)) return false;
        elseif(!preg_match("/\d/", $dan)) {
            $gr_dan = "Možete upisati samo broj";
        }
        elseif($dan < 1 || $dan > 31) {
            $gr_dan = "Unos mora biti u rasponu od 1 do 31";
        }
        if(strlen($gr_dan) == 0) return true;
    }

    function provjeri_mjesec(){
        global $mjesec, $gr_mjesec;
        if($gr_mjesec = provjeri($mjesec)) return false;
        elseif(!preg_match("/\d/", $mjesec)) {
            $gr_mjesec = "Možete upisati samo broj";
        }
        elseif($mjesec < 1 || $mjesec > 12) {
            $gr_mjesec = "Unos mora biti u rasponu od 1 do 12";
        }
        if(strlen($gr_mjesec) == 0) return true;
    }

    function provjeri_godina(){
        global $godina, $gr_godina;
        if($gr_godina = provjeri($godina)) return false;
        elseif(!preg_match("/\d/", $godina)) {
            $gr_godina = "Možete upisati samo broj";
        }
        elseif($godina < 1930 || $godina > 2015) {
            $gr_godina = "Unos mora biti u rasponu od 1930 do 2015";
        }
        if(strlen($gr_godina) == 0) return true;
    }

    function provjeri_datum(){
        global $godina, $mjesec, $dan, $datum_rodjenja;
        if (provjeri_dan() & provjeri_mjesec() & provjeri_godina()){
            if(checkdate($mjesec, $dan, $godina)) {
                $datum_rodjenja = "$godina-$mjesec-$dan";
                return true;
            } 
        }
    }

    function provjeri_spol(){
        global $spol, $gr_spol;
        if($gr_spol = provjeri($spol)) return false;
        if(strlen($gr_spol) == 0) return true;
    }

    function provjeri_drzava(){
        global $drzava, $gr_drzava;
        if($gr_drzava = provjeri($drzava)) return false;
        if(strlen($gr_drzava) == 0) return true;
    }

    function provjeri_tel(){
        global $tel, $gr_tel;
        if($gr_tel = provjeri($tel)) return false;
        elseif(!preg_match('/[0-9]{3}\s[0-9]{6,7}$/', $tel)) {
            $gr_tel = "Broj mora biti oblika xxx xxxxxxy";
        }
        if(strlen($gr_tel) == 0) return true;
    }

    function provjeri_email(){
        global $email, $gr_email, $baza;
        if($gr_email = provjeri($email)) return false;
        elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $gr_email = "Email nije ispravno unesen";
        }
        $upit = "select * from korisnici where email= '".$email."' ";
        $rezultat = $baza->selectDB($upit);
        if($rezultat->num_rows != 0){ 
            $gr_email = "Email već koristi drugi korisnik";
        }
        if(strlen($gr_email) == 0) return true;
    }

    function provjeri_obavijesti(){
        global $obavijesti, $gr_obavijesti;
        if($gr_obavijesti = provjeri($obavijesti)) return false;
        if(strlen($gr_obavijesti) == 0) return true;
    }

    function recaptcha() {
        global $captcha, $gr_captcha;
        if(!$captcha){
          $gr_captcha = 'Please check the the captcha form';
          return false;
        }
        $secret = '6LchnSYTAAAAAG8_cJNhlZzAdEUXahrNfTqmMeVd';
        $ip = $_SERVER['REMOTE_ADDR'];
        $response=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secret."&response=".$captcha."&remoteip=".$ip);
        $responseKeys = json_decode($response,true);
        if(intval($responseKeys["success"]) !== 1) {
          $gr_captcha = "Recaptcha nije uspjela";
        } else {
          $gr_captcha = "Recaptcha OK";
          return true;
        }
    }

    function validiraj(){
        global $ime, $prezime, $korime, $lozinka1, $datum_rodjenja, $spol, $drzava, $tel, $email, $obavijesti, $gr_image;
        global $baza;
        if (provjeri_ime() & provjeri_prezime() & provjeri_korime() & provjeri_lozinka() & provjeri_podudaranje() & provjeri_datum() & provjeri_spol() & provjeri_drzava() & provjeri_tel() & provjeri_email() & provjeri_obavijesti() & recaptcha()) {
            echo $slika_id = upload_image();
            echo $gr_image;
            if ($gr_image != "") return;
            $aktivacijski_kod = sha1(mt_rand(10000,99999).time().$korime);
            $vrijeme = getPomak();
            $upit = "SET foreign_key_checks = 0";
            $baza->selectDB($upit);
            $upit = "insert into korisnici (ime, prezime, korime, lozinka, datum_rodjenja, spol, drzava_id, telefon, email, slika_id, obavijesti, tip_id, vrijeme, aktivacijski_kod) values ('$ime', '$prezime', '$korime','$lozinka1','$datum_rodjenja','$spol','$drzava','$tel','$email','$slika_id','$obavijesti','3','$vrijeme','$aktivacijski_kod');";
            echo $upit;
            if($baza->updateDB($upit)){
                $upit = "SET foreign_key_checks = 1";
                $baza->selectDB($upit);
                echo "Unos uspješan";
                $naslov = "CineNOVA - Aktivacija novog računa";
                $poruka = "<html><head><title>Aktivacija</title></head><body><p>Poštovani/a $ime <br><br>Kako biste aktivirali svoj račun, molimo Vas da kliknete na sljedeću poveznicu<br> http://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/aktivacija.php?kod=$aktivacijski_kod</body></html>";
                $headers = "MIME-Version: 1.0" . "\r\n";
                $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                $headers .= 'From: <shrgovic@outlook.com>' . "\r\n";
                mail($email, $naslov, $poruka, $headers);
                //header("Location: obavijesti.php?obavijest=1");
            }
            else echo "NEEE";
        }
        else echo "Validacija neuspješna!";
    }
    validiraj();    
    
}
$title = "Registracija";
$skripta = "<script src='js/ucitaj_drzave.js'></script><script src='js/validation.js'></script></script><script src='js/analytics.js'></script>";
$smarty->assign('title', $title);
$smarty->assign('skripta', $skripta);
$smarty->assign('gr_ime', $gr_ime);
$smarty->assign('gr_prezime', $gr_prezime);
$smarty->assign('gr_korime', $gr_korime);
$smarty->assign('gr_lozinka1', $gr_lozinka1);
$smarty->assign('gr_lozinka2', $gr_lozinka2);
$smarty->assign('gr_dan', $gr_dan);
$smarty->assign('gr_mjesec', $gr_mjesec);
$smarty->assign('gr_godina', $gr_godina);
$smarty->assign('gr_spol', $gr_spol);
$smarty->assign('gr_drzava', $gr_drzava);
$smarty->assign('gr_tel', $gr_tel);
$smarty->assign('gr_email', $gr_email);
$smarty->assign('gr_image', $gr_image);
$smarty->assign('gr_obavijesti', $gr_obavijesti);
$smarty->assign('gr_captcha', $gr_captcha);
$smarty->display('header.tpl');
$smarty->display('registration.tpl');
$smarty->display('footer.tpl');

ob_flush();

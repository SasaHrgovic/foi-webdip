<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');

$gr_username = $gr_password = $gr_submit = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    function provjeri($polje){
        $greska = '';
        if(!isset($polje) || strlen(trim($polje)) == 0) {
            $greska = 'Ovo polje ne smije biti prazno!';
        }
        return $greska;
    }

    function provjeri_login(){
        global $username, $gr_username, $password, $gr_password, $baza, $gr_submit, $vrijeme_pomak;
        $gr_password = provjeri($password);
        $gr_username = provjeri($username);
        if((strlen($gr_username) == 0) & (strlen($gr_password) == 0)) {
            $upit = "select * from korisnici where korime='$username'";
            $rezultat = $baza->selectDB($upit);
            if($rezultat->num_rows != 0) {
                $polje = $rezultat->fetch_array();
                if ($polje['aktivan'] == 0) {
                    header("Location: obavijesti.php?greska=2");
                    return false;
                }
                if($polje['promasaj_broj'] < 4) {
                    if ($polje['lozinka'] == $password) {
                        if($polje['promasaj_broj'] > 0) {
                            $update_promasaj = "update korisnici set promasaj_broj = 0 where korime = '$username'";
                            $baza->updateDB($update_promasaj);
                        }
                        kreiraj_kolacic($username);
                        kreiraj_sesiju($polje);
                        $korisnik = "";
                        $korisnik = $polje['korisnik_id'];
                        $vrijeme = getPomak();
                        $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Korisnik se prijavio u sustav', '1')";
                        $baza->updateDB($upit);
                        return true;
                    }
                    else {
                        $gr_password = "Lozinka je pogrešna";
                        $update_promasaj = "update korisnici set promasaj_broj = promasaj_broj + 1 where korime = '$username'";
                        $baza->updateDB($update_promasaj);
                        $upit = "select promasaj_broj from korisnici where korime = '$username'";
                        if(mysqli_fetch_array($baza->selectDB($upit))['promasaj_broj'] == 4) {
                            $korisnik = "";
                            $upit = "select korisnik_id from korisnici where korime = '$username'";
                            $korisnik = mysqli_fetch_array($baza->selectDB($upit))['korisnik_id'];
                            $vrijeme = getPomak();
                            $upit = "insert into dnevnik (vrijeme, korisnik_id, opis, tip_radnje_id) values ('$vrijeme', '$korisnik', 'Korisnik je blokiran', '4')";
                            $baza->updateDB($upit);
                        }
                    }
                }
                else {
                    header("Location: obavijesti.php?greska=1");
                }
            }
            else {
                $gr_username = "Ne postoji korisnik s tim korisničkim imenom";
                return false;
            }
        }
    }

    function kreiraj_kolacic($user){
        if(isset($_POST['check'])) {
            $name = "korisnik";
            $value = $user;
            setcookie($name,$value, time() + 86400, "/");
        }
        else {
            if(isset($_COOKIE[$name])) setcookie($name, "", time() - 3600);
        }
    }

    function kreiraj_sesiju($polje){
        $_SESSION['korisnik_id'] = $polje['korisnik_id'];
        $_SESSION['ime'] = $polje['ime'];
        $_SESSION['korime'] = $polje['korime'];
        $_SESSION['tip_id'] = $polje['tip_id'];
        $_SESSION['vrijeme'] = time();
    }

    function validiraj(){
        global $username, $password;
        global $baza;
        if (provjeri_login()) {
            if(isset($_SESSION['korisnik_id'])){
                if($_SESSION['tip_id'] == 1) {
                    header("Location: admin_lokacije.php");
                }
                elseif($_SESSION['tip_id'] == 2) {
                    header("Location: moderator_filmovi.php");
                }
                elseif($_SESSION['tip_id'] == 3) {
                    header("Location: korisnik_rezervacije.php");
                }
            }
        }
        else return false;
    }

    validiraj();
}
$title = "Prijava";
$smarty->assign('title', $title);
$smarty->assign('gr_username', $gr_username);
$smarty->assign('gr_password', $gr_password);
$smarty->assign('gr_submit', $gr_submit);
$smarty->display('header.tpl');
$smarty->display('prijava.tpl');
$smarty->display('footer.tpl');

ob_flush();
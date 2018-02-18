<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');

function generiraj_xml($rezultat, $numPage){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><dnevnik>';
    while($polje = $rezultat->fetch_array()){
        $datum = $polje['datum'];
        $ime = $polje['ime'];
        $prezime = $polje['prezime'];
        $opis = $polje['opis'];
        $radnja = $polje['radnja'];
        echo "<dnevnik_stat datum='$datum' ime='$ime' prezime='$prezime' opis='$opis' radnja='$radnja'/>";
    }
    echo "<pages>$numPage</pages>";
    echo "</dnevnik>";
}

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] < 3) {
        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pn']) && ($_GET['pn']) != ""){
            $stranice_br = getStranice();
            $page = $_GET['pn'];
            $per_page = $stranice_br;
            if ($page != 1) $start = ($page-1) * $per_page;
            else $start=0;   

            if(isset($_GET['datum_od']) && ($_GET['datum_od']) != "" && isset($_GET['datum_do']) && ($_GET['datum_do']) != "") {
                $datum_od = $_GET['datum_od'];
                $datum_do = $_GET['datum_do'];
                $where_date = "and (date(d.vrijeme) between '$datum_od' and '$datum_do')";
            }
            else {
                $where_date = "";
            }

            if(isset($_GET['opis']) && ($_GET['opis']) != ""){
                $opis = $_GET['opis'];
                $where_opis = "and d.opis='$opis'";
            }
            else {
                $where_opis = "";
            }

            if(isset($_GET['tip_radnje_id']) && ($_GET['tip_radnje_id']) != ""){
                $tip_radnje_id = $_GET['tip_radnje_id'];
                $where_tip_radnje = "and d.tip_radnje_id='$tip_radnje_id'";
            }
            else {
                $where_tip_radnje = "";
            }

            if(isset($_GET['korisnik_id']) && ($_GET['korisnik_id']) != ""){
                $korisnik_id = $_GET['korisnik_id'];
                $where_korisnik = "and d.korisnik_id=$korisnik_id";
            }
            else {
                $where_korisnik = "";
            }

            if(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                $sort = $_GET['sort'];
                $type = $_GET['type'];
                $sql_sort = "order by $sort $type";
            }
            else {
                $sql_sort = "";
            }

            $upit_br = "select d.vrijeme as datum, d.korisnik_id, k.ime, k.prezime, d.opis, tr.radnja from dnevnik d join korisnici k on d.korisnik_id = k.korisnik_id join tip_radnje tr on d.tip_radnje_id = tr.tip_radnje_id where 1=1 $where_date $where_tip_radnje $where_opis $where_korisnik group by datum,opis";
            $rezultat_br = $baza->selectDB($upit_br);
            $numArticles = $rezultat_br->num_rows;
            $numPage = ceil($numArticles / $per_page); 

            $upit = "select d.vrijeme as datum, d.korisnik_id, k.ime, k.prezime, d.opis, tr.radnja from dnevnik d join korisnici k on d.korisnik_id = k.korisnik_id join tip_radnje tr on d.tip_radnje_id = tr.tip_radnje_id where 1=1 $where_date $where_tip_radnje $where_opis $where_korisnik group by datum,opis $sql_sort limit $per_page offset $start";
            $rezultat = $baza->selectDB($upit);
            
            generiraj_xml($rezultat, $numPage);
        }
    }
}
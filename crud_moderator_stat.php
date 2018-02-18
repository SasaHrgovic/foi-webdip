<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');

function generiraj_xml($rezultat, $br_redaka){
    global $baza;
    $max_likes = $max_dislikes = 0;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><filmovi_lajkovi>';
    while($polje = $rezultat->fetch_array()){
        $datum = $polje['datum'];
        $likes = $polje['likes'];
        $dislikes = $polje['dislikes'];
        if ($likes > $max_likes) $max_likes = $likes;
        if ($dislikes > $max_dislikes) $max_dislikes = $dislikes;
        echo "<film datum='$datum' likes='$likes' dislikes='$dislikes'/>";
    }
    echo "<br_redaka>$br_redaka</br_redaka>";
    echo "<max_likes>$max_likes</max_likes>";
    echo "<max_dislikes>$max_dislikes</max_dislikes>";
    echo "</filmovi_lajkovi>";
}

function generiraj_xml2($rezultat, $numPage){
    global $baza;
    header("Content-Type:application/xml");
    echo '<?xml version="1.0" encoding="utf-8"?><filmovi_ocjene>';
    while($polje = $rezultat->fetch_array()){
        $film_id = $polje['id'];
        $naziv = $polje['naziv'];
        $likes = $polje['likes'];
        $dislikes = $polje['dislikes'];

        echo "<film_ocjena film_id='$film_id' naziv='$naziv' likes='$likes' dislikes='$dislikes'/>";
    }
    echo "<pages>$numPage</pages>";
    echo "</filmovi_ocjene>";
}

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] < 3) {
        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['film_id_likes']) && ($_GET['film_id_likes']) != "" && isset($_GET['datum_od']) && ($_GET['datum_od']) != "" && isset($_GET['datum_do']) && ($_GET['datum_do']) != ""){
            $film_id = $_GET['film_id_likes'];
            $datum_od = $_GET['datum_od'];
            $datum_do = $_GET['datum_do'];
            if(strtotime($datum_do) > strtotime('2000-01-01')) {    
                $upit="select film_id as 'id', date(vrijeme) as 'datum', (select count(*) from filmovi_ocjene where ocjena=1 and film_id=id and date(vrijeme)=datum) as 'likes', (select count(*) from filmovi_ocjene where ocjena=0 and film_id=id and date(vrijeme)=datum) as 'dislikes' from filmovi_ocjene where film_id='$film_id' and vrijeme between '$datum_od' and '$datum_do' group by id,datum order by 2";
                $rezultat = $baza->selectDB($upit);
                $br_redaka = $rezultat->num_rows;  
                generiraj_xml($rezultat, $br_redaka);
            }
        }

        /*
        
        TAAABLICEEE
        
        */
        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pn']) && ($_GET['pn']) != ""){
            $stranice_br = getStranice();
            $page = $_GET['pn'];
            $per_page = $stranice_br;
            if ($page != 1) $start = ($page-1) * $per_page;
            else $start=0;

            if(isset($_GET['datum_od']) && ($_GET['datum_od']) != "" && isset($_GET['datum_do']) && ($_GET['datum_do']) != "") {
                $datum_od = $_GET['datum_od'];
                $datum_do = $_GET['datum_do'];
                $where = "and (vrijeme between '$datum_od' and '$datum_do')";
            }
            else {
                $where = "";
            }

            if(isset($_GET['q']) && ($_GET['q']) != "") {
                $q = $_GET['q'];
                $where_q = "and (naziv like '" . $q . "%')";
            }
            else {
                $where_q = "";
            }

            if(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                $sort = $_GET['sort'];
                $type = $_GET['type'];
                $sql_sort = "order by $sort $type";
            }
            else {
                $sql_sort = "";
            }

            $upit = "select film_id as 'id', naziv, (select count(*) from filmovi_ocjene_pogled where film_id = id and ocjena=1 $where) as 'likes', (select count(*) from filmovi_ocjene_pogled where film_id = id and ocjena=0 $where) as 'dislikes' from filmovi_ocjene_pogled where 1=1 $where_q $where group by film_id";
            $rezultat = $baza->selectDB($upit);
            $numArticles = $rezultat->num_rows;
            $numPage = ceil($numArticles / $per_page);

            $upit = "select film_id as 'id', naziv, (select count(*) from filmovi_ocjene_pogled where film_id = id and ocjena=1 $where) as 'likes', (select count(*) from filmovi_ocjene_pogled where film_id = id and ocjena=0 $where) as 'dislikes' from filmovi_ocjene_pogled where 1=1 $where_q $where group by film_id $sql_sort limit $per_page offset $start";

            $rezultat = $baza->selectDB($upit);  
            generiraj_xml2($rezultat, $numPage);
        }
    }
}

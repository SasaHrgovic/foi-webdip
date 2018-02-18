<?php
require_once ('./aplikacijski_okvir.php');
require_once ('./vrijeme_pomak.php');
require_once ('./crud_stranice.php');

if(isset($_SESSION['korisnik_id'])){
    if($_SESSION['tip_id'] < 3) {
        $stranice_br = getStranice();
        function generiraj_xml($rezultat, $numPage){
            global $baza;
            header("Content-Type:application/xml");
            echo '<?xml version="1.0" encoding="utf-8"?><projekcije>';
            while($polje = $rezultat->fetch_array()){
                $projekcija_id = $polje['projekcija_id'];
                $film_id = $polje['film_id'];
                $naziv = $polje['naziv'];
                $trajanje = $polje['trajanje'];
                $dvorana_id = $polje['dvorana_id'];
                $broj = $polje['broj'];
                $broj_mjesta = $polje['broj_mjesta'];
                $lokacija_id = $polje['lokacija_id'];
                $vrijeme_pocetak = $polje['vrijeme_pocetak'];
                $vrijeme_zavrsetak = $polje['vrijeme_zavrsetak'];

                echo "<projekcija projekcija_id='$projekcija_id' film_id='$film_id' naziv='$naziv' trajanje='$trajanje' dvorana_id='$dvorana_id' broj='$broj' broj_mjesta='$broj_mjesta' lokacija_id='$lokacija_id' vrijeme_pocetak='$vrijeme_pocetak' vrijeme_zavrsetak='$vrijeme_zavrsetak'/>";
            }
            echo "<pages>$numPage</pages>";
            echo "</projekcije>";
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['pn']) && ($_GET['pn']) != ""){
            $page = $_GET['pn'];
            $per_page = $stranice_br;
            if ($page != 1) $start = ($page-1) * $per_page;
            else $start=0;

            if(isset($_GET['lokacija_id']) && ($_GET['lokacija_id']) != "") {
                $lokacija_id = $_GET['lokacija_id'];
                $where_lokacija = "and lokacija_id=$lokacija_id";
            }
            else $where_lokacija = "";
            if(isset($_GET['dvorana_id']) && ($_GET['dvorana_id']) != "") {
                $dvorana_id = $_GET['dvorana_id'];
                $where_dvorana = "and dvorana_id=$dvorana_id";
            }
            else $where_dvorana = "";

            if(isset($_GET['q']) && ($_GET['q']) != "") {
                $q = $_GET['q'];
                $where_q = "and (naziv like '" . $q . "%' or trajanje like '" . $q . "%' or broj like '" . $q . "%' or broj_mjesta like '" . $q . "%' or vrijeme_pocetak like '" . $q . "%' or vrijeme_zavrsetak like '" . $q . "%')";
            }
            else $where_q = "";

            if(isset($_GET['sort']) && ($_GET['sort']) != "" && isset($_GET['type']) && ($_GET['type']) != ""){
                $sort = $_GET['sort'];
                $type = $_GET['type'];
                $sql_sort = "order by $sort $type";
            }
            else {
                $sql_sort = "";
            }

            $vrijeme = getPomak();
            $upit_br = "select * from projekcije_pogled where vrijeme_pocetak > '$vrijeme' $where_lokacija $where_dvorana $where_q";
            $rezultat_br = $baza->selectDB($upit_br);
            $numArticles = $rezultat_br->num_rows;
            $numPage = ceil($numArticles / $per_page);
            
            $upit = "select * from projekcije_pogled where vrijeme_pocetak > '$vrijeme' $where_lokacija $where_dvorana $where_q $sql_sort limit $per_page offset $start";
            $rezultat = $baza->selectDB($upit); 
            generiraj_xml($rezultat, $numPage);
        }

        /*TOOODOOO*/
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $film_id = $_POST['film_id'];
            $dvorana_id = $_POST['dvorana_id'];
            $vrijeme_pocetak = $_POST['vrijeme_pocetak'];

            $upit = "select trajanje from filmovi where film_id='$film_id'";
            $trajanje = mysqli_fetch_array($baza->selectDB($upit))['trajanje'];
            $trajanje = ($trajanje + 30)*60;

            $vrijeme_zavrsetak = strtotime($vrijeme_pocetak) + $trajanje;
            $vrijeme_zavrsetak = date("Y-m-d H:i:s", $vrijeme_zavrsetak);

            if(isset($_POST['projekcija_id']) && ($_POST['projekcija_id']) != ""){
                $projekcija_id = $_POST['projekcija_id'];
                $upit = "update projekcije set film_id='$film_id', dvorana_id='$dvorana_id', vrijeme_pocetak='$vrijeme_pocetak', vrijeme_zavrsetak='$vrijeme_zavrsetak' where projekcija_id ='$projekcija_id'";
                $baza->updateDB($upit);
            }
            else {
                $upit = "insert into projekcije (film_id, dvorana_id, vrijeme_pocetak, vrijeme_zavrsetak) values ('$film_id', '$dvorana_id', '$vrijeme_pocetak','$vrijeme_zavrsetak')";
                $baza->updateDB($upit);
            }
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['delete_id']) && ($_GET['delete_id']) != ""){
            $id = $_GET['delete_id'];
            $upit = "update projekcije set obrisan='1' where projekcija_id=$id";
            $baza->updateDB($upit);
        }

        if($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['update_id']) && ($_GET['update_id']) != ""){
            $id = $_GET['update_id'];
            $numPage = 0;
            $upit = "select * from projekcije_pogled where projekcija_id = $id";
            $rezultat = $baza->selectDB($upit);  
            generiraj_xml($rezultat, $numPage);
        }

    }
}
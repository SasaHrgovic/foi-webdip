<?php

class Baza {

    private $veza = null;
    private $greska = '';

    function spojiDB() {
        const $server = "localhost";
        const $korisnik = "WebDiP2015x030";
        const $lozinka = "admin_PQtg";
        const $baza = "WebDiP2015x030";

        $this->veza = new PDO("mysql:host=$server;dbname=$baza","$korisnik","$lozinka");
        if ($this->veza->connect_errno) {
            echo "Neuspješno spajanje na bazu: " . $this->veza->connect_errno . ", " .
            $this->veza->connect_error;
            $this->greska = $this->veza->connect_error;
        }
        else {
            echo "Uspješnoooo!";
        }
        return $this->veza;
    }

    function zatvoriDB() {
        $this->veza = null;
    }

    function selectDB($upit) {
        $rezultat = $this->veza->query($upit);
        if ($this->veza->connect_errno) {
            echo "Greška kod upita: {$upit} - " . $this->veza->connect_errno . ", " .
            $this->veza->connect_error;
            $this->greska = $this->veza->connect_error;
        }
        if (!$rezultat) {
            $rezultat = null;
        }
        return $rezultat;
    }

    function updateDB($upit, $skripta = '') {
        $rezultat = $this->veza->query($upit);
        if ($this->veza->connect_errno) {
            echo "Greška kod upita: {$upit} - " . $this->veza->connect_errno . ", " .
            $this->veza->connect_error;
            $this->greska = $this->veza->connect_error;
        } else {
            if ($skripta != '') {
                header("Location: $skripta");
            }
        }

        return $rezultat;
    }
    
    function pogreskaDB() {
        if ($this->greska != '') {
            return true;
        } else {
            return false;
        }
    }
}
?>
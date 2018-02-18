<!DOCTYPE html>
<html lang="hr" dir="ltr">
    <head>
        <title>{$title}</title>
        <meta charset="utf-8"/>
        <meta name="author" content="Saša Hrgović"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" type="text/css" href="css/shrgovic2.css"/>
        <link rel="stylesheet" type="text/css" href="css/mobile.css"/>
        <link rel="stylesheet" type="text/css" href="css/grid.css"/>
        <link rel="shortcut icon" type="image/x-icon" href="img/x-icon.png"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
        <script src="js/shrgovic2_jquery.js"></script>
        <script src="js/user_nav.js"></script>
        <script src="js/shrgovic.js"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
    </head>
    <body>
        <header>
            <div class="row header">
                <a href="index.php"><img src="img/cinew.png" alt="cinew"></a>
                <a href="#"><img src="img/fb-ico.png" alt="fb-ico"></a>
                <a href="#"><img src="img/twitter-ico.png" alt="twitter-ico"></a>
                <a href="#"><img src="img/yt-ico.png" alt="yt-ico"></a>
            </div>
            <button class="hamburger">&#9776;</button>
        </header>
        <nav class="menu">
            <ul>
                <li><a href="index.php">Početna</a></li>
                <li><a href="o_autoru.html">O autoru</a></li>
                <li><a href="lokacije.php">Lokacije</a></li>
                <li><a href="korisnik_filmovi.php">Filmovi</a></li>
                <li><a href="dokumentacija.html">Dokumentacija</a></li>
                {$registracija}
                <li id="profilna">{$slika_nav}</li>
                {$profil_nav}
                {$prijava_odjava}
                {$panel}
            </ul>
        </nav>
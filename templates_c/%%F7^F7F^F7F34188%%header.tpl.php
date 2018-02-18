<?php /* Smarty version 2.6.30, created on 2016-08-07 01:31:41
         compiled from header.tpl */ ?>
<!DOCTYPE html>
<html lang="hr" dir="ltr">
    <head>
        <title>Početna stranica</title>
        <meta charset="utf-8"/>
        <meta name="author" content="Saša Hrgović"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" type="text/css" href="css/shrgovic2.css"/>
        <link rel="stylesheet" type="text/css" href="css/mobile.css"/>
        <link rel="stylesheet" type="text/css" href="css/grid.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
        <script src="js/shrgovic2_jquery.js"></script>
        <script src="js/user_nav.js"></script>
        <script src="js/shrgovic.js"></script>
        <script src="js/carousel.js"></script>
        <script src="js/validation.js"></script>
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
                <li><a href="#">O nama</a></li>
                <li><a href="#">Lokacije</a></li>
                <li><a href="documentation.php">Dokumentacija</a></li>
                <?php echo $this->_tpl_vars['registracija']; ?>

                <li id="profilna"><?php echo $this->_tpl_vars['slika_nav']; ?>
</li>
                <?php echo $this->_tpl_vars['profil_nav']; ?>

                <?php echo $this->_tpl_vars['prijava_odjava']; ?>

                <?php echo $this->_tpl_vars['panel']; ?>

            </ul>
        </nav>
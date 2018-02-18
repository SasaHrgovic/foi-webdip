<?php
include_once 'baza.class.php';
$baza = new Baza();
$baza->spojiDB();
require_once ('smarty/libs/Smarty.class.php');
$smarty = new Smarty();
session_start();
require_once ('panel.php');
ob_start();
?>
<?php
require_once ('./smarty/libs/Smarty.class.php');
$smarty = new Smarty();
ob_start();
session_start();
require_once ('./panel.php');
?>
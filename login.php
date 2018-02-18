<?php
require ('./smartyHeader.php');

$title = "Prijava";
$smarty->assign('title', $title);
$smarty->display('header.tpl');
$smarty->display('footer.tpl');

ob_flush();
?> 
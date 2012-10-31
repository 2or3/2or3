<?php
require "./Search.php";

define('COUNT', 10);
define('TARGET', 80);

$search = new Search(COUNT);

$list = $search->getList();
$alist = $search->getAlignedList();
var_dump(TARGET);
var_dump($alist);
$result = $search->runSearch(TARGET);
var_dump($result);

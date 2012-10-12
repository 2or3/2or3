<?php
require_once './battle.php';
$battle = new Battle(2);

$agent = $battle->getAgent();

$result = $battle->run();
var_dump($result);

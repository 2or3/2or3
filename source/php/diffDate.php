<?php
$d1 = new DateTime('2020-04-01');
$d2 = new DateTime('2020-05-01');
echo $d1->format('Y-m-d H:i:sP') . "\n";
echo $d2->format('Y-m-d H:i:sP') . "\n";
echo $d1->diff($d2)->m;


<?php

function addDays(\DateTime $date, $num) {
    $baseTime = mktime(0,0,0,$date->format('m'),$date->format('d'),$date->format('Y'));
    $time = strtotime($num.' Day', $baseTime);
    return date_create(date('Ymd', $time));
}

$d = new DateTime('2020-02-01');

var_dump(addDays($d, -1));

<?php

var_dump($argv);

$slist = array();

for($n=1; $n < $argc; $n++) {
  $slist[] = $argv[$n];
}

function qsort($list) {
  if (count($list) == 1) {
    return $list[0];
  } else {
    $split = $list[0];
    for ($m=1; $m < count($list); $m++) {
      if ($list[$m-1] > $list[$m]) {
        $tmp = $list[$m-1];
        $list[$m-1] = $list[$m];
        $list[$m] = $tmp;
      }
    }
    $split_num = array_search($split, $list);
    if ($split_num == 0) {
      $split_num = 1;
    }
    $result[] = qsort(array_slice($list, 0, $split_num+1));
    $result[] = qsort(array_slice($list, $split_num+1, count($list) - $split_num - 1));
    return $result;
  }
}

$r = qsort($slist);
var_dump($r);

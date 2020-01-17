<?php
if (count($argv) > 1 && ctype_digit($argv[1])) {
  $ctime = date('Y/m/d H:i:s', intval($argv[1]));
  echo $ctime . "\n";
} else {
  echo "引数を数字で入力してください。" . "\n";
}

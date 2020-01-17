<?php
if (count($argv) > 1) {
  $encodeString = base64_encode($argv[1]);
  if (is_null($encodeString)) {
    echo "上手くbase64 encodeできませんでした。" . "\n";
    exit;
  }
  echo $encodeString . "\n";
} else {
  echo "引数を入力してください。" . "\n";
}

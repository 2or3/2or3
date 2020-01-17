<?php
if (count($argv) > 1) {
  $decodeStrin = base64_decode($argv[1]);
  $json = json_decode($decodeStrin);
  if (is_null($json)) {
    echo "上手くbase64 decodeできませんでした。" . "\n";
    exit;
  }
  echo json_encode($json, JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT) . "\n";
} else {
  echo "引数を入力してください。" . "\n";
}

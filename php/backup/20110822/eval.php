<?php
//$UID = $_SESSION[];
$UID = 1;
$CID = $_GET["cid"];
$evl = $_GET["evl"];
$ETID = 0;
echo "コメントＩＤ：".$CID." 評価項目：".$evl;
//評価トランザクションテーブル書き込み
//評価テーブル書き込み
//本番用
$con = mysql_connect('mysql246.db.sakura.ne.jp','qu-vit','ifan4ifan4');
mysql_query('SET NAMES utf8;');
mysql_select_db('qu-vit', $con);

//テスト用
//$con = mysql_connect('localhost', 'quvit', 'highjump2m');
//mysql_query('SET NAMES utf8;');
//mysql_select_db('quvit', $con);

$cnt = mysql_query('SELECT COUNT(*) as cnt FROM eval_trs_tbl;', $con);
if($qdt = mysql_fetch_array($cnt)) {
        $ETID = $qdt["cnt"];
}

$query = sprintf("INSERT INTO eval_trs_tbl (ID, comm_ID, user_ID, eval_ID) VALUE ('$ETID', '$CID', '$UID', '$evl')");

$result = mysql_query($query);

if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}


<?php
require("qerr.php");
$qer = new qryerr();
//$UID = $_SESSION[];

//テスト用
$UID = 1;

//本番用
//$FUID = $_COOKIE["id"];
//$FUID = "100001002596445";

$CID = $_GET["cid"];
$evl = $_GET["evl"];
$ETID = 0;

//echo "コメントＩＤ：".$CID." 評価項目：".$evl;
//評価トランザクションテーブル書き込み
//評価テーブル書き込み
//本番用
//require("library/db_lib.php");
//$con = db_connect();
//db_select("qu-vit");
//db_charset("utf8"); 


//テスト用
$con = mysql_connect('localhost', 'quvit', 'highjump2m');
mysql_query('SET NAMES utf8;');
mysql_select_db('quvit', $con);

$cntq = sprintf("SELECT ID FROM eval_trs_tbl ORDER BY ID");
$cnt = mysql_query($cntq);
$qer->qerr($cnt, $cntq);
while($qdt = mysql_fetch_assoc($cnt)) {
        $ETID = $qdt["ID"];
}

$ETID += 1;

//本番用
//$query = sprintf("SELECT id FROM user WHERE facebook_id = %s;", mysql_real_escape_string($FUID));
//$result = mysql_query($query);
//$qer->qerr($result, $query);
//while($row = mysql_fetch_assoc($result)){
//	$UID = $row["id"];
//}

$query = sprintf("INSERT INTO eval_trs_tbl (ID, comm_ID, user_ID, eval_ID) VALUE ('$ETID', '$CID', '$UID', '$evl')");

$result = mysql_query($query);
$qer->qerr($result, $query);

switch($evl){
    case 1:
        $UDVL = "E1_PT";
        break;
    case 2:
        $UDVL = "E2_PT";
        break;
    case 3:
        $UDVL = "E3_PT";
        break;
}

$query = sprintf("UPDATE eval_tbl SET %s = %s + 1, E4_PT = E4_PT + 1 where C_ID=%s", mysql_real_escape_string($UDVL), mysql_real_escape_string($UDVL), mysql_real_escape_string($CID));

$result = mysql_query($query);
$qer->qerr($result, $query);

//本番用
//db_close();


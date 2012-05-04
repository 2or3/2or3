<?php
require("qerr.php");
$qre = new qryerr();
$eqry = "C_ID, E1_ID, E1_PT, E2_ID, E2_PT, E3_ID, E3_PT, E4_ID, E4_PT";
$E1ID = 1;
$E2ID = 2;
$E3ID = 3;
$E4ID = 4;
$E1PT = 0;
$E2PT = 0;
$E3PT = 0;
$E4PT = 0;


//テスト用
$con = mysql_connect('localhost','quvit','highjump2m');
//mysql_query('SET NAMES utf8;');
mysql_select_db('quvit', $con);

//本番用
//require("library/db_lib.php");
//$con = db_connect();
//db_select("qu-vit");
//db_charset("utf8");

$cnt = mysql_query('SELECT COUNT(*) as cnt FROM comm_tbl;', $con);
if($qdt = mysql_fetch_array($cnt)) {
        $c = $qdt["cnt"];
}
$c += 1;
$UID = $_POST["UID"];
$MID = $_POST["MID"];
$dt = $_POST["sub_cdt"];
$X = $_POST["sub_x"];
$Y = $_POST["sub_y"];
$TXT = $_POST["sub_txt"];
$LN = $_POST["sub_ln"];
$DRID = $_POST["sub_drid"];
$WDT = $_POST["sub_area_width"];


$query = sprintf("INSERT INTO comm_tbl (ID, TEXT, DATE, LINE, DRCT_ID, X_CO, Y_CO, U_ID, M_ID) VALUE ('$c', '$TXT', '$dt', '$LN', '$DRID', '$X', '$Y', '$UID', '$MID')");

$qry_res = mysql_query($query);
$qre->qerr($qry_res, $query);

$query = sprintf("UPDATE map_tbl SET WIDTH=%s WHERE ID=%s", mysql_real_escape_string($WDT), mysql_real_escape_string($MID));

$qry_res = mysql_query($query);
$qre->qerr($qry_res, $query);

$query = sprintf("INSERT INTO eval_tbl (C_ID, E1_ID, E1_PT, E2_ID, E2_PT, E3_ID, E3_PT, E4_ID, E4_PT) VALUE ('$c', '$E1ID', '$E1PT', '$E2ID', '$E2PT', '$E3ID' ,'$E3PT', '$E4ID', '$E4PT')");
$qry_res = mysql_query($query);

if($qre->qerr($qry_res, $query))
{
    header("HTTP/1.1 301 Moved Permanently");
    header("Location: map.php?ID=".$MID);
}

//本番用
//db_close();

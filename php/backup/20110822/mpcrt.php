<?php
//$UID = $_SESSION[];
$UID = "2";
$CTID = $_POST["ctgr"];
$TGID = $_POST["tag"];
$WDT = "800";
$MNM = $_POST["mnm"];
$CDT = "";

$con = mysql_connect('localhost','quvit','highjump2m');
mysql_query('SET NAMES utf8;');
mysql_select_db('quvit', $con);
$cnt = mysql_query('SELECT COUNT(*) as cnt FROM map_tbl;', $con);
if($qdt = mysql_fetch_array($cnt)) {
        $MID = $qdt["cnt"];
}
$MID;

$res = "INSERT INTO map_tbl (ID, NAME, WIDTH, DATE, C_ID, T_ID) VALUE ('$MID', '$MNM', '$WDT', '$CDT', '$CTID', '$TGID')";
$qry_res = mysql_query($res);
if(!$qry_res)
{
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}else{
    header("HTTP/1.1 301 Moved Permanently");
    header("Location: map.php?ID=".$MID);

}


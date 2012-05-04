<?php
$con = mysql_connect('localhost','quvit','highjump2m');
mysql_query('SET NAMES utf8;');
mysql_select_db('quvit', $con);
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


$res = "INSERT INTO comm_tbl (ID, TEXT, DATE, LINE, DRCT_ID, X_CO, Y_CO, U_ID, M_ID) VALUE ('$c', '$TXT', '$dt', '$LN', '$DRID', '$X', '$Y', '$UID', '$MID')";
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


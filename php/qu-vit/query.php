<?php
require("qerr.php");
$qre = new qryerr();

//テスト用
$con = mysql_connect('localhost','quvit','highjump2m');
mysql_query('SET NAMES utf8;');
mysql_select_db('quvit', $con);

//本番用
//require("library/db_lib.php");
//$con = db_connect();
//db_select("qu-vit");
//db_charset("utf8");

$X = (int)$_POST["sub_x"];
$Y = (int)$_POST["sub_y"];
$WDT = (int)$_POST["sub_area_width"];
$MID = $_POST["MID"];

$cv = 0;
$cvid[] = array();
$yst;
$xst;

$selque = sprintf("SELECT ID, X_CO, Y_CO FROM comm_tbl WHERE M_ID=%s", mysql_real_escape_string($MID));
$selres = mysql_query($selque);
$qre->qerr($selres, $selque);

while($row = mysql_fetch_assoc($selres)) {
  $XP = (int)$row["X_CO"];
  $YP = (int)$row["Y_CO"];

//echo "XP:".$XP;
//echo " YP:".$YP;
//echo " X:".$X;
//echo " Y:".$Y."<br>";

  if($Y - 20 > $YP - 20  && $Y - 20 < $YP + 170 && $X - 20 > $XP - 20 && $X - 20 < $XP + 220)
  {
    $cv += 1;
    $cvid[] = $row["ID"];
  }
  else if($Y + 170 > $YP - 20  && $Y + 120 < $YP + 170 && $X + 220 > $XP - 20 && $X + 220 < $XP + 220)
  {
    $cv += 1;
    $cvid[] = $row["ID"];
  }
  else if($Y + 120 > $YP - 20  && $Y + 120 < $YP + 170 && $X - 20 > $XP - 20 && $X - 20 < $XP + 220)
  {
    $cv += 1;
    $cvid[] = $row["ID"];
  }
  else if($Y - 20 > $YP - 20  && $Y - 20 < $YP + 170 && $X + 220 > $XP - 20 && $X + 220 < $XP + 220)
  {
    $cv += 1;
    $cvid[] = $row["ID"];
  }

  if(230 >= $XP)
  {
    if($yst < $YP)
      $yst = $YP;
  }

  if(180 >= $YP)
  {
    if($xst < $XP)
      $xst = $XP;
  }
}

if($cv > 0)
{
  if($xst < $yst)
  {
    $X = $xst + 230;
    $Y = 10;
    if($WDT < $X + 220)
      $WDT += 300;
  }
  else
  {
    $X = 10;
    $Y = $yst + 180;
    if($WDT < $Y + 170)
      $WDT += 300;
  }
}

$query = sprintf("SELECT ID FROM comm_tbl ORDER BY ID");
$result = mysql_query($query);
$qre->qerr($result, $query);
while($row = mysql_fetch_assoc($result)) {
  $c = $row["ID"];
}

$c += 1;
$UID = $_POST["UID"];
$dt = $_POST["sub_cdt"];
$TXT = $_POST["sub_txt"];
$LN = $_POST["sub_ln"];
$DRID = $_POST["sub_drid"];

$query = sprintf("SELECT id FROM comm_tbl");

  $query = sprintf("INSERT INTO comm_tbl (ID, TEXT, DATE, LINE, DRCT_ID, X_CO, Y_CO, U_ID, M_ID) VALUE ('$c', '$TXT', '$dt', '$LN', '$DRID', '$X', '$Y', '$UID', '$MID')");

  $qry_res = mysql_query($query);
  $qre->qerr($qry_res, $query);

  $query = sprintf("UPDATE map_tbl SET WIDTH=%s WHERE ID=%s", mysql_real_escape_string($WDT), mysql_real_escape_string($MID));

  $qry_res = mysql_query($query);
  $qre->qerr($qry_res, $query);

  $query2 = sprintf("INSERT INTO eval_tbl (C_ID, E1_ID, E1_PT, E2_ID, E2_PT, E3_ID, E3_PT, E4_ID, E4_PT) VALUE ('$c', 1, 0, 2, 0, 3, 0, 4, 0)");
  $qry_res2 = mysql_query($query2);

if($qre->qerr($qry_res2, $query2))
{
  header("HTTP/1.1 301 Moved Permanently");
  header("Location: map.php?ID=".$MID);
}else{
  $query = sprintf("DELETE FROM map_tbl WHERE ID=%s", mysql_real_escape_string($c));
}

//本番用
//db_close();

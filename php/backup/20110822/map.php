<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 

<?php
//$UID = $_POST[""];
$MID = $_GET["ID"];
$UID = 1;
$con = mysql_connect('localhost', 'quvit', 'highjump2m');
mysql_query('SET NAMES utf8;');
mysql_select_db('quvit', $con);
$query = sprintf("select WIDTH from map_tbl where ID='%s'", mysql_real_escape_string($MID));
$result = mysql_query($query);

if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}

$wdth = 0;
while($row = mysql_fetch_assoc($result)) {
    $wdth = (int)$row["WIDTH"];
    $nwmp = "1";
}


$query = null;
$query = sprintf("select IMG,NAME,JOB from user_tbl where ID='%s'", mysql_real_escape_string($UID));

$result = mysql_query($query);

if(!$result){
    $message = 'Invalid query:' . mysql_error() . "\n";
    $message .= 'Whole query:' .$query;
    die($message);
}

$uimg;
$unam;
$ujob;
while($row = mysql_fetch_assoc($result)){
    $uimg = $row["IMG"];
    $unam = $row["NAME"];
    $ujob = $row["JOB"];
}
$query = null;
$query = sprintf("select ID, TEXT, X_CO, Y_CO, DATE, DRCT_ID, LINE, U_ID from comm_tbl where M_ID='%s'", mysql_real_escape_string($MID));
$result = mysql_query($query);

if(!$result){
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}
$n = 0;

$cid_ar = array();
$img_ar = array();
$unm_ar = array();
$ujb_ar = array();
$tx_ar = array();
$cx_ar = array();
$cy_ar = array();
$dt_ar = array();
$dr_ar = array();
$ln_ar = array();

while($row = mysql_fetch_assoc($result)) {
    $cuid = $row["U_ID"];
    $uQry = sprintf("select IMG, NAME, JOB from user_tbl where ID='%s'", mysql_real_escape_string($cuid));
    $uqrsl = mysql_query($uQry);
    if(!$uqrsl){
      $massage = 'Invalid query: ' . mysql_error() . "\n";
      $massage .= 'Whole query:' . $query;
      die($massage);
    }
    while($utrow = mysql_fetch_assoc($uqrsl)) {
      $img_ar[$n] = $utrow["IMG"];
      $unm_ar[$n] = $utrow["NAME"];
      $ujb_ar[$n] = $utrow["JOB"];
    }
    $cid_ar[$n] = $row["ID"];
    $tx_ar[$n] = $row["TEXT"];
    $cx_ar[$n] = $row["X_CO"];
    $cy_ar[$n] = $row["Y_CO"];
    $dt_ar[$n] = $row["DATE"];
    $dr_ar[$n] = $row["DRCT_ID"];
    $ln_ar[$n] = $row["LINE"];
    $n++;
}

// 結果セットに関連付けられているリソースの開放
// これは、スクリプトが終了する際に自動的に実行されます。
mysql_free_result($result);

$cid_js = implode("%,%", $cid_ar);
$img_js = implode("%,%", $img_ar);
$unm_js = implode("%,%", $unm_ar);
$ujb_js = implode("%,%", $ujb_ar);
$tx_js = implode("%,%", $tx_ar);
$cx_js = implode("%,%", $cx_ar);
$cy_js = implode("%,%", $cy_ar);
$dt_js = implode("%,%", $dt_ar);
$dr_js = implode("%,%", $dr_ar);
$ln_js = implode("%,%", $ln_ar);

?>

<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta http-equiv="content-type" content="text/javascript; charset=utf-8" /> 
<meta http-equiv="content-type" content="text/css; charset=utf-8" /> 
<title>Test</title>
<!--[if IE]>
<script type="text/javascript" src="sample/excanvas.js"></script>
<![endif]-->
<script type="text/javascript" >
<!--
  var n = '<?php echo $n; ?>';
  n = Number(n);
  var cidjs = '<?php echo $cid_js; ?>';
  var imgjs = '<?php echo $img_js; ?>';
  var unmjs = '<?php echo $unm_js; ?>';
  var ujbjs = '<?php echo $ujb_js; ?>';
  var txjs = '<?php echo $tx_js; ?>';
  var cxjs = '<?php echo $cx_js; ?>';
  var cyjs = '<?php echo $cy_js; ?>';
  var dtjs = '<?php echo $dt_js; ?>';
  var drjs = '<?php echo $dr_js; ?>';
  var lnjs = '<?php echo $ln_js; ?>';
  var cid_ar = cidjs.split("%,%");
  var img_ar = imgjs.split("%,%");
  var unm_ar = unmjs.split("%,%");
  var ujb_ar = ujbjs.split("%,%");
  var tx_ar = txjs.split("%,%");
  var cx_ar = cxjs.split("%,%");
  var cy_ar = cyjs.split("%,%");
  var dt_ar = dtjs.split("%,%");
  var dr_ar = drjs.split("%,%");
  var ln_ar = lnjs.split("%,%");
  var mid = '<?php echo $MID; ?>';
  var uimg = '<?php echo $uimg; ?>';
  var unam = '<?php echo $unam; ?>';
  var ujob = '<?php echo $ujob; ?>';

//-->
</script>
<script type="text/javascript" src="sample/excanvas.js"></script>

<link rel="stylesheet" href="css/reset-min.css" type="text/css"/> 
<link rel="stylesheet" href="css/base-min.css" type="text/css" /> 
<script src="js/jquery-1.5.1.min.js" type="text/javascript" ></script> 
<script src="js/jquery-ui-1.8.14.custom.min.js" type="text/javascript" ></script> 
<script src="map.js" type="text/javascript"  ></script> 
<style> 
#box{
	width: 1px;
	height: 1px;
	background-color:white;
	position:absolute;
	border:1px solid #000;
}
</style> 
</head> 
<body onload="Dsp_pos()"> 
<form id="form1" method="POST" action="query.php" >
<input type="hidden" id="MID" name="MID" value=<?php echo $MID; ?> />
<input type="hidden" id="UID" name="UID" value=<?php echo $UID; ?> />
<input type="hidden" id="sub_txt" name="sub_txt" value="" />
<input type="hidden" id="sub_x" name="sub_x" value="" />
<input type="hidden" id="sub_y" name="sub_y" value="" />
<input type="hidden" id="sub_cdt" name="sub_cdt" value="" />
<input type="hidden" id="sub_ln" name="sub_ln" value="" />
<input type="hidden" id="sub_drid"name="sub_drid" value="" />
<input type="hidden" id="sub_area_width" value="" />
</form>
<div id="map_area" style="width: <?php echo $wdth; ?>px; height: <?php echo $wdth; ?>px; background-color: black;" >
<canvas id="map_canv" width="<?php echo $wdth; ?>" height="<?php echo $wdth; ?>" style="background-color: black"></canvas>
</div>
<div id="pos"></div>
</body> 
</html> 

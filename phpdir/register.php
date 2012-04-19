<head>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=UTF-8">
  <title></title>
</head>
<?php
$ID = $_POST['ID'];
$uName = $_POST['uName'];
$pass = $_POST['pass'];
$email = $_POST['email'];
$con = mysql_connect('localhost','root','highjump2m');
mysql_query('SET NAMES latin1;');
mysql_select_db('SADB',$con);
$cnt = mysql_query('SELECT COUNT(*) as cnt FROM user;', $con);
if($qdt = mysql_fetch_array($cnt)) {
	$c = $qdt["cnt"];
}
$c += 1;
$res = "INSERT INTO user (PREF_CD, PREF_ID, PREF_PASS, PREF_NAME, PREF_EMAIL) VALUES ('$c','$ID','$pass','$uName','$email')";
$result_flag = mysql_query($res);
if (!$result_flag) {
  echo "<a href='reginput.html'>戻る</a><br>";
  mysql_close($con);
  die('登録が失敗しました。'.mysql_error());

}else{
  echo "<a href='login.php'>ログイン画面へ</a><br>";
  mysql_close($con);
  die('登録が完了しました');
}

?>
<body>
</body>
</html>

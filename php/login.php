<?php

if(isset($_POST["action"]) && $_POST["action"] === "login")
{
  $con = mysql_connect('localhost','root','highjump2m');
  mysql_query('SET NAMES latin1;');
  mysql_select_db('SADB',$con);
  $res = mysql_query('SELECT PREF_ID, PREF_PASS FROM user where PREF_ID="'.$_POST["ID"].'";', $con);
  $row = mysql_fetch_assoc($res);
 
  if (!$res)
  {
    die('失敗しました。'.mysql_error());
  }else{
    if($row["PREF_PASS"] === $_POST["password"])
    {
      setcookie("TEST", md5($_POST["ID"]));
      session_start();
      $_SESSION["lgnul"] = "ul_st";
      header("Location:admin.php?ID=".$_POST["ID"]);
    }else{
      setcookie("TEST", "", time() - 3600);
      message();
    }
    die('');
  }
}

?>
<?php
function message(){
  print "incorrect password";
}
?>
<html>
<head>
<title>login</title>
</head>
<body>
<form action="" method="post">
<TABLE>
<tr>
  <th align="right"><b>ID：</b></th>
  <td><input name="ID" type="text" ><td>
</tr>
<tr>
  <th align="right"><b>PASS：</b></th>
  <td><input name="password" type="password" /></td>
</tr>
</TABLE>
  <input name="action" type="submit" type="submit" value="login" /></br>
  <a href="reginput.html" >新規登録はこちら</a>
</form>
</body>
</html>

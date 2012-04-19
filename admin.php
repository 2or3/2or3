<?php
session_start();
if($_SESSION["lgnul"] != "ul_st" && !isset($SESSION["lgnul"]))
{
  header("Location: http://localhost/phpdir/login.php");
}else{
  if(isset($_COOKIE["TEST"]) && $_COOKIE["TEST"] != null && md5($_GET["ID"]) === $_COOKIE["TEST"] )
  {
    $id = $_GET["ID"];
    print "Login success";
    header("Location:top.php?ID=".$id);
  }else{
    print "Login false";
  }
}
?>
<html>
<head>
<title>start page</title>
</head>
<body>
<br />
<a href="test.php">PHP test</a>

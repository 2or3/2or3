<?php
session_start();
if($_SESSION["lgnul"] != "ul_st" && !isset($SESSION["lgnul"]))
{
  header("Location: http://localhost/phpdir/login.php");
}else{
  $id = $_GET["ID"];
}
?>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja" dir="ltr"> 
 
<head> 
<meta http-equiv="content-type" content="text/html; charset=shift_jis" /> 
<meta http-equiv="content-language" content="ja" /> 
<meta http-equiv="content-style-type" content="text/css" /> 

<link rel="stylesheet" href="./style-tab.css" type="text/css"/> 
<link rel="stylesheet" href="./style6.css" type="text/css"/> 
<link rel="stylesheet" href="./style-h2.css" type="text/css"/> 
<style type="text/css"> 
</style>
<title>top page</title>
</head>
<body>
<div id="top" style="padding-top:0px;"> 
<div class="toplogo"><a href="http://www.1uphp.com/" name="pagetop"><img src="./images.jpg" alt="1upホームページ作成(ロゴ)"/></a></div> 
<h1><a title="ホームページ作成TOP" href="http://www.1uphp.com/">ホームページ作成しよう！</a><br/>HTML～スタイルシート</h1> 
</div><!-- top end --> 

<div id="main"> 
<div id="left"> 
<div id="sub1">  

<a name="tab2" style="visibility:hidden"></a> 
		<p>（２）上記のもを複数色でタブメニュー化</p> 
 
<div class="tab"> 
<p class="tabmenu">MENU:</p> 
<ul> 
<li class="tab21off"><a href="top.php?ID=<? echo $id; ?>">Top</a></li> 
<li class="tab22off"><a href="diary.php?ID=<? echo $id; ?>">日記</a></li> 
<li class="tab23off"><a href="img.php?ID=<? echo $id; ?>">写真</a></li> 
<li class="tab24on"><a href="mail.php?ID=<? echo $id; ?>">メッセージ</a></li> 
<li class="tab25off"><a href="comm.php?ID=<? echo $id; ?>">コミュニティ</a></li>
<li class="tab26off"><a href="fpri.php?ID=<? echo $id; ?>">足あと</a></li>
<li class="tab27off"><a href="conf.php?ID=<? echo $id; ?>">設定</a></li>
</ul> 
</div> 
<div class="tab21p"> 
<p>今は『タブメニュー１』を選択してます。</p> 
<p>下記の色を使用して背景色と罫線を変更してます。</p> 
<p> 
選択中の色<span style="color:#ff3333">■</span>(#ff3333) ←→ 選択外の色<span style="color:#ffcccc">■</span>(#ffcccc)<br/> 
選択中の色<span style="color:#3333ff">■</span>(#3333ff) ←→ 選択外の色<span style="color:#ccccff">■</span>(#ccccff)<br/> 
選択中の色<span style="color:#33cc33">■</span>(#33cc33) ←→ 選択外の色<span style="color:#ccffcc">■</span>(#ccffcc)<br/> 
選択中の色<span style="color:#ff6600">■</span>(#ff6600) ←→ 選択外の色<span style="color:#ffff99">■</span>(#ffff99)<br/> 
</p> 
<p><a href="tab21.html" target="_blank"><img src="../../img/shortcut.gif" height="11" width="11" border="0" alt="" />このタブメニューの作り方を確認</a></p> 
</div> 
 
	<p class="goto"><a title="ホームページ作成TOP" href="http://www.1uphp.com/">ホームページ作成ＴＯＰ</a>&nbsp;&gt;&nbsp;<a href="./menu.html">メニュー</a>&nbsp;&gt;&nbsp;タブメニューのいろいろ（一覧）&nbsp;&gt;&nbsp;<a href="#pagetop">このページのＴＯＰ　▲</a></p> 
</div>
</div>
</div> 
 
<form>
</form>
</body>
</html>

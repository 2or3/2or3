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
<div class="toplogo"><a href="http://www.1uphp.com/" name="pagetop"><img src="./images.jpg" alt="1up�z�[���y�[�W�쐬(���S)"/></a></div> 
<h1><a title="�z�[���y�[�W�쐬TOP" href="http://www.1uphp.com/">�z�[���y�[�W�쐬���悤�I</a><br/>HTML�`�X�^�C���V�[�g</h1> 
</div><!-- top end --> 

<div id="main"> 
<div id="left"> 
<div id="sub1">  

<a name="tab2" style="visibility:hidden"></a> 
		<p>�i�Q�j��L�̂��𕡐��F�Ń^�u���j���[��</p> 
 
<div class="tab"> 
<p class="tabmenu">MENU:</p> 
<ul> 
<li class="tab21off"><a href="top.php?ID=<? echo $id; ?>">Top</a></li> 
<li class="tab22off"><a href="diary.php?ID=<? echo $id; ?>">���L</a></li> 
<li class="tab23off"><a href="img.php?ID=<? echo $id; ?>">�ʐ^</a></li> 
<li class="tab24on"><a href="mail.php?ID=<? echo $id; ?>">���b�Z�[�W</a></li> 
<li class="tab25off"><a href="comm.php?ID=<? echo $id; ?>">�R�~���j�e�B</a></li>
<li class="tab26off"><a href="fpri.php?ID=<? echo $id; ?>">������</a></li>
<li class="tab27off"><a href="conf.php?ID=<? echo $id; ?>">�ݒ�</a></li>
</ul> 
</div> 
<div class="tab21p"> 
<p>���́w�^�u���j���[�P�x��I�����Ă܂��B</p> 
<p>���L�̐F���g�p���Ĕw�i�F�ƌr����ύX���Ă܂��B</p> 
<p> 
�I�𒆂̐F<span style="color:#ff3333">��</span>(#ff3333) ���� �I���O�̐F<span style="color:#ffcccc">��</span>(#ffcccc)<br/> 
�I�𒆂̐F<span style="color:#3333ff">��</span>(#3333ff) ���� �I���O�̐F<span style="color:#ccccff">��</span>(#ccccff)<br/> 
�I�𒆂̐F<span style="color:#33cc33">��</span>(#33cc33) ���� �I���O�̐F<span style="color:#ccffcc">��</span>(#ccffcc)<br/> 
�I�𒆂̐F<span style="color:#ff6600">��</span>(#ff6600) ���� �I���O�̐F<span style="color:#ffff99">��</span>(#ffff99)<br/> 
</p> 
<p><a href="tab21.html" target="_blank"><img src="../../img/shortcut.gif" height="11" width="11" border="0" alt="" />���̃^�u���j���[�̍������m�F</a></p> 
</div> 
 
	<p class="goto"><a title="�z�[���y�[�W�쐬TOP" href="http://www.1uphp.com/">�z�[���y�[�W�쐬�s�n�o</a>&nbsp;&gt;&nbsp;<a href="./menu.html">���j���[</a>&nbsp;&gt;&nbsp;�^�u���j���[�̂��낢��i�ꗗ�j&nbsp;&gt;&nbsp;<a href="#pagetop">���̃y�[�W�̂s�n�o�@��</a></p> 
</div>
</div>
</div> 
 
<form>
</form>
</body>
</html>

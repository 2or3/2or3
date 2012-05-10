<%@ page contentType="text/html;charset=UTF-8" import="java.util.regex.*" %>
<html>
<head>
<title>正規表現で文字列を検索する</title>
</head>
<body>
<%
String strMsg = "メールアドレスは、CQW15204@nifty.comです。";
strMsg += "y-yamada@mcn.ne.jp もあります。";
Pattern ptn = Pattern.compile("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+",Pattern.CASE_INSENSITIVE);
Matcher mtch = ptn.matcher(strMsg);
while(mtch.find()){
  out.println(mtch.group() + "<br />");
}
%>
</body>
</html>

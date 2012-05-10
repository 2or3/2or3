<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>refererの判定</title>
</head>
<body>
<%
String strRef = request.getHeader("referer");
String strHost = request.getServerName();
if(strRef == null || strRef.indexOf(strHost) == -1)
{
  out.println("あなたは他のサイトから訪れました");
}else{
  out.println("あなたはこのサイト内のページからリンクしてきました");
}
%>
</body>
</html>

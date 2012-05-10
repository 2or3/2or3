<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<%
String strLan = request.getHeader("user-agent");
if(strLan.indexOf("MSIE") != -1)
{
  out.println("あなたはIEを使っています");
}else{
  out.println("あなたはIE以外のブラウザを使っています");
}
%>
</body>
</html>

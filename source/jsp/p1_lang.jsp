<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<%
String strLang = request.getHeader("accept-language");
if(strLang.indexOf("ja") != -1)
{
  out.println("こんにちは、ご機嫌いかがですか？");
}else{
  out.println("Hello, How are you ?");
}
%>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" %>
<html>
<head>
<title>クエリ情報を取得する</title>
</head>
<body>
<h1>クエリ情報一覧</h1>
<table border="1" >

<%
Enumeration enmNam = request.getParameterNames();
while(enmNam.hasMoreElements()){
  String strNam = (String)(enmNam.nextElement());
  out.println("<tr><th>" + strNam +"</th>");
  out.println("<td>" + request.getParameter(strNam) + "</td></tr>");
}
%>
</table>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%! 
int i;
String str[] = {"おはようございます","こんにちは","こんばんは"};
%>

<html>
<head>
<title>「JSP」にご挨拶</title>
</head>
<body>
<h1>「JSP」にご挨拶</h1>
<%
for(i=0;i < str.length; i++)
  out.println("<p>" + str[i] + "、「JSP」さん</p>");
%>
</body>
</html>

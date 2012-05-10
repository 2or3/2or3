<%@ page contentType="text/html;charset=UTF-8" %>
<%! 
int i;
int intNum;
String[] strVal={"渡辺","松岡","川端","本多","川村"};
%>
<html>
<head>
<title>みんなにHello!!</title>
</head>
<body>
<h1>みんなにHello!!</h1>
<%
intNum=strVal.length;
for(i=0;i<intNum;i++)
  out.println("<p>こんにちわ、" + strVal[i] + "さん！</p>");

%>
</body>
</html>

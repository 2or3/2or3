<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>アンケート結果</title>
</head>
<body>
<%
  switch(Integer.parseInt(request.getParameter("food"))){
    case 3: out.println("僕も大好きです");break;
    case 2: out.println("まあまあですね");break;
    case 1: out.println("この世の食べ物とは思えない");break;
  }
%>
</body>
</html>

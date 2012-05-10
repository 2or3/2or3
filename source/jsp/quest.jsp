<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>アンケート結果</title>
</head>
<body>
<h1>アンケート結果</h1>
<%
  String strAns=request.getParameter("interest");
  if(Integer.parseInt(strAns)==1){
    out.println("よかったあ！");
  }else{
    out.println("ええ、なんでえ！？");
  }
%>
</body>
</html>


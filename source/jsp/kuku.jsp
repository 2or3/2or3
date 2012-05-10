<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>九九表を作ってみよう</title>
</head>
<body>
<h1>九九表</h1>
<table broder="1">
<tr>
  <th></th><th>1</th><th>2</th><th>3</th><th>4</th>
  <th>5</th><th>6</th><th>7</th><th>8</th><th>9</th>
</tr>
<%
  for(int i = 1; i < 10; i++){
    out.println("<tr>");
    out.println("<th>" + i + "</th>");
    for(int j = 1; j < 10; j++){
      if(i*j>40){break;}
      out.println("<td align='right' width='20'>" + (i*j) + "</td>");
    }
    out.println("</tr>");
  }
%>
</table>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" import="java.io.*,java.util.*" %>
<html>
<head>
<title>住所録一覧</title>
</head>
<body>
<h1 style="font-size:14pt;background:#cccccc">住所録一覧</h1>
<table border="0">
<tr style="background:#00ccff">
  <th>No.</th><th>名前</th><th>性別</th><th>電話番号</th><th>住所</th>
</tr>
<%
String tmpStr;
StringTokenizer tkn;
FileReader fr = new FileReader(application.getRealPath("day04-2/data.txt"));
BufferedReader br = new BufferedReader(fr);
while(br.ready()){
  tmpStr = br.readLine();
  out.println("<tr style='background:#ffffcc'>");
  tkn = new StringTokenizer(tmpStr, "\t");
  while(tkn.hasMoreTokens()){
    out.println("<td>" + tkn.nextToken() + "</td>");
  }
  out.println("</tr>");
}
br.close();
%>
</table>
</body>
</html>

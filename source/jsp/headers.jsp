<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" %>
<html>
<head>
<title>ヘッダ情報取得</title>
</head>
<body>
<h1 style="background:#cccccc"ヘッダ情報の取得</h1>
<table border="0">
<%
Enumeration hdr=request.getHeaderNames();
while(hdr.hasMoreElements()){
  String strNam=(String)hdr.nextElement();
%>
  <tr>
  <th style="color:#FFffFF;background:#0086b2;text-align:right;width:80pt;">
    <%=strNam %></th>
  <td><%=request.getHeader(strNam) %></td>
  </tr>
<% } %>
</table>
</body>
</html>

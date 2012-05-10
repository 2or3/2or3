<%@ page contentType="text/html; charset=UTF-8" %>
<%
String strNam="";
String[] strRec = {"nam", "address"};
String[] strRst = {"", ""};
Cookie[] ck = request.getCookies();
if(ck != null)
{
  for(int i = 0; i < strRec.length; i++)
  {
    for(int j = 0; j < ck.length; j++)
    {
      if(ck[j].getName().equals(strRec[i])){
        strRst[i] = ck[j].getValue();
        break;
      }
    }
  }
}
%>

<html>
<head>
<title>クッキーで情報を保持する</title>
</head>
<body>
<h1 style="background:#cccccc">クッキーで情報を保持する</h1>
<form method="POST" action="p_cookie2.jsp">
<table border="0">
<tr>
  <th>名前：</th>
  <td><input type="text" name="nam" value="<%=strRst[0] %>" /></td>
</tr><tr>
  <th>E-Mail：</th>
  <td><input type="text" name="address" value="<%=strRst[1] %>" /></td>
</tr><tr>
  <td colspan="2">
    <input type="checkbox" name="rec" value="true" checked />
    情報を記録する
  </td>
</tr><tr>
  <td colspan="2"><input type="submit" value="登録" />
  </td>
</tr>
</table>
</form>
</body>
</html> 

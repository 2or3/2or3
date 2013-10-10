<%@ page contentType="text/html;charset=UTF-8" %>
<%!
private String strCRLT(String strEsc){
  StringBuffer strResult = new StringBuffer();
  int intEnd = 0;
  int cnt = 0;
  intEnd = strEsc.indexOf(System.getProperty("line.separator"),cnt);
  while(intEnd != -1)
  {
    strResult.append(strEsc.substring(cnt, intEnd));
    strResult.append("<br />");
    cnt = intEnd + 1;
    intEnd = strEsc.indexOf(System.getProperty("line.separator"),cnt);
  }
  strResult.append(strEsc.substring(cnt));
  return strResult.toString();
}
%>

<html>
<head>
<title>改行文字をブラウザに表示する</title>
</head>
<body>
<h1 style="font-size:14pt;background:#cccccc">改行文字をブラウザに表示する</h1>
<table border="0" style="width:400px;height:100px;">
<tr>
<td style="background:#0086b2;color:"FFffFF;font-size:12pt;font-weight:bold;">
<%= strCRLT(request.getParameter("esc")) %>
</td>
</tr>
</table>
</body>
</html>

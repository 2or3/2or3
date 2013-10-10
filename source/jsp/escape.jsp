<%@ page contentType="text/html;charset=UTF-8" %>
<%!
private String strEscape(String strEsc)
{
  StringBuffer strResult = new StringBuffer();
  for(int i = 0; i < strEsc.length(); i++)
  {
    switch(strEsc.charAt(i))
    {
      case '&' :
        strResult.append("&amp;");
        break;
      case '<' :
        strResult.append("&lt;");
        break;
      case '>' :
        strResult.append("&gt;");
        break;
      default :
        strResult.append(strEsc.charAt(i));
        break;
    }
  }
  return strResult.toString();
}
%>
<html>
<head>
<title>予約文字のエスケープ</title>
</head>
<body>
<h1>予約文字のエスケープ</h1>
入力した文字：<%= strEscape(request.getParameter("esc")) %>
</body>
</html>

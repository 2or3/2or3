<%@ page contentType="text/html;charset=UTF-8" %>
<%
boolean flag = false;
int intCnt = 1;
Cookie cok;
Cookie[] ck = request.getCookies();
if(ck != null)
{
  for(int i = 0; i < ck.length; i++)
  {
    if(ck[i].getName().equals("cnt") == true)
    {
      intCnt = Integer.parseInt(ck[i].getValue())+1;
      cok = new Cookie("cnt", (new Integer(intCnt)).toString());
      cok.setMaxAge(60*60*24*180);
      response.addCookie(cok);
      flag = true;
      break;
    }
  }
}
if(!flag || ck == null)
{
  cok = new Cookie("cnt", "1");
  cok.setMaxAge(60*60*24*180);
  response.addCookie(cok);
}
%>

<html>
<head>
<title>クッキーで簡易アクセスカウンタ</title>
</head>
<body>
あなたはこのサイトに<%=intCnt %>回、アクセスしました。
</body>
</html>


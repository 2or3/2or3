<%@ page contentType="text/html;charset=UTF-8" %>
<%
String[] strRec = {"nam", "address"};
Cookie[] cok = new Cookie[2];
if(request.getParameter("rec") != null)
{
  for(int i = 0; i < strRec.length; i++)
  {
    cok[i] = new Cookie(strRec[i], request.getParameter(strRec[i]));
    cok[i].setMaxAge(60*60*24*180);
    response.addCookie(cok[i]);
  }
  out.println("クッキーが保存されました");
}else{
  for(int i = 0; i < strRec.length; i++)
  {
    cok[i] = new Cookie(strRec[i],"");
    cok[i].setMaxAge(0);
    response.addCookie(cok[i]);
  }
  out.println("クッキーが削除されました");
}
%>

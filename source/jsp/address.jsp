<%@ page contentType="text/html;charset=UTF-8" import="java.util.*, java.io.*" %>
<%!
public String strEncode(String strVal) throws UnsupportedEncodingException{
  if(strVal == null)
  {
    return (null);
  }else{
    return (new String(strVal.getBytes("ISO-8859-1"), "UTF-8"));
  }
}
%>

<html>
<head>
<title>アドレス帳検索</title>
</head>
<body>
<h1 style = "background:#cccccc">アドレス帳検索</h1>
<%
HashMap hm = new HashMap();
hm.put("輪笠貴子", "女, 0xx-xxx9-1111, 横浜市○×町5-18-199");
hm.put("佐々木健司", "男, 04x-231x-xxxx, 川崎市○○町1-3213");
hm.put("鳥内都", "女, 09x-21xx-xx97, 横浜市◇◇区5-16");
hm.put("金崎瑞穂", "女, 02x-654x-324x, 相模原市△△区1-9-21");
String strName = strEncode(request.getParameter("name"));
if(hm.containsKey(strName)){
  String strResult = (String)hm.get(strName);
  StringTokenizer tkn = new StringTokenizer(strResult,",");
%>
  <dl>
    <dt style = "font-size:14pt;font-weight:bold">
    <%=strName %></dt>
    <dd>
      <ol>
        <li><%=tkn.nextToken() %></li>
        <li><%=tkn.nextToken() %></li>
        <li><%=tkn.nextToken() %></li>
      </ol>
    </dd>
  </dl>
<% }else{ %>
  <div style="color:Red">指定された名前は見つかりません。</div>
<% } %>
</body>
</html>

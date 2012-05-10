<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" %>
<%
String strMsg;
int[] intBirth = {1985,5,24};
Calendar calToday = Calendar.getInstance();
Calendar calTemp = Calendar.getInstance();
int intYear = calToday.get(Calendar.YEAR);
calTemp.set(intYear, intBirth[1] - 1, intBirth[2]);
if(calTemp.equals(calToday)){
  strMsg = "Happy for your " + (intYear - intBirth[0]) + "th birth day！";
}else{
  Date dteToday = calToday.getTime();
  Date dteTemp = calTemp.getTime();
  if(!dteTemp.after(dteToday)){
    calTemp.set(Calendar.YEAR, intYear + 1);
    dteTemp = calTemp.getTime();
  }
  long diff = (dteTemp.getTime() - dteToday.getTime())/(24*60*60*1000);
  strMsg = "There is " + diff + " days untill your birth day.";
}
%>
<html>
<head>
<title>Happy birthday!</title>
</head>
<body onload="alert('<%=strMsg %>')">
<h1 style="font-size:14pt;background:#cccccc">Happy birthday!</h1>
</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" %>
<%
long diff = 0;
long lngMin = 366;
boolean flag = false;
String minNam = "";
String strMsg = "";
String[] strNam = {"kakeya nami", "mochiduki mina", "watanabe masato", "matsuoka toru", "yamamoto akiko"};
int[][] intBirth = {{1975,8,4}, {1950,12,1}, {1964,4,2}, {1968,3,1}, {1932,6,28}};
Calendar calToday = Calendar.getInstance();
Calendar calTemp = Calendar.getInstance();
int intYear = calToday.get(Calendar.YEAR);

for(int i = 0; i < strNam.length; i++)
{
  calTemp.set(intYear, intBirth[i][1] - 1, intBirth[i][2]);
  Date dteToday = calToday.getTime();
  Date dteTemp = calTemp.getTime();

  if(dteTemp.equals(dteToday)){
    strMsg = strNam[i] + ". Happy for your " + (intYear - intBirth[i][0]) + "th birth day！";
    flag = true;
    break;
  }else{
    if(dteTemp.after(dteToday))
    {
      diff = (dteTemp.getTime() - dteToday.getTime()) / (24*60*60*1000);
    }else{
      calTemp.set(intYear + 1, intBirth[i][1] - 1, intBirth[i][2]);
      dteTemp = calTemp.getTime();
      diff = (dteTemp.getTime() - dteToday.getTime()) / (24*60*60*1000);
    }
    if(lngMin > diff)
    {
      lngMin = diff;
      minNam = strNam[i];
    }
  }
}

if(!flag)
{
  strMsg = "There is " + lngMin + "days untill " + minNam + " s birth day.";
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


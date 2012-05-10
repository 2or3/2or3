<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.text.*,java.io.*" %>
<%
StringBuffer sb = new StringBuffer();
Calendar cal = Calendar.getInstance();
Date dat = cal.getTime();
SimpleDateFormat fmt = new SimpleDateFormat("yyyyMM");
String fNam = "day04-3/" + fmt.format(dat).toString() + ".log";
FileWriter fw = new FileWriter(application.getRealPath(fNam),true);
BufferedWriter bw = new BufferedWriter(fw,10);
SimpleDateFormat fmt2 = new SimpleDateFormat("H:m:s");
sb.append(fmt2.format(dat).toString());
sb.append("\t");
sb.append(request.getServletPath());
sb.append("\t");
sb.append(request.getHeader("referer"));
sb.append("\t");
sb.append(request.getHeader("user-agent"));
sb.append("\t");
bw.write(sb.toString());
bw.newLine();
bw.close();
%>

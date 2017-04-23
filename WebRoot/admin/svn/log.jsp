<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import='java.io.*' %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>log.jsp</title>
	<link href="../skin/01/css/main.css" rel="stylesheet" type="text/css">
	<link href="../styles/base.css" rel="stylesheet" type="text/css">
	<meta http-equiv="description" content="log">
</head>  
  
<body>
	<%
	String file_name = (String)request.getAttribute("file_name");
	if (file_name == null) return;
	try {
		File file = new File(file_name);
		BufferedReader br = new BufferedReader(new FileReader(file));
		String line;
		while((line = (br.readLine())) != null) { 
			line = line.replace(" ", "&nbsp;");%>
			<%=line %> <br>
		<% 
		} 
	} catch (Exception e) { %>
		<span class="red">Read <%= file_name%> error !</span>
	<% 
	}
	%>
</body>
</html>
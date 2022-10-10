<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
   Enumeration<String> d= request.getParameterNames();
   while(d.hasMoreElements()){
	   String tendk=d.nextElement();
	   if(request.getParameter(tendk)!=null){
	   String gt=request.getParameter(tendk);
        out.println(tendk+":"+gt+"<br>");
	   }
   }
   out.println("<hr>");
   String[] gtcheck=request.getParameterValues("check");
   for(String ss: gtcheck)
	   out.println(ss);
 %>

</body>
</html>

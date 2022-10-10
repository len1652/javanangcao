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
String un=request.getParameter("txtun");
String pass=request.getParameter("txtpass");
if(un.equals("abc")&&pass.equals("abc")){
	out.print(un);
	out.print(pass);
}
else if (un.equals("abcd")){
	response.sendRedirect("http://ums.husc.edu.vn");
}
else if (un.equals("formdangnhap")&&pass.equals("abc")){
	response.sendRedirect("dangnhap.jsp");
}
else if (un.equals("abc")&&pass.equals("123")){
	
  
 		 session.setAttribute("dn", un);
 		response.sendRedirect("htsach.jsp");
}else{
	response.sendRedirect("dangnhap.jsp?kt=1");
}
	
%>
</body>
</html>
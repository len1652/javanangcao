<%@page import="bo.giohangbo"%>

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
   String masach =request.getParameter("ms");
	String tensach =request.getParameter("ts");
long gia=Long.parseLong(request.getParameter("gia"));
	giohangbo gh=null;
	//Neu mua lan dau thi tao cho kh 1 gio: session
	if(session.getAttribute("gio")==null){
		gh=new giohangbo();//Cap phat vung nho de luu gio
		session.setAttribute("gio", gh);//Tao session
	}
	//b1: Luu session ra bien
	gh=(giohangbo)session.getAttribute("gio");
	//b2: Thay doi bien
	gh.Them(masach, tensach, gia, (long)1);
	//b3: Luu Lại session
	session.setAttribute("gio", gh);
	//Hien thi gio
	response.sendRedirect("htgio.jsp");
%>
</body>

</body>
</html>
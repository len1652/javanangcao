<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="testController" method="post">
	<% 
//	String  a = request.getParameter("a");
//	String  b = request.getParameter("b");
//	String  kq = request.getParameter("kq");
	long a=0,b=0,kq=0;
		if(request.getAttribute("aa")!=null){
			a = (long) request.getAttribute("aa");
			b = (long)request.getAttribute("bb");
			kq = (long)request.getAttribute("kq");
			String[] ts =(String[]) request.getAttribute("ts");
			for(String c:ts){
				out.print(c);
			}
		}
	%>
		<br>
       a= <input name="txta" type="number" value="<%=a%>"> <br>
       b= <input name="txtb" type="number" value="<%=b%>"> <br>
       kq= <input name="txtkq" type="number" value="<%=kq%>"> <br>
       <input name="butc" type="submit" value="+"> 
       <input name="butt" type="submit" value="-">
       <input name="butn" type="submit" value="*">
       <input name="butchia" type="submit" value="/">
    </form>

</body>
</html>
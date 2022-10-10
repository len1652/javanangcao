<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width=100% >
		<%for(int i=1;i<=100;i++) {%>
      		<tr align="center">
      			<%for(int j=1;j<=9;j++) {%>
	      			<td width=11%>
	      				<%=j %>x<%=i %>=<%=j*i %>
	      			</td>
      			<%} %> 
      		</tr>
    	<%} %> 
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

  
<form action="ktdn.jsp" method="post">
       Un <input name="txtun" type="text" value=""> <br>
       pass <input name="txtpass" type="text" value=""> <br>
      
      <input name="but1" type="submit" value="Login"><br>
      <%if(request.getParameter("kt")!=null){
    	out.print("đăng nhập sai");  
      }
      %>
 </form>
</body>
</html>
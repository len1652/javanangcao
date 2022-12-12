<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li><a href="adminController">Trang chủ</a></li>
      <li><a href="loaiadminController">Quản lý loại</a></li>
        <li><a href="sachadminController">Quản lý sách</a></li>
        <li><a href="xacnhanController">Xác nhận</a></li>
        <li><a href="danhsachchuyentienController">Khách hàng chuyển tiền</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     
      <%if(session.getAttribute("dn")==null){ %>
      <li><a href="dangnhapadminController">
      <span class="glyphicon glyphicon-log-in"></span> 
      		Login
      </a></li>
      <%}%>
    </ul>
  </div>
</nav>


<table class="table table-hover">

	
	
	  <div style="TEXT-ALIGN: center;">
	     <h2 style="font-weight: 600; color:red "  >Loại sách</h2>
	  </div>
	    
	 
      <tr>
      	<th>STT</th>
      	<th>Mã loại</th>
      	<th>Tên loại</th>
      	<th>số lượng</th>
      </tr>
	<c:if test="${dsl != null }">
		<c:set var = "count" value = "1"/>
		<c:forEach var="h" items="${dsl}" >
			<tr>
			  <td> ${count}</td>	
			  <c:set var = "count" value = '${count+1}'/>
			  
			  <td> ${h.getMaloai()}</td>
			  <td> ${h.getTenloai()}</td>
			  <td> ${h.getSl()}</td>

			<c:if test="${h.getSl() == 0}">
		  	  <td>
			  	  <form id='${h.getMaloai()}+"form"' action="loaiadminController">
			  	  	<button type="submit" name="maloai" value='${h.getMaloai()}' form='${h.getMaloai()}+"form"'>Xóa</button>
			  	  </form>
		  	  <td>
			</c:if>
		   	</tr>
		</c:forEach>
	</c:if>
	</table>
	 <button  type="button" class="btn btn-outline-dark"><a href="loaiadminController?add=1">Thêm loại sách</a></button>
	
</body>
</html>
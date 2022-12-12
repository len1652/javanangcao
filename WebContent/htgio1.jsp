<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.awt.print.Printable"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
      <li><a href="htsachController">Trang chủ</a></li>
      <li><a href="htgioController">Giỏ hàng</a></li>
        <li><a href="dathangController">Thanh toán</a></li>
          <li><a href="lichsuController">Lịch sử mua hàng</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      
      <c:if test = "${taikhoan == null}">
     
         <li><a href="ktdnController">
      		<span class="glyphicon glyphicon-log-in"></span> 
      		Login
      </a></li>
      </c:if>
      <c:if test="${taikhoan != null}">
      <li><a href="htsachController?logout=out"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      		<li><a href="#">
      <span class="glyphicon glyphicon-log-in"></span> 
      		Hi: ${taikhoan.getHoten()}
      </a></li>
      </c:if>
      
    </ul>
  </div>
</nav>


<table width ="1000" align="center">
   <tr>
     <td width ="200" valign="top">
       <table class="table dssach">
       	
       	<c:forEach var = "l" items="${dsloai }">
       		<tr>
       			<td>
       				<a href="htsachController?ml=${l.getMaloai() }">
       					${l.getTenloai()}
       				</a>
       			</td>
       		</tr>
       	</c:forEach>
       </table>
     </td>
      <td width ="600" valign="top">
      
      <form action="xulysoluongController">
      
      
      <table class="table table-hover">
      <tr>
		   		<td>Chọn</td>
			   	<td>Tên sách</td>
			   	<td>Giá sách 	</td>
			   	<td>Số lượng	</td>
			   	<td>Thành tiền	</td>
			   	
		</tr>
	    
	   	<c:set var = "i" scope = "session" value = "${1}"/>
	   	
	   	<c:forEach var ="h" items = "${giohang}">
		   		<tr>
		   		
			   		<td> <input type="checkbox" id="vehicle1" name="check${h.getMasach() }" value="${i}"> 	</td>
				   	<td> ${h.getTensach() } 	</td>
				   	<td> ${h.getGia() } 	</td>
				   	<td> 
				   		
				   			<input name="sl${h.getMasach() }"  method="post" style = "width: 70px;" type="number" 
				   		 	min="0" value="${h.getSoluong() }">
				   		 	</input>
				   		 	<button value=${h.getMasach() } name="btnsave" 	type="submit">save </button>
				   		
				   		
				   	</td>
				   	<td> ${h.getThanhtien()} 	</td>
				   	<td>
				   	
				   		<button  name="remove"type="submit" value = ${h.getMasach() } >Remove </button>
				   		
				   	</td>
			 </tr>
		   	<c:set var = "i" scope = "session" value = "${i+1}"/>
	   </c:forEach>
	   	
		<tr>
		
			
			<td>
	        	<button  name="clear"type="submit" value="lear" >Clear </button>
	        	
           	</td>
           	<td>
           		<button  name="removechk"type="submit" value = "xoa" >ReSelect  </button>
           	</td>
           	
           	<td></td>
           	
           	<td></td>
           	<td></td>
           	
           	<td>
           		
           	</td>
           	<tr style="font-weight: bold; color:blue; text-align:right ">
                 <td colspan="9" align="center">
                     <a href="dathangController">ĐẶT HÀNG</a>
                 </td>
             </tr>
        </tr>
     </table>
     </form>
     
     
     
     
     
     			<h1 >
	        	Tổng tiền: 
	        	<c:set var = "tt" scope = "session" value = "${0}"/>
	        	<c:forEach var ="h" items = "${giohang}">
	        		<c:set var = "tt" scope = "session" value = "${tt + h.getThanhtien() }"/>
	        	</c:forEach>
	        	<c:out value="${tt}"></c:out>
	        	
	        	</h1>
	        	
     			
      <td width ="200" valign="top">
      <form action="htsachController" method="post">
 		 <input  class="form-control"  name="txttk" type="text" value="" placeholder="Nhap tt"> <br>
  		 <input class="btn-primary"  name="butt" type="submit" value="Search">
		</form>
     </td>
   </tr>
</table>
</body>
</html>

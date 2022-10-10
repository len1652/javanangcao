
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
      <li class="active"><a href="htsach.jsp">Trang chủ</a></li>
      <li><a href="htgio.jsp">Giỏ hàng</a></li>
        <li><a href="thanhtoan.jsp">Thanh toán</a></li>
          <li><a href="lichsu.jsp">Lịch sử mua hàng: <%=session.getAttribute("ss") %></a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="thoat.jsp"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      <%if(session.getAttribute("dn")==null){ %>
      <li><a href="dangnhap.jsp">
      <span class="glyphicon glyphicon-log-in"></span> 
      		Login
      </a></li>
      <%}else{ %>
      <li><a href="#">
      <span class="glyphicon glyphicon-log-in"></span> 
      		Hi: <%=session.getAttribute("dn") %>
      </a></li>
      <%} %>
    </ul>
  </div>
</nav>
<%loaibo lbo=new loaibo();
  sachbo sbo=new sachbo();
%>
<table width ="1000" align="center">
   <tr>
     <td width ="200" valign="top">
       <table class="table table-hover">
         <%for(loaibean l: lbo.getloai()){ %>
         <tr><td>
           <a href="htsach.jsp?ml=<%=l.getMaloai()%>">
               <%=l.getTenloai() %>
            </a>
           </td>
           </tr>
           <%} %>
       </table>
     </td>
      <td width ="600" valign="top">
      <form action="xulysoluong.jsp?">
      <table class="table table-hover">
      <tr>
		   		<td>Mã sách	</td>
			   	<td>Tên sách</td>
			   	<td>Giá sách 	</td>
			   	<td>Số lượng	</td>
			   	<td>Thành tiền	</td>
			   	
		</tr>
	    <%
	   giohangbo gh=(giohangbo)session.getAttribute("gio");
	   String x=request.getParameter("sl");
	   if(gh!=null){
		   int i=1;%>
		   <form action="htgio.jsp">
		   <%
		   for(giohangbean h: gh.ds){%>
		   		<tr>
		   		
		   		<td> <input type="checkbox" id="vehicle1" name="vehicle1" value="<%=i%>"> 	</td>
			   	<td> <%=h.getTensach() %> 	</td>
			   	<td> <%=h.getGia() %> 	</td>
			   	<td> 
			   		
			   			<input name="t<%h.getMasach(); %>"  method="post" style = "width: 100px;" type="number" 
			   		 	min="0" value="<%=h.getSoluong()%>">
			   		 	</input>
			   		 	<button value=<%=h.getMasach()%> name="masach"type="submit">save </button>
			   		
			   		
			   	</td>
			   	<td> <%=h.getThanhtien() %> 	</td>
			   	<td>
			   	
			   		<button  name="remove"type="submit" value = <%=h.getMasach()%> >Remove </button>
			   
			   	 </td>
			 </tr>
		   	
		<%   
			i++;}
	   }
%>		
		<tr>
		
			
			<td>
	        	<a href="detele.jsp?clean=1">Clear all</a>
           	</td>
        </tr>
     </table>
     </form>
     			<h1 >
	        	Tổng tiền: <%out.print(gh.Tongtien()); %>
	        	</h1>
     			
      <td width ="200" valign="top">
      <form action="htsach.jsp" method="post">
 		 <input  class="form-control"  name="txttk" type="text" value="" placeholder="Nhap tt"> <br>
  		 <input class="btn-primary"  name="butt" type="submit" value="Search">
		</form>
     </td>
   </tr>
</table>
</body>
</html>
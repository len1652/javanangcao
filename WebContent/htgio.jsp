
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
      <li class="active"><a href="htsachController">Trang chủ</a></li>
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
<%

ArrayList<loaibean> dsloai=(ArrayList<loaibean>)request.getAttribute("dsloai");
ArrayList<sachbean> dssach=(ArrayList<sachbean>)request.getAttribute("dssach");

%>
<table width ="1000" align="center">
   <tr>
     <td width ="200" valign="top">
       <table class="table dssach">
         <%for(loaibean l: dsloai){ %>
         <tr><td>
           <a href="htsachController?ml=<%=l.getMaloai()%>">
               <%=l.getTenloai() %>
            </a>
           </td>
           </tr>
           <%} %>
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
	    <%
	   giohangbo gh=(giohangbo)session.getAttribute("gio");
	   String x=request.getParameter("sl");
	   if(gh!=null){
		   int i=1;%>
		   <%
		   for(giohangbean h: gh.ds){%>
		   		<tr>
		   		
			   		<td> <input type="checkbox" id="vehicle1" name="check<%=h.getMasach()%>" value="<%=i%>"> 	</td>
				   	<td> <%=h.getTensach() %> 	</td>
				   	<td> <%=h.getGia() %> 	</td>
				   	<td> 
				   		
				   			<input name="sl<%=h.getMasach()%>"  method="post" style = "width: 70px;" type="number" 
				   		 	min="0" value="<%=h.getSoluong()%>">
				   		 	</input>
				   		 	<button value=<%=h.getMasach()%> name="btnsave" 	type="submit">save </button>
				   		
				   		
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
	        	<button  name="clear"type="submit" value="lear" >Clear </button>
	        	
           	</td>
           	<td>
           		<button  name="removechk"type="submit" value = "xoa" >ReSelect  </button>
           	</td>
        </tr>
     </table>
     </form>
     
     
     
     
     
     			<h1 >
	        	Tổng tiền: <%if(gh!=null){
	        		out.print(gh.Tongtien());
	        	}else{
	        		out.print("0");
	        	}
	        		%>
	        	
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

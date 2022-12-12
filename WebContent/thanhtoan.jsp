<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table class="table table-hover">
      <tr>
		   		
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
                     <a href="/GioHang/Dathang">ĐẶT HÀNG</a>
                 </td>
             </tr>
        </tr>
     </table>
</body>
</html>
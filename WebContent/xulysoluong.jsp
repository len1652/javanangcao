<%@page import="java.util.ArrayList"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.*"%>

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
		String masach = request.getParameter("btnsave");
		String sl=request.getParameter("sl"+masach);
		String delete = request.getParameter("remove");
		String clear = request.getParameter("clear");
		String clSelect = request.getParameter("removechk");
		
		//tao biến session
		giohangbo gh;
		// bước 1: Lay gia tri cua bien session luu vao bien
		gh=(giohangbo) session.getAttribute("gio");
		//b2: Thao tac trên bien: gh
		if (sl!=null && masach!=null){		
			long nn=Long.parseLong(sl); // số lượng là kiểu long, Long là kiểu .parselong là đổi sl String về long
			// cập nhật số lương
			gh.Up(masach, nn);	
		}
		if (delete!=null){					
			gh.remove(delete);
		}
		if(clSelect!=null && gh!=null){
			ArrayList<giohangbean> ds =  gh.getarr();
			for(int i = 0; i<gh.Size(); i++){
				String danhdau=request.getParameter("check"+ds.get(i).getMasach());
				if(danhdau!=null){
					ds.remove(i);
					i--;
				}
			}
		}
		// bước 3
		//đưa vào ass
		session.setAttribute("gio", gh);
		if (clear!=null){					// 
			session.removeAttribute("gio");	// 
		}
		
		
		//Hien thi gio
		response.sendRedirect("htgio.jsp");
   		
		
   	%>
 	
</body>

</body>
</html>
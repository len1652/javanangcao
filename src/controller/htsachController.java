package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bean.sachbean;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class htsachController
 */
@WebServlet("/htsachController")
public class htsachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htsachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		loaibo lbo = new loaibo();
		request.setAttribute("dsloai", lbo.getloai());
		System.out.println(lbo.getloai().get(0).getMaloai());
		
		sachbo sbo = new sachbo();
		
		ArrayList<sachbean> sachpage = new ArrayList<sachbean>();
		// code nay detestcho huyen nhu
		 request.setCharacterEncoding("utf-8");
	     response.setCharacterEncoding("utf-8");
	     
	     String ml=request.getParameter("ml");
	     String key=request.getParameter("txttk");
	     ArrayList<sachbean> dssach=sbo.getsach();
	     khachhangbean un =  (khachhangbean) session.getAttribute("taikhoan");
	     String page = request.getParameter("page");
	     String logout = request.getParameter("logout");
	     
	     if(dssach!=null) {
	    	 if(ml!=null)
		    	 dssach=sbo.TimMa(ml);
		     else
		     {	
		    	 ml="zozo";
		    	 
		    	 if(key!=null)
			    	 dssach=sbo.Tim(key);
		    	
		    	 
		     }
	     }
	     
	     //nếu trang đăng nhập đầu tiên thì cho hiển thị tất cả các sách
	     if(page == null) {
	    	 page="0";
	     }
	     
//	     System.out.println(dssach.size());
	     
	     // số trang hiện tại
	     if (page != null) {
	    	 if(dssach.size()==0) {
	    		 dssach = sbo.getsach();
	    	 }
	    	 int trang = Integer.parseInt(page);
	    	 trang = trang*12;
	    	 for (int i = trang; i < (trang+12) ; i++ ) {
	    		 if(dssach.size()==i) {
	    			 break;
	    		 }
	    		 else {
	    			 sachpage.add(dssach.get(i));
	    		 }
	    		 
	    	 }
	     }
	     
	    
	     
	     ArrayList<Integer> sl = new ArrayList<Integer>();
	     for ( int i = 0 ; i<(dssach.size()/12+1) ; i ++) {
	    	 sl.add(i);
	     }
	     
	     
	     
	     
	     request.setAttribute("taikhoan", un);
	     if(logout!=null) {
	    	session.removeAttribute("taikhoan");
	     }
	     session.setAttribute("taikhoan", un);
	     
	     
	    request.setAttribute("mloai", ml);
	    request.setAttribute("page", page);
	    request.setAttribute("sotrang", sl);
	    
	    request.setAttribute("dssach", sachpage);
	     
	    RequestDispatcher rd=request.getRequestDispatcher("htsach1.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

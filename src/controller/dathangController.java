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

import bean.dathangbean;
import bean.khachhangbean;
import bean.sachbean;
import bo.dathangbo;
import bo.giohangbo;
import bo.sachbo;



/**
 * Servlet implementation class dathangController
 */
@WebServlet("/dathangController")
public class dathangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dathangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		
		khachhangbean kh = (khachhangbean) session.getAttribute("taikhoan");
		giohangbo gh;
		dathangbo dhbo = new dathangbo();
		gh=(giohangbo) session.getAttribute("gio");
		
		
		String thanhtoan =request.getParameter("kt");
		if (kh==null) {
			response.sendRedirect("ktdnController");
			return;
		}
		if (gh!=null) {
			if (gh.ds.size()!=0) {
				System.out.println(gh.ds.get(0).getTensach()+"=================================================================");
				dhbo.datmua(gh.ds, kh.getMahk());
			}
		}
		
		// code nay detestcho huyen nhu
		 request.setCharacterEncoding("utf-8");
	     response.setCharacterEncoding("utf-8");
	     
	    
	    ArrayList<dathangbean> dsdathang = dhbo.getdh(kh.getMahk());
	    
	    
	    
	    request.setAttribute("dsdathang", dsdathang); 
	    RequestDispatcher rd=request.getRequestDispatcher("dathang.jsp");
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

package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.xacnhanBean2;
import bean.xacnhanbean;

import bo.xacnhanbo;

import dao.xacnhandao;

/**
 * Servlet implementation class xacnhanController
 */
@WebServlet("/xacnhanController")
public class xacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		xacnhandao xn = new xacnhandao();
		RequestDispatcher rd = null;
		ArrayList<xacnhanbean> ls = new ArrayList<xacnhanbean>();
		String hd=request.getParameter("hd");
		String matt=request.getParameter("matt");
		String mahd=request.getParameter("mahd");
		String keyhd=request.getParameter("keyhd");
		String key=request.getParameter("key");
		
		if(keyhd!=null || key!=null) {
	
			
			xacnhanbo xnb = new xacnhanbo();
			if(key!=null) {
			
				ArrayList<xacnhanbean> ds = xnb.getxacnhan();
				ds =  xnb.Tim(key);
				request.setAttribute("dsxn", ds);
				rd= request.getRequestDispatcher("htxacnhan.jsp");
			}
			else if(keyhd!=null){
				System.out.println(keyhd);
			
				ArrayList<xacnhanBean2> ds2 = xnb.getxacnhan2();
				 
				request.setAttribute("dsxn2", xnb.Tim2(keyhd));
				rd= request.getRequestDispatcher("htxacnhan_Hoadon.jsp");
			}
		}
		else if(mahd != null ) {
			
			xn.thanhtoan_hd(Integer.parseInt(mahd));
			ArrayList<xacnhanBean2> ls2 = new ArrayList<xacnhanBean2>();
			ls2 = xn.getXacNhan2(0);
			request.setAttribute("dsxn2", ls2);
			rd= request.getRequestDispatcher("htxacnhan_Hoadon.jsp");
		}
		
		else {
			
			ArrayList<xacnhanBean2> ls2 = new ArrayList<xacnhanBean2>();
			ls2 = xn.getXacNhan2(0);
			request.setAttribute("dsxn2", ls2);
			rd= request.getRequestDispatcher("htxacnhan_Hoadon.jsp");
		}
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

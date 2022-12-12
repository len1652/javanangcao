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


import bean.giohangbean;
import bean.sachbean;
import bo.giohangbo;
import bo.loaibo;
import bo.sachbo;


@WebServlet("/htgioController")
public class htgioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htgioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		HttpSession session= request.getSession();
		
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
	    
	    giohangbo gh;
		// bước 1: Lay gia tri cua bien session luu vao bien
	    gh=(giohangbo) session.getAttribute("gio");
	    if(gh !=null) {
	    	request.setAttribute("giohang", gh.ds);
	    	RequestDispatcher rd ;
	    }
	    
	   
    	loaibo lbo = new loaibo();
    	sachbo sbo = new sachbo();
	    request.setAttribute("dsloai", lbo.getloai());
	    request.setAttribute("dssach", sbo.getsach());
		RequestDispatcher rd ;
		rd = request.getRequestDispatcher("htgio1.jsp");
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

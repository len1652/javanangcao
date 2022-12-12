package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.loaidao;

/**
 * Servlet implementation class loaiadminController
 */
@WebServlet("/loaiadminController")
public class loaiadminControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loaiadminControler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ml=request.getParameter("maloai");
		String add=request.getParameter("add");
		
		String mls=request.getParameter("mls");
		String tls=request.getParameter("tls");
		
		
		RequestDispatcher rd = null;
		loaidao ld = new loaidao();
		if(mls!=null && tls!=null) {
			//Thêm loại sách mới
			ld.addloai(mls, tls);
			request.setAttribute("dsl", ld.geteditloai());
			rd= request.getRequestDispatcher("htloai.jsp");
		}
		else if(add!=null) {
			//chuyển hướng sang trang thêm sách
			request.setAttribute("dsl", ld.geteditloai());
			rd= request.getRequestDispatcher("htaddloai.jsp");
		}
		else if(ml != null) {
			// xóa mã loại
			ld.deleteloai(ml);
			request.setAttribute("dsl", ld.geteditloai());
			rd= request.getRequestDispatcher("htloai.jsp");
		}
		else {
			//Chạy lần đầu
			request.setAttribute("dsl", ld.geteditloai());
			rd= request.getRequestDispatcher("htloai.jsp");
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

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
import javax.websocket.Session;

import bean.khachhangbean;
import bean.taikhoanbean;
import bo.dangnhapbo;
import bo.khachhangbo;
import bo.loaibo;
import dao.dangnhapdao;

/**
 * Servlet implementation class ktdnController
 */
@WebServlet("/ktdnController")
public class ktdnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdnController() {
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
		String un = request.getParameter("txtun");
		String pass= request.getParameter("txtpass");
		String kt= request.getParameter("kt");
		RequestDispatcher rd;
		dangnhapbo dnbo = new dangnhapbo();
		khachhangbo khbo = new khachhangbo();
		ArrayList<taikhoanbean> dstk = dnbo.gettk();
		ArrayList<khachhangbean> dstkkh = khbo.getkh();
		System.out.println("hello");
		System.out.println(dstkkh.get(0).getHoten());
		if (un !=null && pass !=null) {
			for(int i = 0; i<dstkkh.size(); i++) {
				if (dstkkh.get(i).getTendn().equals(un) && dstkkh.get(i).getPass().equals(pass)) {
					session.setAttribute("taikhoan", un);
					response.sendRedirect("htsachController");
					return;
				}
			}
			request.setAttribute("ktra", kt);
		}
		else {
			
			System.out.println("truong hop else");
			rd = request.getRequestDispatcher("dangnhap1.jsp");
			rd.forward(request, response);
		}
		rd = request.getRequestDispatcher("dangnhap1.jsp");
		rd.forward(request, response);
		
	}

	private RequestDispatcher RequestDispatcher(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

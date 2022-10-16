package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String un = request.getParameter("txtun");
		String pass=request.getParameter("txtpass");
		RequestDispatcher rd;
		if(un.equals("abc")&&pass.equals("abc")){
			if(un.equals("abc")&&pass.equals("123")) {
				// tạo ra đối tượng session
				HttpSession session = request.getSession();
				session.setAttribute("dn", un);
				rd=request.getRequestDispatcher("htsach.jsp");
			}else {// dang nhap lai
				rd = RequestDispatcher("dangnhap.jsp?kt1");
				rd.forward(request, response);
			}
		}
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

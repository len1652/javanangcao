package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.addsachBean;
import bo.editsachBo;
import dao.loaidao;
import dao.sachdao;

/**
 * Servlet implementation class themsach2Controler
 */
@WebServlet("/themsach2Controler")
public class themsach2Controler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public themsach2Controler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		String addsach = request.getParameter("add");
		String xoa = request.getParameter("xoa");
		String edit = request.getParameter("edit");
		String key = request.getParameter("key");
		sachdao sd = new sachdao();
		editsachBo edb = new editsachBo();
		loaidao ld = new loaidao();
		
		if(key!=null) {
			//search theo từ khóa
			ArrayList<addsachBean> ds = edb.getsach();
			ds = edb.Tim(key);
			request.setAttribute("dss",ds);
			rd = request.getRequestDispatcher("htEditSach.jsp");
			
		}
		else if(edit != null) {
			//Chuyển sang trang sửa sách
			edb.getsach();
			request.setAttribute("dsl", ld.getloai());
			request.setAttribute("sach",edb.Timms(edit));
			rd = request.getRequestDispatcher("htEditSach2.jsp");
		}
		else if(xoa!=null) {
			//Xóa sách
			sd.Xoasach(xoa);
			System.out.println("đã xóa");
			request.setAttribute("dss", sd.getsachadmin());
			rd = request.getRequestDispatcher("htEditSach.jsp");
		}
		else if(addsach!=null) {
			//Chuyển hướng sang trang thêm sách
			request.setAttribute("dsl", ld.getloai());
			rd = request.getRequestDispatcher("htthemsach.jsp");
		}
		else {
			//Chạy lần đầu
			request.setAttribute("dss", sd.getsachadmin());
			rd = request.getRequestDispatcher("htEditSach.jsp");
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

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.addsachBean;
import bo.editsachBo;
import dao.loaidao;
import dao.sachdao;

/**
 * Servlet implementation class sachadminController
 */
@WebServlet("/sachadminController")
public class sachadminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sachadminController() {
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
			System.out.println("keyyyyyyyyyyyyyyyyyyy "+key);
			ArrayList<addsachBean> ds = edb.getsach();
			ds = edb.Tim(key);
			request.setAttribute("dss",ds);
			rd = request.getRequestDispatcher("htEditSach.jsp");
			
		}
		else if(edit != null) {
			edb.getsach();
			request.setAttribute("dsl", ld.getloai());
			request.setAttribute("sach",edb.Timms(edit));
			rd = request.getRequestDispatcher("htEditSach2.jsp");
			
		}
		else if(xoa!=null) {
			sd.Xoasach(xoa);
			
			request.setAttribute("dss", sd.getsachadmin());
			rd = request.getRequestDispatcher("htEditSach.jsp");
		}
		else if(addsach!=null) {
			request.setAttribute("dsl", ld.getloai());
			rd = request.getRequestDispatcher("htthemsach.jsp");
		}
		else {
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

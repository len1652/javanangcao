package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bo.giohangbo;

/**
 * Servlet implementation class xulysoluongController
 */
@WebServlet("/xulysoluongController")
public class xulysoluongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xulysoluongController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
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
			gh.Up(masach,(long) nn);	
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
		
		response.sendRedirect("htgioController");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

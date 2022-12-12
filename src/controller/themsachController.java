package controller;

import java.io.IOException;
import java.io.File;
import java.io.IOException;
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
import org.apache.commons.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.loaibean;
import dao.loaidao;
import dao.sachdao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class themsachController
 */
@WebServlet("/themsachController")
public class themsachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public themsachController() {
    	

    }
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		 DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		 String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "image_sach";
		 response.getWriter().println(dirUrl1);
		 String ms = null, ts = null,tg= null,sl= null,gia= null,date= null,st= null,ml= null, edit=null, old_img=null;
		 String name = null;
		 RequestDispatcher rd = null ;
		 edit = request.getParameter("edit");
		 old_img = request.getParameter("old_img");
		 
		try {
				List<FileItem> fileItems = upload.parseRequest(request);
					for (FileItem fileItem : fileItems) {
			 			 if (!fileItem.isFormField()) {
							
							String nameimg = fileItem.getName();
							System.out.println("Tên file: "+nameimg);
							name = nameimg;
							if (!nameimg.equals("")) {
						           
								String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "image_sach";
								File dir = new File(dirUrl);
								if (!dir.exists()) {
									dir.mkdir();
								}
							           String fileImg = dirUrl + File.separator + nameimg;
							           
							           File file = new File(fileImg);//táº¡o file
							            try {
							               fileItem.write(file);//lÆ°u file
							              System.out.println("UPLOAD Thành công...!");
							              System.out.println("Đường dẫn file là: "+dirUrl);
							 } catch (Exception e) {
							    e.printStackTrace();
							}
						}
					 }
						else//Neu la control
						{
							String tentk=fileItem.getFieldName();
							if(tentk.equals("txtmasach"))
								 ms = fileItem.getString();
							if(tentk.equals("txttensach"))
								 ts = fileItem.getString("UTF-8");
							if(tentk.equals("txttacgia"))
								 tg = fileItem.getString("UTF-8");
							if(tentk.equals("txtgia"))
								 gia = fileItem.getString();
							if(tentk.equals("txtsoluong"))
								 sl = fileItem.getString();
							if(tentk.equals("txtngaynhap"))
								 date = fileItem.getString();
							if(tentk.equals("txtsotap"))
								 st = fileItem.getString();
							if(tentk.equals("maloai"))
								 ml = fileItem.getString();
						}
			 			
					}
					sachdao sd = new sachdao();
					if(edit!=null ){
						String dirUrl = request.getServletContext().getRealPath("") +  File.separator + old_img;
						File dir = new File(dirUrl);
						dir.delete();
						 
						sd.suasach(ms, ts, tg, sl, st, gia, date, ml, "image_sach/"+name);
						response.sendRedirect("themsach2Controler");
					}
					else if(ms!=null && ts !=null && sl!=null && gia!=null) {
					
						System.out.println("ThÃªm sÃ¡ch");
		 				sd.themsach(ms, ts, tg, sl, st, gia, date, ml, "image_sach/"+name);
		 				response.sendRedirect("themsach2Controler");
		 			}
		 			else {
		 				response.sendRedirect("themsach2Controler?add=1");
		 			}
			
	 			
	 			
	 			
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

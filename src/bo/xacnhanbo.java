package bo;

import dao.xacnhandao;

import java.util.ArrayList;

import bean.xacnhanBean2;
import bean.xacnhanbean;
public class xacnhanbo {
	xacnhandao xndao= new xacnhandao();
	   ArrayList<xacnhanbean> ds;
	   ArrayList<xacnhanBean2> ds2;
	   
	   public ArrayList<xacnhanbean> getxacnhan(){
		   ds=xndao.getXacNhan(0);
		   return ds;
	   }
	   public ArrayList<xacnhanBean2> getxacnhan2(){
		   ds2=xndao.getXacNhan2(0);
		   return ds2;
	   }
	   
	//   public ArrayList<sachbean> TimMa(String maloai){
//		  ArrayList<sachbean> tam= new ArrayList<sachbean>();
//		  for(sachbean s: ds)
//			  if(s.getMaloai().equals(maloai))
//				  tam.add(s);
//		  return tam;
	//   }
	   public ArrayList<xacnhanbean> Tim(String key){
		   ArrayList<xacnhanbean> tam= new ArrayList<xacnhanbean>();
		  for(xacnhanbean s: ds)
			  if(s.getHoten().toLowerCase().contains(key.toLowerCase()) ||
					 String.valueOf(s.getMaChiTietHD()).toLowerCase().contains(key.toLowerCase()))
				  tam.add(s);
		  return tam;
	   }
	   
	   public ArrayList<xacnhanBean2> Tim2(String key){
		   ArrayList<xacnhanBean2> tam= new ArrayList<xacnhanBean2>();
		  for(xacnhanBean2 s: ds2)
			  if(s.getHoten().toLowerCase().contains(key.toLowerCase()) ||
					 String.valueOf(s.getMaHoaDon()).toLowerCase().contains(key.toLowerCase()) )
				  tam.add(s);
		  return tam;
	   }
	   

	   public static void main(String[] args) {
			xacnhanbo sb =new xacnhanbo();
			sb.getxacnhan2();
			for (xacnhanBean2 s : sb.Tim2("chung")) {
				System.out.println(s.getHoten());
			}
	  }
	
}

package bo;

import java.util.ArrayList;

import bean.addsachBean;
import bean.sachbean;
import dao.sachdao;

public class editsachBo {
   sachdao sdao= new sachdao();
   ArrayList<addsachBean> ds;
   public ArrayList<addsachBean> getsach(){
	   ds=sdao.getsachadmin();
	   return ds;
   }

   public ArrayList<addsachBean> Tim(String key ){
	   ArrayList<addsachBean> tam= new ArrayList<addsachBean>();
	   for(addsachBean s: ds)
		   if(s.getTensach().toLowerCase().contains(key.toLowerCase())||
				   s.getTacgia().toLowerCase().contains(key.toLowerCase())||
				   s.getMaloai().toLowerCase().contains(key.toLowerCase()))
			   		tam.add(s);
	   return tam;
   }
   
   public addsachBean Timms(String ms){
	  addsachBean tam = null;
	  for(addsachBean s: ds)
		  if(s.getMasach().equals(ms))
			  tam = s;
	  return tam;
   }


}

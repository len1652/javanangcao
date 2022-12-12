package bo;

import java.util.ArrayList;

import bean.dathangbean;
import bean.giohangbean;
import bean.khachhangbean;
import dao.dathangdao;
import dao.khachhangdao;

public class dathangbo {
	ArrayList<dathangbean> dh = new ArrayList<dathangbean>();
	dathangdao dhdao = new dathangdao();
	public ArrayList<dathangbean> getdh(long makh){
		ArrayList<dathangbean> tam = dhdao.getdathang() ;
		for(int i =0 ; i<tam.size();i++) {
			if(tam.get(i).getMakh()==makh) {
				dh.add(tam.get(i));
			}
		}
		return dh;
	}
	public void thanhtoan(long mahd) {
		dhdao.thanhtoan(mahd);
	}
	public void datmua (ArrayList<giohangbean> gh,long tk) {
		dhdao.datmua(gh, tk);
	}
	
}

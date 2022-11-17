package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import bean.taikhoanbean;
import dao.dangnhapdao;
import dao.khachhangdao;

public class khachhangbo {
	ArrayList<khachhangbean> tk ;
	khachhangdao khdao = new khachhangdao();
	public ArrayList<khachhangbean> getkh(){
		return khdao.getkhachhang();
	}
	
}

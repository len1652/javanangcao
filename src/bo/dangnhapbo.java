package bo;

import java.util.ArrayList;

import bean.taikhoanbean;
import dao.dangnhapdao;

public class dangnhapbo {
	ArrayList<taikhoanbean> tk ;
	dangnhapdao dndao = new dangnhapdao();
	public ArrayList<taikhoanbean> gettk(){
		return dndao.gettaikhoan();
	}
}

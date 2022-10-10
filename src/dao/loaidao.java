package dao;

import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai(){
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		ds.add (new loaibean("tin","Công nghệ thông tin"));
		ds.add (new loaibean("toan","Toán ứng dụng"));
		ds.add (new loaibean("ly","Vật lý chất rắn"));
		ds.add (new loaibean("hoa","Công nghệ hóa dầu"));
		return ds;
	}
}

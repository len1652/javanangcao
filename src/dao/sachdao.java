package dao;

import java.util.ArrayList;

import bean.sachbean;

public class sachdao {
	public ArrayList<sachbean> getsach(){
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		ds.add(new sachbean("s1","Cơ sở dữ liệu 1","Lê nam", 10,1000,"b1.jpg","tin"));
		ds.add(new sachbean("s2","Cơ sở dữ liệu 2","Lê nam", 10,1000,"b2.jpg","tin"));
		ds.add(new sachbean("s3","Giải tích 1","Lê nam", 10,1000,"b3.jpg","toan"));
		ds.add(new sachbean("s4","Giải tích 2","Lê nam", 10,1000,"b4.jpg","toan"));
		ds.add(new sachbean("s5","Lý 1","Lê nam", 10,1000,"b5.jpg","ly"));
		return ds;
	}
	
}

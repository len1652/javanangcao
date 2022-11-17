package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.khachhangbean;
import bean.taikhoanbean;

public class khachhangdao {
	public ArrayList<khachhangbean> getkhachhang(){
		ArrayList<khachhangbean> ds = new ArrayList<khachhangbean>();
		try {
			//B1: Ket noi vao csdl QlSach
			ketNoi kn = new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql ="select*from KhachHang";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//B3 : Duyet rs de luu vao ds
			while (rs.next()) {
				long makh = rs.getLong("makh");
				String hoten = rs.getString("hoten");
				String sodt = rs.getString("sodt");
				String email = rs.getString("email");
				String tendn = rs.getString("tendn");
				String pass = rs.getString("pass");
				ds.add(new khachhangbean(makh, hoten, hoten, sodt, email, tendn, pass));
			}
			//b4: Dong cac doi tuong
			rs.close();
			kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	public static void main(String[] args) {
		khachhangdao dao = new khachhangdao();
		ArrayList<khachhangbean> hk = new ArrayList<khachhangbean>();
		hk = dao.getkhachhang();
		System.out.println(hk.size());
	}
}

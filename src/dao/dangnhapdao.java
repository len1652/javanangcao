package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bean.taikhoanbean;

public class dangnhapdao {
	public ArrayList<taikhoanbean> gettaikhoan(){
		ArrayList<taikhoanbean> ds = new ArrayList<taikhoanbean>();
		try {
			//B1: Ket noi vao csdl QlSach
			ketNoi kn = new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql ="select*from DangNhap";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//B3 : Duyet rs de luu vao ds
			while (rs.next()) {
				String tenDangNhap = rs.getString("TenDangNhap"); 
				String matKhau = rs.getString("MatKhau");
				int quyen = rs.getInt("Quyen");
				ds.add(new taikhoanbean(tenDangNhap, matKhau, quyen));
			}
			//b4: Dong cac doi tuong
			rs.close();
			kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
}

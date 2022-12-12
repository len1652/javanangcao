package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.dangnhapadminbean;
import bean.taikhoanbean;

public class dangnhapadmindao {
	public dangnhapadminbean ktdn(String tendn, String pass) {
		try {
			ketNoi kn= new ketNoi();
			kn.Ketnoi();;
			String sql="select * from DangNhap where TenDangNhap=? and MatKhau=?";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			cmd.setString(1, tendn);
			cmd.setString(2, pass);
			ResultSet rs= cmd.executeQuery();
			dangnhapadminbean dn= null;
			if(rs.next()) {//Dang nhap thanh cong
				 String TenDangNhap=rs.getString("TenDangNhap");
				 String MatKhau=rs.getString("MatKhau");;
				 boolean Quyen=rs.getBoolean("Quyen");
				 dn=new dangnhapadminbean(TenDangNhap, MatKhau, Quyen);
			}
			return dn;
		} catch (Exception e) {
			e.printStackTrace();return null;
		}

	}
}

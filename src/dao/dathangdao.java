package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.dangnhapadminbean;
import bean.dathangbean;
import bean.giohangbean;
import bean.sachbean;

public class dathangdao {
	public ArrayList<dathangbean> getdathang(){
		ArrayList<dathangbean> ds = new ArrayList<dathangbean>();
		try {
			//B1: Ket noi vao csdl QlSach
			ketNoi kn = new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql ="select*from khachhang_chitiethoadon";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//B3 : Duyet rs de luu vao ds
			while (rs.next()) {
				long maChiTietHD = rs.getLong("MaChiTietHD");
				String maSach = rs.getString("MaSach");
				int soLuongMua =rs.getInt("SoLuongMua");
				long maHoaDon= rs.getLong("MaHoaDon");
				long makh= rs.getLong("makh");
				boolean damua = rs.getBoolean("damua");
				String tensach= rs.getString("tensach");
				String anh=rs.getString("anh");
				ds.add(new dathangbean(maChiTietHD, maSach, soLuongMua, maHoaDon, makh, damua, tensach, anh));
			}
			//b4: Dong cac doi tuong
			rs.close();
			kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	public void thanhtoan(long mahd) {
		
	}
	public void taohoadon(long tk) {
		try {
			ketNoi kn= new ketNoi();
			kn.Ketnoi();
			String sql="INSERT INTO HoaDon VALUES (?,GETDATE(),0)";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			cmd.setLong(1, tk);
			ResultSet rs= cmd.executeQuery();
			rs.close();
			kn.cn.close();
			
		} catch (Exception e) {
			e.printStackTrace();return;
		}
	}
	public long hoadonmoinhat() {
		try {
			//B1: Ket noi vao csdl QlSach
			ketNoi kn = new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql ="SELECT TOP 1 * FROM HoaDon ORDER BY MaHoaDon DESC";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			long mahd =0;
			//B3 : Duyet rs de luu vao ds
			while (rs.next()) {
				mahd = rs.getLong("MaHoaDon");
			}
			//b4: Dong cac doi tuong
			rs.close();
			kn.cn.close();
			return mahd;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public void them1chitiethd(String masach, int soluong, long mahoadon) {
		try {
			ketNoi kn= new ketNoi();
			kn.Ketnoi();
			String sql="INSERT INTO ChiTietHoaDon VALUES (?,?,?)";
			PreparedStatement cmd= kn.cn.prepareStatement(sql);
			cmd.setString(1, masach);
			cmd.setInt(2, soluong);
			cmd.setLong(3, mahoadon);
			
			ResultSet rs= cmd.executeQuery();
			rs.close();
		
			
			kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void datmua (ArrayList<giohangbean> gh,long tk) {
		try {
			dathangdao dao = new dathangdao();
			dao.taohoadon(tk);
			long mahd = dao.hoadonmoinhat();
			for (int i = 0 ; i<gh.size();i++) {
				dao.them1chitiethd(gh.get(i).getMasach(), (int) gh.get(i).getSoluong(), mahd);
				System.out.println(gh.size()+" sizeeeeeeeeeeeeeee");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

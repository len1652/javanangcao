package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;


import bean.xacnhanBean2;
import bean.xacnhanbean;

public class xacnhandao {
	public ArrayList<xacnhanbean> getXacNhan(int fl) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			
			//B2: lay du lieu ve
			String sql="select DISTINCT * from ViewXacNhan where damua = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,fl);
			ResultSet rs = cmd.executeQuery();
			//B3: Duyet rs de luu vao arraylist
			ArrayList<xacnhanbean> ls = new ArrayList<xacnhanbean>();
			while(rs.next()) {
				long maChiTietHD = rs.getLong("MaChiTietHD"); 
				String hoten = rs.getString("hoten"); 
				String tensach = rs.getString("tensach"); 
				Date ngayMua = rs.getDate("NgayMua"); 
				int soLuongMua = rs.getInt("SoLuongMua"); 
				int gia = rs.getInt("gia"); 
				int thanhTien = rs.getInt("ThanhTien"); 
				boolean damua = rs.getBoolean("damua"); 
				
				ls.add(new xacnhanbean(maChiTietHD, hoten, tensach, ngayMua, soLuongMua, gia, thanhTien, damua));
			}
			//B4: Dong cac doi tuong
			rs.close(); kn.cn.close();
			return ls;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public ArrayList<xacnhanBean2> getXacNhan2(int fl) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			
			//B2: lay du lieu ve
			String sql="select hoadon.NgayMua, KhachHang.makh, KhachHang.hoten, hoadon.MaHoaDon, COUNT(ChiTietHoaDon.MaChiTietHD) as 'sl', SUM(sach.gia*ChiTietHoaDon.SoLuongMua) as 'tt'\r\n"
					+ "from KhachHang inner join hoadon on KhachHang.makh = hoadon.makh\r\n"
					+ "	inner join ChiTietHoaDon on hoadon.MaHoaDon = ChiTietHoaDon.MaHoaDon\r\n"
					+ "	inner join sach on ChiTietHoaDon.MaSach = sach.masach\r\n"
					+ "where damua = ? \r\n"
					+ "group by hoadon.NgayMua, KhachHang.makh, KhachHang.hoten, hoadon.MaHoaDon";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,fl);
			ResultSet rs = cmd.executeQuery();
			//B3: Duyet rs de luu vao arraylist
			ArrayList<xacnhanBean2> ls = new ArrayList<xacnhanBean2>();
			while(rs.next()) {
				Date ngayMua = rs.getDate("NgayMua"); 
				int makh = rs.getInt("makh");
				String hoten = rs.getString("hoten"); 
				int maHoaDon = rs.getInt("MaHoaDon");
				int sl = rs.getInt("sl");
				long tt = rs.getLong("tt");
				
				ls.add(new xacnhanBean2(ngayMua, makh, hoten, maHoaDon, sl, tt));
			}
			//B4: Dong cac doi tuong
			rs.close(); kn.cn.close();
			return ls;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	} 
	
	public boolean thanhtoan_cthd(int mhd) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			
			//B2: update du lieu 
			String sql="update ChiTietHoaDon set damua = 1 where MaChiTietHD = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,mhd);
			cmd.executeUpdate();
			kn.cn.close();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	} 
	
	public boolean thanhtoan_hd(long mhd) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			
			//B2: update du lieu 
			String sql="update HoaDon set damua = 1 where MaHoaDon = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setLong(1,mhd);
			cmd.executeUpdate();
			kn.cn.close();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	} 
}

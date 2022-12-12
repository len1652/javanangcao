package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.addsachBean;
import bean.sachbean;


public class sachdao {
	public ArrayList<sachbean> getsach(){
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		try {
			//B1: Ket noi vao csdl QlSach
			ketNoi kn = new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql ="select*from sach";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//B3 : Duyet rs de luu vao ds
			while (rs.next()) {
				String masach = rs.getString("masach");
				String tensach = rs.getString("tensach");
				String tacgia= rs.getString("tacgia");
				int soluong = rs.getInt("soluong");
				int gia = rs.getInt("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				ds.add(new sachbean(masach, tensach, tacgia, soluong, gia, anh, maloai));
			}
			//b4: Dong cac doi tuong
			rs.close();
			kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	public ArrayList<addsachBean> getsachadmin(){
		ArrayList<addsachBean> ds = new ArrayList<addsachBean>();		
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql="select * from sach";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//B3: Duyet rs de luu vao ds
			while(rs.next()) {
				//Lay ve ma loai va ten loai
				String masach = rs.getString("masach"); 
				String tensach = rs.getString("tensach"); 
				String tacgia = rs.getString("tacgia");  
				int soluong = rs.getInt("soluong"); 
				int gia = rs.getInt("gia"); 
				String anh = rs.getString("anh"); 
				String maloai = rs.getString("maloai"); 
				Date NgayNhap = rs.getDate("NgayNhap");
				String sotap = rs.getString("sotap");
				
				ds.add(new addsachBean(masach, tensach, tacgia, soluong, gia, anh, maloai, sotap, NgayNhap));
			}
			//B4: Dong cac doi tuong
			rs.close(); kn.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void themsach(String ms, String ts,String tg,String sl, String st,String gia,String date, String ml, String anh) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql="insert into sach values (?,?,?,?,?,?,?,GETDATE(),?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, ms);
			cmd.setString(2, ts);
			cmd.setInt(3, Integer.parseInt(sl));
			cmd.setInt(4, Integer.parseInt(gia));
			cmd.setString(5, ml);
			cmd.setString(6, st);
			cmd.setString(7, anh);
			cmd.setString(8, tg);
		
			cmd.executeUpdate();
			kn.cn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void suasach(String ms, String ts,String tg,String sl, String st,String gia,String date, String ml, String anh) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql="update sach set tensach = ?, soluong = ? , gia = ?, maloai = ?, sotap = ?, anh = ?, NgayNhap = GETDATE(), tacgia = ? where masach = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setString(1, ts);
			cmd.setInt(2, Integer.parseInt(sl));
			cmd.setInt(3, Integer.parseInt(gia));
			cmd.setString(4, ml);
			cmd.setString(5, st);
			cmd.setString(6, anh);
			cmd.setString(7, tg);
			cmd.setString(8, ms);
			cmd.executeUpdate();
			kn.cn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void Xoasach(String ms) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql="delete from sach where masach = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, ms);
			cmd.executeUpdate();
			kn.cn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

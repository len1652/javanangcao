package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.editloaiBean;
import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai(){
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		try {
			//B1: Ket noi vao csdl QlSach
			ketNoi kn = new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql ="select*from loai";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//B3 : Duyet rs de luu vao ds
			while (rs.next()) {
				String maloai = rs.getString("maloai");
				String tenloai = rs.getString("tenloai");
				ds.add(new loaibean(maloai, tenloai));
			}
			//b4: Dong cac doi tuong
			rs.close();
			kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	public ArrayList<editloaiBean> geteditloai() {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql="select loai.maloai, loai.tenloai, COUNT(sach.masach) as 'sl'\r\n"
					+ "from loai left join sach on loai.maloai = sach.maloai\r\n"
					+ "group by loai.maloai, loai.tenloai";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//B3: Duyet rs de luu vao ds
			ArrayList<editloaiBean> ds= new ArrayList<editloaiBean>();
			while(rs.next()) {
				//Lay ve ma loai va ten loai
				String maloai=rs.getString("maloai");
				String tenloai=rs.getString("tenloai");
				int sl = rs.getInt("sl");
				ds.add(new editloaiBean(maloai, tenloai, sl));
			}
			//B4: Dong cac doi tuong
			rs.close(); kn.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return null;
	}
	public Boolean addloai(String mls, String tls) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql="insert into loai values (?, ?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, mls);
			cmd.setString(2, tls);
			cmd.executeUpdate();
			kn.cn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return false;
	}
	public Boolean deleteloai(String mls) {
		try {
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			//B2: lay du lieu ve
			String sql="delete from loai where maloai = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, mls);
			cmd.executeUpdate();kn.cn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return false;
	}
	
	
}

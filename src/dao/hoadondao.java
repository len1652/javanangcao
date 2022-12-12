package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.dathangbean;
import bean.giohangbean;

public class hoadondao {
	public int taohoadon(ArrayList<giohangbean> ds,int id) {
		try {
			
			
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			
			//B2: táº¡o hÃ³a Ä‘Æ¡n
			String sql="insert into hoadon values (?,GETDATE()); ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,id);
			cmd.executeUpdate();
			
			//B3: láº¥y mÃ£ hÃ³a Ä‘Æ¡n má»›i táº¡o vá»�
			sql="SELECT @@IDENTITY AS 'id';";
			cmd = kn.cn.prepareStatement(sql);	
			ResultSet rs = cmd.executeQuery();
			int mhd = 0;
			while(rs.next()) {
				mhd = rs.getInt("id");
			}
			
			//B4: ThÃªm tá»«ng cuá»‘n sÃ¡ch vÃ o chi tiáº¿t hÃ³a Ä‘Æ¡n
			sql="insert into ChiTietHoaDon values (?,?,?,0);";
			cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(3,mhd);
			for (giohangbean s : ds) {
				cmd.setString(1,s.getMasach());
				cmd.setLong(2,s.getSoluong());
				cmd.executeUpdate();
			}

			rs.close(); kn.cn.close();
			return mhd;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public void thanhtoan(int mhd) {
		try {
			
			
			//B1: ket noi vao csdl QlSach
			ketNoi kn=new ketNoi();
			kn.Ketnoi();
			
			//B2: cáº­p nháº­t láº¡i chi tiáº¿t hÃ³a Ä‘Æ¡n
			String sql="UPDATE ChiTietHoaDon SET damua = 1  WHERE MaHoaDon = ?; ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,mhd);
			cmd.executeUpdate();
			
			kn.cn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

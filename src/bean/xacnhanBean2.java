package bean;

import java.util.Date;

public class xacnhanBean2 {
	private Date NgayMua;
	private int makh;
	private String hoten;
	private int MaHoaDon;
	private int sl;
	private long tt;
	public xacnhanBean2() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public xacnhanBean2(Date ngayMua, int makh, String hoten, int maHoaDon, int sl, long tt) {
		super();
		NgayMua = ngayMua;
		this.makh = makh;
		this.hoten = hoten;
		MaHoaDon = maHoaDon;
		this.sl = sl;
		this.tt = tt;
	}

	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	public long getTt() {
		return tt;
	}
	public void setTt(long tt) {
		this.tt = tt;
	}
	
	
}

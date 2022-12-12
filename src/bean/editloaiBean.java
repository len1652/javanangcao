package bean;

public class editloaiBean {
	private String maloai;
	private String tenloai;
	private int sl;
	public editloaiBean(String maloai, String tenloai, int sl) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
		this.sl = sl;
	}
	public editloaiBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	
}

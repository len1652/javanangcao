package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketNoi {
	Connection cn;
	
	public void Ketnoi() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("Xong b1");
			
			String url = "jdbc:sqlserver://ADMIN:1433;databaseName=QlSach;user=sa; password=123";
			cn = DriverManager.getConnection(url);
			System.out.println("xong b2");
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ketNoi kn = new ketNoi();
		kn.Ketnoi();

	}

}

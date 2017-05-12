package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseConnection {
	public static Connection conn;
	public static Statement stmt = null;

	public static Connection getConnection() {
		if (conn != null)
			return conn;
		String url = "jdbc:sqlserver://nhom011-2017.database.windows.net:1433;"
				+ "database=nhom011-2017;user=nhom011-2017@nhom011-2017;password=1683nnNN;"
				+ "encrypt=true;trustServerCertificate=false;"
				+ "hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url);
		} catch (Exception ex) {
			ex.printStackTrace();
			System.err.println(">> " + ex.getMessage());
		}
		return conn;
	}
	public static void main(String[] args) {
		Connection databaseConnection = DatabaseConnection.getConnection();
		System.out.println(databaseConnection);
		if (databaseConnection != null)
			System.out.println("ket noi");
	}
}

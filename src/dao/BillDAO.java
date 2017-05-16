package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Bill;
import model.DatabaseConnection;

public class BillDAO {
	private Connection conn;
	public BillDAO() {
		conn = DatabaseConnection.getConnection();
	}
	public void insert(Object obj) {
		Bill c = (Bill)obj;
		try {
			String sql = "insert into bill(billId, userName, totalBill, address, payment, dateTime) values (?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setNString(1, c.getBillId());
			preparedStatement.setNString(2, c.getUserName());
			preparedStatement.setDouble(3, c.getTotalBill());
			preparedStatement.setNString(4, c.getAddress());
			preparedStatement.setNString(5, c.getPayment());
			preparedStatement.setTimestamp(6, c.getDateTime());
			
			preparedStatement.executeUpdate();
			System.out.println("Insert bill successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

}

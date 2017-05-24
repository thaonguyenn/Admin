package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.CheckedBill;
import model.DatabaseConnection;

public class CheckedDAO {
	private Connection conn;
	public CheckedDAO() {
		conn = DatabaseConnection.getConnection();
	}		
	
	public void insert(Object obj) {
		CheckedBill b = (CheckedBill)obj;
		try {
			String sql = "insert into checked(billId) values (?)";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setNString(1, b.getBillId());
			
			preparedStatement.executeUpdate();
			System.out.println("Insert cbill successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public void delete(String id) {
		try {
			String sql = "delete from checked where billId like N'"+id+"'";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			preparedStatement.executeUpdate();
			System.out.println("Delete cbill successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public List<CheckedBill> getAllBills(){
		List<CheckedBill> bills = new ArrayList<CheckedBill>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from checked");
			while(resultSet.next()){
				CheckedBill bill = new CheckedBill();
				bill.setBillId(resultSet.getString("billId"));
				bills.add(bill);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return bills;
	}
}

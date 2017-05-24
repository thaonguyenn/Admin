package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.DatabaseConnection;
import model.UncheckedBill;

public class UncheckedDAO {
	private Connection conn;
	public UncheckedDAO() {
		conn = DatabaseConnection.getConnection();
	}		
	
	public void insert(Object obj) {
		UncheckedBill b = (UncheckedBill)obj;
		try {
			String sql = "insert into unchecked(billId) values (?)";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setNString(1, b.getBillId());
			
			preparedStatement.executeUpdate();
			System.out.println("Insert ubill successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public void delete(String id) {
		try {
			String sql = "delete from unchecked where billId like N'"+id+"'";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			preparedStatement.executeUpdate();
			System.out.println("Delete ubill successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public List<UncheckedBill> getAllBills(){
		List<UncheckedBill> bills = new ArrayList<UncheckedBill>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from unchecked");
			while(resultSet.next()){
				UncheckedBill bill = new UncheckedBill();
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

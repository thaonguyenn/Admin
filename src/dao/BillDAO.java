package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Bill;
import model.BillDetail;
import model.Category;
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
	public List<Bill> getAllBills(){
		List<Bill> bills = new ArrayList<Bill>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from bill");
			while(resultSet.next()){
				Bill bill = new Bill();
				bill.setBillId(resultSet.getString("billId"));
				bill.setUserName(resultSet.getString("userName"));
				bill.setTotalBill(resultSet.getDouble("totalBill"));
				bill.setAddress(resultSet.getString("address"));
				bill.setPayment(resultSet.getString("payment"));
				bill.setDateTime(resultSet.getTimestamp("dateTime"));
				
				bills.add(bill);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return bills;
	}
	public Bill getBillById(String id){
		Bill bill = new Bill();
		try{
			String query = "select * from bill where billId like N'"+id+"'";
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			while(resultSet.next()){
				bill.setBillId(resultSet.getString("billId"));
				bill.setUserName(resultSet.getString("userName"));
				bill.setTotalBill(resultSet.getDouble("totalBill"));
				bill.setAddress(resultSet.getString("address"));
				bill.setPayment(resultSet.getString("payment"));
				bill.setDateTime(resultSet.getTimestamp("dateTime"));
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return bill;
	}
}

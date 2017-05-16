package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.BillDetail;
import model.Category;
import model.DatabaseConnection;

public class BillDetailDAO {
	private Connection conn;
	public BillDetailDAO() {
		conn = DatabaseConnection.getConnection();
	}
	public void insert(Object obj) {
		BillDetail c = (BillDetail)obj;
		try {
			String sql = "insert into billDetail(billDetailId, billId, productId, price, sale, quantity) values (?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setNString(1, c.getBillDetailId());
			preparedStatement.setNString(2, c.getBillId());
			preparedStatement.setNString(3, c.getProductId());
			preparedStatement.setDouble(4, c.getPrice());
			preparedStatement.setDouble(5, c.getSale());
			preparedStatement.setInt(6, c.getQuantity());
			
			preparedStatement.executeUpdate();
			System.out.println("Insert billDetail successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public List<BillDetail> getBillDetailByCond(String cond){
		List<BillDetail> listBillDetail = new ArrayList<BillDetail>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from billDetail where billId like N'%"+cond+"%'");
			while(resultSet.next()){
				BillDetail billDetail = new BillDetail();
				billDetail.setBillDetailId(resultSet.getString("billDetailId"));
				billDetail.setBillId(resultSet.getString("billId"));
				billDetail.setProductId(resultSet.getString("productId"));
				billDetail.setPrice(resultSet.getDouble("price"));
				billDetail.setSale(resultSet.getDouble("sale"));
				billDetail.setQuantity(resultSet.getInt("quantity"));
				
				listBillDetail.add(billDetail);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return listBillDetail;
	}
	public List<BillDetail> getAllBills(){
		List<BillDetail> bills = new ArrayList<BillDetail>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from billDetail");
			while(resultSet.next()){
				BillDetail billDetail = new BillDetail();
				billDetail.setBillDetailId(resultSet.getString("billDetailId"));
				billDetail.setBillId(resultSet.getString("billId"));
				billDetail.setProductId(resultSet.getString("productId"));
				billDetail.setPrice(resultSet.getDouble("price"));
				billDetail.setSale(resultSet.getDouble("sale"));
				billDetail.setQuantity(resultSet.getInt("quantity"));
				
				bills.add(billDetail);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return bills;
	}
}

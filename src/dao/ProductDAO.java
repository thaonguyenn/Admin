package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.DatabaseConnection;
import model.Product;

public class ProductDAO implements ObjectDAO{
private Connection conn;
public List<Product> cake;
public List<Product> candy;
public ProductDAO() {
	conn = DatabaseConnection.getConnection();
	cake = new ArrayList<Product>();
	candy = new ArrayList<Product>();
}
	@Override
	public void add(Object obj) {
		Product p = (Product)obj;
		try {
			String sql = "insert into dbo.product2(code, name, price, description, sale,image,category) values (?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setNString(1, p.getCode());
			preparedStatement.setNString(2, p.getName());
			preparedStatement.setDouble(3, p.getPrice());
			preparedStatement.setNString(4, p.getDescription());
			preparedStatement.setDouble(5, p.getSale());
			preparedStatement.setNString(6, p.getImage());
			preparedStatement.setNString(7, p.getCategory());
			
			
			preparedStatement.executeUpdate();
			if (p.getCode().equalsIgnoreCase("cake"))
				cake.add(p);
			else if (p.getCode().equalsIgnoreCase("candy"))
				candy.add(p);
			System.out.println("Insert product successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Object obj) {
		Product p = (Product)obj;
		delete(p.getId());
		add(obj);
	}

	@Override
	public void delete(int id) {
		try {
			String sql = "delete from dbo.product2 where id="+id;
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			preparedStatement.executeUpdate();
			System.out.println("Delete product successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
	}
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from product2");
			while(resultSet.next()){
				Product product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setCode(resultSet.getString("code"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getDouble("price"));
				product.setSale(resultSet.getDouble("sale"));
				product.setImage(resultSet.getString("image"));
				product.setCategory(resultSet.getString("category"));
				
				products.add(product);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return products;
	}
	public Product getProductById(int id){
		Product product = new Product();
		try{
			String query = "select * from product2 where id =?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				product.setId(resultSet.getInt("id"));
				product.setCode(resultSet.getString("code"));
				product.setName(resultSet.getString("name"));
				product.setPrice(Double.parseDouble(resultSet.getString("price")));
				product.setSale(Double.parseDouble(resultSet.getString("sale")));
				product.setDescription(resultSet.getString("description"));
				product.setImage(resultSet.getString("image"));
				product.setCategory(resultSet.getString("category"));
			}
			resultSet.close();
			preparedStatement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return product;
	}
	public List<Product> getProductByCond(String cond){
		List<Product> products = new ArrayList<Product>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from product2 where id like N'%"+cond+"%' or name like N'%"+cond+"%'");
			while(resultSet.next()){
				Product product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setCode(resultSet.getString("code"));
				product.setName(resultSet.getString("name"));
				product.setPrice(resultSet.getDouble("price"));
				product.setSale(resultSet.getDouble("sale"));
				product.setDescription(resultSet.getString("description"));
				product.setImage(resultSet.getString("image"));
				product.setCategory(resultSet.getString("category"));
				products.add(product);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return products;
	}
}

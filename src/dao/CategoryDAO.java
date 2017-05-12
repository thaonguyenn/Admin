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

public class CategoryDAO implements ObjectDAO{
	private Connection conn;
	public CategoryDAO() {
		conn = DatabaseConnection.getConnection();
	}
	@Override
	public void add(Object obj) {
		Category c = (Category)obj;
		try {
			String sql = "insert into dbo.category2(id, name, link) values (?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, c.getId());
			preparedStatement.setNString(2, c.getName());
			preparedStatement.setNString(3, c.getLink());
			
			preparedStatement.executeUpdate();
			System.out.println("Insert category successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public void update(Object obj) {
		Category c = (Category)obj;
		delete(c.getId());
		add(obj);
	}

	@Override
	public void delete(int id) {
		try {
			String sql = "delete from dbo.category2 where id="+id;
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			preparedStatement.executeUpdate();
			System.out.println("Delete category successfully !");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public List<Category> getAllCategories(){
		List<Category> categories = new ArrayList<Category>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from dbo.category2");
			while(resultSet.next()){
				Category category = new Category();
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("name"));
				category.setLink(resultSet.getString("link"));
				categories.add(category);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return categories;
	}
	public Category getCategoryById(int id){
		Category category = new Category();
		try{
			String query = "select * from category2 where id =?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("name"));
				category.setLink(resultSet.getString("link"));
			}
			resultSet.close();
			preparedStatement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return category;
	}
	public List<Category> getCategoryByCond(String cond){
		List<Category> categories = new ArrayList<Category>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from category2 where id like N'%"+cond+"%' or name like N'%"+cond+"%'");
			while(resultSet.next()){
				Category category = new Category();
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("name"));
				category.setLink(resultSet.getString("link"));
				categories.add(category);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return categories;
	}
}

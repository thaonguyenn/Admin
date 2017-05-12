package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.DatabaseConnection;
import model.Product;
import model.User;

public class UserDAO {
	private Connection conn;
	private ResultSet rs = null;
	private Statement stmt = null;

	public UserDAO() {
		conn = DatabaseConnection.getConnection();
	}
	public User login(User user) {
		String username = user.getUserName();
		String password = user.getPassword();
		String searchQuery = "select * from users where userName='" + username + "'AND password='" + password + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(searchQuery);
			while (rs.next()) {
				user.setValid(true);
				user.setFirstName(rs.getString("FirstName"));
				user.setLastName(rs.getString("LastName"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public void addUser(User user) {
		try {
		String sql = "insert into dbo.users (userName, password, firstName, lastName, phone, email) values (?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setNString(3, user.getFirstName());
			preparedStatement.setNString(4, user.getLastName());
			preparedStatement.setString(5, user.getPhone());
			preparedStatement.setString(6, user.getEmail());
			preparedStatement.executeUpdate();
			System.out.println("Add user successfully !");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<User> getAllUsers(){
		List<User> users = new ArrayList<User>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from users");
			while(resultSet.next()){
				User user = new User();
				user.setUserName(resultSet.getString("userName"));
				user.setPassword(resultSet.getString("password"));
				user.setFirstName(resultSet.getString("firstName"));
				user.setLastName(resultSet.getString("lastName"));
				user.setPhone(resultSet.getString("phone"));
				user.setEmail(resultSet.getString("email"));
				
				users.add(user);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return users;
	}
	public List<User> getUsersByCond(String cond){
		List<User> users = new ArrayList<User>();
		try{
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from users where userName like N'%"+cond+"%' or firstName like N'%"+cond+"%' or lastName like N'%"+cond+"%'");
			while(resultSet.next()){
				User user = new User();
				user.setUserName(resultSet.getString("userName"));
				user.setPassword(resultSet.getString("password"));
				user.setFirstName(resultSet.getString("firstName"));
				user.setLastName(resultSet.getString("lastName"));
				user.setPhone(resultSet.getString("phone"));
				user.setEmail(resultSet.getString("email"));
				
				users.add(user);
			}
			resultSet.close();
			statement.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return users;
	}
	public static void main(String[] args) {
		User user = new User();
		user.setUserName("n");
		user.setPassword("nguyen");
		user.setEmail("mail");
		user.setFirstName("n");
		user.setLastName("n");
		user.setPhone("p");
		UserDAO ud = new UserDAO();
		user = ud.login(user);
		ud.addUser(user);
	}
}

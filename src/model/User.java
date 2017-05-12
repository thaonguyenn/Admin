package model;

import java.util.ArrayList;
import java.util.List;

public class User {
private String userName;
private String password;
private String firstName;
private String lastName;
private List<Product> cart;
private String phone;
private String email;
private boolean isValid;
public User(){
	isValid = false;
	cart = new ArrayList<Product>();
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public boolean isValid() {
	return isValid;
}
public void setValid(boolean isValid) {
	this.isValid = isValid;
}
public void addProduct(Product product){
	this.cart.add(product);
}
public List<Product> getCart() {
	return cart;
}
public void setCart(List<Product> cart) {
	this.cart = cart;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
}

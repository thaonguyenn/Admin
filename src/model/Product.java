package model;

public class Product {
private int id;
private String code;
private String name;
private double price;
private String description;
private double sale;
private String image;
private String category;
public Product(){
	super();
}
public Product(int id,String code, String name, double price, String description, double sale,String image,String category) {
	super();
	this.id = id;
	this.name = name;
	this.code = code;
	this.price = price;
	this.sale = sale;
	this.description=description;
	this.image = image;
	this.category = category;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public double getSale() {
	return sale;
}
public void setSale(double sale) {
	this.sale = sale;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}

}

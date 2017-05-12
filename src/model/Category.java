package model;

import java.util.List;

public class Category {
	private int id;
	private String name;
	private String link;
	private List<Product> listProduct;
	public Category(){
		super();
	}
	public Category(int id) {
		super();
		this.id = id;
}
	public Category(int id, String name) {
		super();
		this.id = id;
		this.name = name;
}
	public Category(int id, String name, List<Product> listProduct) {
		super();
		this.id = id;
		this.name = name;
		this.listProduct = listProduct;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Product> getListProduct() {
		return listProduct;
	}
	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
}
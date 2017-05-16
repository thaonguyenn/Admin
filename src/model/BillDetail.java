package model;

public class BillDetail {
private String billDetailId;
private String billId;
private String productId;
private double price;
private double sale;
private int quantity;
public BillDetail(){}
public BillDetail(String billDetailId, String billId, String productId, double price,double sale, int quantity) {
	super();
	this.billDetailId = billDetailId;
	this.billId = billId;
	this.productId = productId;
	this.price = price;
	this.sale = sale;
	this.quantity = quantity;
}
public String getBillDetailId() {
	return billDetailId;
}
public void setBillDetailId(String billDetailId) {
	this.billDetailId = billDetailId;
}
public String getBillId() {
	return billId;
}
public void setBillId(String billId) {
	this.billId = billId;
}
public String getProductId() {
	return productId;
}
public void setProductId(String productId) {
	this.productId = productId;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public double getSale() {
	return sale;
}
public void setSale(double sale) {
	this.sale = sale;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}

}

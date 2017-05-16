package model;

import java.sql.Timestamp;
public class Bill {
private String billId;
private String userName;
private double totalBill;
private String address;
private String payment;
private Timestamp dateTime;
public Bill(String billId, String userName, double totalBill, String address, String payment, Timestamp dateTime) {
	super();
	this.billId = billId;
	this.userName = userName;
	this.totalBill = totalBill;
	this.address = address;
	this.payment = payment;
	this.dateTime = dateTime;
}
public String getBillId() {
	return billId;
}
public void setBillId(String billId) {
	this.billId = billId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public double getTotalBill() {
	return totalBill;
}
public void setTotalBill(double totalBill) {
	this.totalBill = totalBill;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getPayment() {
	return payment;
}
public void setPayment(String payment) {
	this.payment = payment;
}
public Timestamp getDateTime() {
	return dateTime;
}
public void setDateTime(Timestamp dateTime) {
	this.dateTime = dateTime;
}


}

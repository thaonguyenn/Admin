package model;

public class CheckedBill {
	private String billId;
	
	public CheckedBill() {
		super();
	}

	public CheckedBill(String billId) {
		super();
		this.billId = billId;
	}

	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

}

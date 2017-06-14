package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BillDAO;
import dao.BillDetailDAO;
import dao.ProductDAO;
import model.Bill;
import model.BillDetail;
import model.Product;
import model.Value;

/**
 * Servlet implementation class StatisticWareHouse
 */
@WebServlet("/StatisticWareHouse")
public class StatisticWareHouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BillDAO billDAO;
	BillDetailDAO billDetailDAO;
	ProductDAO pDAO;
	List<Bill> statisticBill;
	List<BillDetail> statisticBillDetail;
	List<BillDetail> cake;
	List<BillDetail> candy;
	List<BillDetail> drink;
	List<BillDetail> some;
	int quantityCake;
	int quantityCandy;
	int quantityDrink;
	int quantitySome;
	List<Value> cakeDetail;
	List<Value> candyDetail;
	List<Value> drinkDetail;
	List<Value> someDetail;
	List<Product> isNotBought;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StatisticWareHouse() {
		super();
		billDAO = new BillDAO();
		billDetailDAO = new BillDetailDAO();
		pDAO = new ProductDAO();
		statisticBill = new ArrayList<Bill>();
		statisticBillDetail = new ArrayList<BillDetail>();
		cake = new ArrayList<BillDetail>();
		candy = new ArrayList<BillDetail>();
		drink = new ArrayList<BillDetail>();
		some = new ArrayList<BillDetail>();
		cakeDetail = new ArrayList<Value>();
		candyDetail = new ArrayList<Value>();
		drinkDetail = new ArrayList<Value>();
		someDetail = new ArrayList<Value>();
		isNotBought = new ArrayList<Product>();
		quantityCake = 0;
		quantityCandy = 0;
		quantityDrink = 0;
		quantitySome = 0;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		statisticBill = new ArrayList<Bill>();
		statisticBillDetail = new ArrayList<BillDetail>();
		cake = new ArrayList<BillDetail>();
		candy = new ArrayList<BillDetail>();
		drink = new ArrayList<BillDetail>();
		some = new ArrayList<BillDetail>();
		cakeDetail = new ArrayList<Value>();
		candyDetail = new ArrayList<Value>();
		drinkDetail = new ArrayList<Value>();
		someDetail = new ArrayList<Value>();
		isNotBought = new ArrayList<Product>();
		quantityCake = 0;
		quantityCandy = 0;
		quantityDrink = 0;
		quantitySome = 0;
		if (request.getParameter("statistic") != null) {
			String statistic = request.getParameter("statistic");
			if (statistic.equalsIgnoreCase("date"))
				request.setAttribute("statistic", "date");

			if (statistic.equalsIgnoreCase("month"))
				request.setAttribute("statistic", "month");

			if (statistic.equalsIgnoreCase("precious"))
				request.setAttribute("statistic", "precious");

			if (statistic.equalsIgnoreCase("year"))
				request.setAttribute("statistic", "year");

			RequestDispatcher view = request.getRequestDispatcher("/Chart/StatisticWareHouse.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// statistic bill
		int tmp =0;
		statisticBill = new ArrayList<Bill>();
		statisticBillDetail = new ArrayList<BillDetail>();
		cake = new ArrayList<BillDetail>();
		candy = new ArrayList<BillDetail>();
		drink = new ArrayList<BillDetail>();
		some = new ArrayList<BillDetail>();
		cakeDetail = new ArrayList<Value>();
		candyDetail = new ArrayList<Value>();
		drinkDetail = new ArrayList<Value>();
		someDetail = new ArrayList<Value>();
		isNotBought = new ArrayList<Product>();
		quantityCake = 0;
		quantityCandy = 0;
		quantityDrink = 0;
		quantitySome = 0;
		if (request.getParameter("b1") != null) {
			if (request.getParameter("date") != null) {
				for (Bill bill : billDAO.getAllBills())
					if (bill.getDateTime().getDate() == Integer.parseInt(request.getParameter("date")))
						statisticBill.add(bill);
			}
		}
		if(request.getParameter("b2")!=null){
			int d1 = Integer.parseInt(request.getParameter("d1"));
			int m1 = Integer.parseInt(request.getParameter("m1"));
			int y1 = Integer.parseInt(request.getParameter("y1"));
			int d2 = Integer.parseInt(request.getParameter("d2"));
			int m2 = Integer.parseInt(request.getParameter("m2"));
			int y2 = Integer.parseInt(request.getParameter("y2"));
			
			boolean test = false;//xem lai test
			if(d1>30 && m1==4)
				test = true;
			if(d1>30 && m1==6)
				test = true;
			if(d1>30 && m1==9)
				test = true;
			if(d1>30 && m1==11)
				test = true;
			if(y1==2016 || y1==2012 || y1==2008 || y1==2004 || y1==2000 && m1==2 && d1>29 )
				test = true;
			if(m1==2 && d1>28 && y1!=2016 && y1!=2012 && y1!=2008 && y1!=2004 && y1!=2000)
				test = true;
			if(d2>30 && m2==4)
				test = true;
			if(d2>30 && m2==6)
				test = true;
			if(d2>30 && m2==9)
				test = true;
			if(d2>30 && m2==11)
				test = true;
			if(y2==2016 || y2==2012 || y2==2008 || y2==2004 || y2==2000 && m2==2 && d2>29 )
				test = true;
			if(m2==2 && d2>28 && y2!=2016 && y2!=2012 && y2!=2008 && y2!=2004 && y2!=2000)
				test = true;
			if(y1>y2)
				test = true;
			if(y1==y2 && m1>m2)
				test=true;
			if(y1==y2 && m1==m2 && d1>d2 )
				test=true;
			
			if(test==true){
				tmp+=1;
				request.setAttribute("error", "Dữ liệu ngày tháng năm chưa đúng, vui lòng chọn lại ngày !");
				RequestDispatcher view = request.getRequestDispatcher("/Chart/StatisticWareHouse.jsp");
				view.forward(request, response);
			}
			else{
				//khac nam
				if(y1!=y2 && y2==2017){
					for (Bill bill : billDAO.getAllBills())
						if (bill.getDateTime().getDate()>=1&&bill.getDateTime().getDate()<=d2&& bill.getDateTime().getMonth() + 1 >= 1&&bill.getDateTime().getMonth() + 1 <= m2&& bill.getDateTime().getYear()+1900==2017)
							statisticBill.add(bill);
				}
				if(y1!=y2 && y2<2017){
				}
				//giong nam 
				if(y1==y2 && y1<2017){
				}
				if(y1==y2 && y1==2017){
					//cung thang
					if(m1==m2){
						for (Bill bill : billDAO.getAllBills())
							if (bill.getDateTime().getDate()>=d1&&bill.getDateTime().getDate()<=d2&& bill.getDateTime().getMonth() + 1 == m1&& bill.getDateTime().getYear()+1900==y1)
								statisticBill.add(bill);
					}
					//khac thang
					if(m1!=m2 && m1!=5 && m1!=6 && m2!=5 && m2!=6){
					}
					if(m1!=m2 && m1==5 && m2==6){
						for (Bill bill : billDAO.getAllBills())
							if (bill.getDateTime().getDate()>=d1&&bill.getDateTime().getDate()<=31&& bill.getDateTime().getMonth() + 1 == 5&& bill.getDateTime().getYear()+1900==2017)
								statisticBill.add(bill);
						for (Bill bill : billDAO.getAllBills())
							if (bill.getDateTime().getDate()>=1&&bill.getDateTime().getDate()<=d2&& bill.getDateTime().getMonth() + 1 == 6&& bill.getDateTime().getYear()+1900==2017)
								statisticBill.add(bill);
					}
				}
			}
		}
		if (request.getParameter("month") != null) {
			for (Bill bill : billDAO.getAllBills())
				if (bill.getDateTime().getMonth() + 1 == Integer.parseInt(request.getParameter("month")))
					statisticBill.add(bill);
		}
		if (request.getParameter("precious") != null) {// xem lai thong ke theo
														// quy
			int previous = Integer.parseInt(request.getParameter("precious"));
			if (previous == 1)
				for (Bill bill : billDAO.getAllBills()) {
					if (bill.getDateTime().getMonth() + 1 == 1 || bill.getDateTime().getMonth() + 1 == 2
							|| bill.getDateTime().getMonth() + 1 == 3)
						statisticBill.add(bill);
				}
			if (previous == 2)
				for (Bill bill : billDAO.getAllBills())
					if (bill.getDateTime().getMonth() + 1 == 4 || bill.getDateTime().getMonth() + 1 == 5
							|| bill.getDateTime().getMonth() + 1 == 6)
						statisticBill.add(bill);
			if (previous == 3)
				for (Bill bill : billDAO.getAllBills())
					if (bill.getDateTime().getMonth() + 1 == 7 || bill.getDateTime().getMonth() + 1 == 8
							|| bill.getDateTime().getMonth() + 1 == 9)
						statisticBill.add(bill);
			if (previous == 4)
				for (Bill bill : billDAO.getAllBills())
					if (bill.getDateTime().getMonth() + 1 == 10 || bill.getDateTime().getMonth() + 1 == 11
							|| bill.getDateTime().getMonth() + 1 == 12)
						statisticBill.add(bill);

		}
		if (request.getParameter("year") != null) {
			for (Bill bill : billDAO.getAllBills()) {
				if (bill.getDateTime().getYear() + 1900 == Integer.parseInt(request.getParameter("year")))
					statisticBill.add(bill);
			}
		}
		// Lọc
		if (statisticBill.size() > 0) {
			for (Bill b : statisticBill)
				for (BillDetail bD : billDetailDAO.getAllBills())
					if (b.getBillId().equalsIgnoreCase(bD.getBillId()))
						statisticBillDetail.add(bD);
			for (BillDetail billDetail : statisticBillDetail) {
				if (billDetail.getProductId().substring(0, 3).equalsIgnoreCase("cak")) {
					quantityCake += billDetail.getQuantity();
					cake.add(billDetail);
				}
				if (billDetail.getProductId().substring(0, 3).equalsIgnoreCase("can")) {
					quantityCandy += billDetail.getQuantity();
					candy.add(billDetail);
				}
				if (billDetail.getProductId().substring(0, 3).equalsIgnoreCase("dri")) {
					quantityDrink += billDetail.getQuantity();
					drink.add(billDetail);
				}
				if (billDetail.getProductId().substring(0, 2).equalsIgnoreCase("st")) {
					quantitySome += billDetail.getQuantity();
					some.add(billDetail);
				}
			}
			ArrayList<Integer> index1 = new ArrayList<Integer>();
			for (int j = 0; j < cake.size(); j++) {
				if (index1.contains(j))
					continue;
				String name = cake.get(j).getProductId();
				int quantity = cake.get(j).getQuantity();
				for (int i = j + 1; i < cake.size(); i++) {
					if (cake.get(j).getProductId().equalsIgnoreCase(cake.get(i).getProductId())) {
						quantity += cake.get(i).getQuantity();
						index1.add(i);
					}
				}
				cakeDetail.add(new Value(name, quantity));
			}
			ArrayList<Integer> index2 = new ArrayList<Integer>();
			for (int j = 0; j < candy.size(); j++) {
				if (index2.contains(j))
					continue;
				String name = candy.get(j).getProductId();
				int quantity = candy.get(j).getQuantity();
				for (int i = j + 1; i < candy.size(); i++) {
					if (candy.get(j).getProductId().equalsIgnoreCase(candy.get(i).getProductId())) {
						quantity += candy.get(i).getQuantity();
						index2.add(i);
					}
				}
				candyDetail.add(new Value(name, quantity));
			}
			ArrayList<Integer> index3 = new ArrayList<Integer>();
			for (int j = 0; j < drink.size(); j++) {
				if (index3.contains(j))
					continue;
				String name = drink.get(j).getProductId();
				int quantity = drink.get(j).getQuantity();
				for (int i = j + 1; i < drink.size(); i++) {
					if (drink.get(j).getProductId().equalsIgnoreCase(drink.get(i).getProductId())) {
						quantity += drink.get(i).getQuantity();
						index3.add(i);
					}
				}
				drinkDetail.add(new Value(name, quantity));
			}
			ArrayList<Integer> index4 = new ArrayList<Integer>();
			for (int j = 0; j < some.size(); j++) {
				if (index4.contains(j))
					continue;
				String name = some.get(j).getProductId();
				int quantity = some.get(j).getQuantity();
				for (int i = j + 1; i < some.size(); i++) {
					if (some.get(j).getProductId().equalsIgnoreCase(some.get(i).getProductId())) {
						quantity += some.get(i).getQuantity();
						index4.add(i);
					}
				}
				someDetail.add(new Value(name, quantity));
			}
			
			for (Product p : pDAO.getAllProducts()) {
				int tmp1 = 0;
				for (Value cake : cakeDetail) {
					if(cake.getKey().equals(p.getCode())){
						tmp1+=1;
						break;
					}
				}
				for (Value candy : candyDetail) {
					if(candy.getKey().equals(p.getCode())){
						tmp1+=1;
						break;
					}
				}
				for (Value drink : drinkDetail) {
					if(drink.getKey().equals(p.getCode())){
						tmp1+=1;
						break;
					}
				}
				for (Value some : someDetail) {
					if(some.getKey().equals(p.getCode())){
						tmp1+=1;
						break;
					}
				}
				if(tmp1<1)
					isNotBought.add(p);
			}
			
			request.setAttribute("candyDetail", candyDetail);
			request.setAttribute("cakeDetail", cakeDetail);
			request.setAttribute("drinkDetail", drinkDetail);
			request.setAttribute("someDetail", someDetail);
			request.setAttribute("isNotBought", isNotBought);
			}
		if(tmp<1){
		RequestDispatcher view = request.getRequestDispatcher("/Chart/StatisticWareHouse.jsp");
		view.forward(request, response);}
	}

}

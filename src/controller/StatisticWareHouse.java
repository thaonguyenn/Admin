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
import model.Bill;
import model.BillDetail;
import model.Value;

/**
 * Servlet implementation class StatisticWareHouse
 */
@WebServlet("/StatisticWareHouse")
public class StatisticWareHouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BillDAO billDAO;
	BillDetailDAO billDetailDAO;
	List<Bill> statisticBill;
	List<BillDetail> statisticBillDetail;
	List<BillDetail> cake;
    List<BillDetail> candy;
    List<BillDetail> drink;
    List<BillDetail> some;
    int quantityCake ;
    int quantityCandy ;
    int quantityDrink ;
    int quantitySome ;
    List<Value> cakeDetail;
    List<Value> candyDetail;
    List<Value> drinkDetail;
    List<Value> someDetail;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StatisticWareHouse() {
		super();
		billDAO = new BillDAO();
		billDetailDAO = new BillDetailDAO();
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
        quantityCake =0;
        quantityCandy =0;
        quantityDrink =0;
        quantitySome =0;
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
        quantityCake =0;
        quantityCandy =0;
        quantityDrink =0;
        quantitySome =0;
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
        quantityCake =0;
        quantityCandy =0;
        quantityDrink =0;
        quantitySome =0;
		if (request.getParameter("date") != null) {
			for (Bill bill : billDAO.getAllBills())
				if (bill.getDateTime().getDate() == Integer.parseInt(request.getParameter("date")))
					statisticBill.add(bill);
		}
		if (request.getParameter("month") != null) {
			for (Bill bill : billDAO.getAllBills())
				if (bill.getDateTime().getMonth()+1 == Integer.parseInt(request.getParameter("month")))
					statisticBill.add(bill);
		}
		if (request.getParameter("precious") != null) {//xem lai thong ke theo quy
			int previous = Integer.parseInt(request.getParameter("precious"));
			if (previous == 1)
				for (Bill bill : billDAO.getAllBills()){
					if (bill.getDateTime().getMonth()+1 == 1 || bill.getDateTime().getMonth()+1 == 2
					|| bill.getDateTime().getMonth()+1 == 3)
						statisticBill.add(bill);
				}
			if (previous == 2)
				for (Bill bill : billDAO.getAllBills())
					if (bill.getDateTime().getMonth()+1 == 4 || bill.getDateTime().getMonth()+1 == 5
							|| bill.getDateTime().getMonth()+1 == 6)
						statisticBill.add(bill);
			if (previous == 3)
				for (Bill bill : billDAO.getAllBills())
					if (bill.getDateTime().getMonth()+1 == 7 || bill.getDateTime().getMonth()+1 == 8
					|| bill.getDateTime().getMonth()+1 == 9)
						statisticBill.add(bill);
			if (previous == 4)
				for (Bill bill : billDAO.getAllBills())
					if (bill.getDateTime().getMonth()+1 == 10 || bill.getDateTime().getMonth()+1 == 11
					|| bill.getDateTime().getMonth()+1 == 12)
						statisticBill.add(bill);

		}
		if (request.getParameter("year") != null) {
			for (Bill bill : billDAO.getAllBills()){
				if (bill.getDateTime().getYear()+1900 == Integer.parseInt(request.getParameter("year")))
					statisticBill.add(bill);
			}
		}
		//Lọc
		if(statisticBill.size()>0){
			for (Bill b : statisticBill) 
				for (BillDetail bD : billDetailDAO.getAllBills()) 
					if(b.getBillId().equalsIgnoreCase(bD.getBillId()))
						statisticBillDetail.add(bD);
			for (BillDetail billDetail : statisticBillDetail) {
				if(billDetail.getProductId().substring(0,3).equalsIgnoreCase("cak")){
					quantityCake+=billDetail.getQuantity();
					cake.add(billDetail);
				}
				if(billDetail.getProductId().substring(0,3).equalsIgnoreCase("can")){
					quantityCandy+=billDetail.getQuantity();
					candy.add(billDetail);
				}
				if(billDetail.getProductId().substring(0,3).equalsIgnoreCase("dri")){
					quantityDrink+=billDetail.getQuantity();
					drink.add(billDetail);
				}
				if(billDetail.getProductId().substring(0,2).equalsIgnoreCase("st")){
					quantitySome+=billDetail.getQuantity();
					some.add(billDetail);
				}
			}
			ArrayList<Integer>index1 = new ArrayList<Integer>();
			for (int j = 0; j < cake.size(); j++) {
				if(index1.contains(j))
					continue;
				String name =cake.get(j).getProductId();
				int quantity =cake.get(j).getQuantity();
				for (int i = j+1; i < cake.size(); i++) {
					if(cake.get(j).getProductId().equalsIgnoreCase(cake.get(i).getProductId())){
						quantity+=cake.get(i).getQuantity();
						index1.add(i);
					}
				}
				cakeDetail.add(new Value(name,quantity));
			}
			ArrayList<Integer>index2 = new ArrayList<Integer>();
			for (int j = 0; j < candy.size(); j++) {
				if(index2.contains(j))
					continue;
				String name =candy.get(j).getProductId();
				int quantity =candy.get(j).getQuantity();
				for (int i = j+1; i < candy.size(); i++) {
					if(candy.get(j).getProductId().equalsIgnoreCase(candy.get(i).getProductId())){
						quantity+=candy.get(i).getQuantity();
						index2.add(i);
					}
				}
				candyDetail.add(new Value(name,quantity));
			}
			ArrayList<Integer>index3 = new ArrayList<Integer>();
			for (int j = 0; j < drink.size(); j++) {
				if(index3.contains(j))
					continue;
				String name =drink.get(j).getProductId();
				int quantity =drink.get(j).getQuantity();
				for (int i = j+1; i < drink.size(); i++) {
					if(drink.get(j).getProductId().equalsIgnoreCase(drink.get(i).getProductId())){
						quantity+=drink.get(i).getQuantity();
						index3.add(i);
					}
				}
				drinkDetail.add(new Value(name,quantity));
			}
			ArrayList<Integer>index4 = new ArrayList<Integer>();
			for (int j = 0; j < some.size(); j++) {
				if(index4.contains(j))
					continue;
				String name =some.get(j).getProductId();
				int quantity =some.get(j).getQuantity();
				for (int i = j+1; i < some.size(); i++) {
					if(some.get(j).getProductId().equalsIgnoreCase(some.get(i).getProductId())){
						quantity+=some.get(i).getQuantity();
						index4.add(i);
					}
				}
				someDetail.add(new Value(name,quantity));
			}
			
			request.setAttribute("candyDetail", candyDetail);
			request.setAttribute("cakeDetail", cakeDetail);
			request.setAttribute("drinkDetail", drinkDetail);
			request.setAttribute("someDetail", someDetail);
		}
		RequestDispatcher view = request.getRequestDispatcher("/Chart/StatisticWareHouse.jsp");
		view.forward(request, response);
	}

}

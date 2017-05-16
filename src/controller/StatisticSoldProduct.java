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

import dao.BillDetailDAO;
import model.BillDetail;
import model.Value;

/**
 * Servlet implementation class StatisticSoldProduct
 */
@WebServlet("/StatisticSoldProduct")
public class StatisticSoldProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    BillDetailDAO billDetailDAO;
    List<BillDetail> cake;
    List<BillDetail> candy;
    int quantityCake ;
    int quantityCandy ;
    List<Value> cakeDetail;
    List<Value> candyDetail;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticSoldProduct() {
        super();
        billDetailDAO = new BillDetailDAO();
        cake = new ArrayList<BillDetail>();
        candy = new ArrayList<BillDetail>();
        cakeDetail = new ArrayList<Value>();
        candyDetail = new ArrayList<Value>();
        quantityCake =0;
        quantityCandy =0;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	List<BillDetail> listBill = billDetailDAO.getAllBills();
	cake = new ArrayList<BillDetail>();
    candy = new ArrayList<BillDetail>();
    cakeDetail = new ArrayList<Value>();
    candyDetail = new ArrayList<Value>();
	quantityCake =0;
	quantityCandy =0;
	for (BillDetail billDetail : listBill) {
		if(billDetail.getProductId().substring(0,3).equalsIgnoreCase("cak")){
			quantityCake+=billDetail.getQuantity();
			cake.add(billDetail);
		}
		if(billDetail.getProductId().substring(0,3).equalsIgnoreCase("can")){
			quantityCandy+=billDetail.getQuantity();
			candy.add(billDetail);
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
	request.setAttribute("quantityCake", quantityCake);
	request.setAttribute("quantityCandy", quantityCandy);
	request.setAttribute("candyDetail", candyDetail);
	request.setAttribute("cakeDetail", cakeDetail);
	RequestDispatcher view = request.getRequestDispatcher("/Chart/PercentageSoldCategory.jsp");
	view.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

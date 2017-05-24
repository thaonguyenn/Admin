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
import dao.CheckedDAO;
import dao.UncheckedDAO;
import model.Bill;
import model.CheckedBill;
import model.UncheckedBill;

/**
 * Servlet implementation class StatisticBill
 */
@WebServlet("/StatisticBill")
public class StatisticBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BillDAO billDAO;
	List<Bill> unchecked;
	List<Bill> checked;
	UncheckedDAO uncheckDAO;
	CheckedDAO checkDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StatisticBill() {
		super();
		uncheckDAO = new UncheckedDAO();
		checkDAO = new CheckedDAO();
		billDAO = new BillDAO();
		unchecked = new ArrayList<Bill>();
		checked = new ArrayList<Bill>();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		unchecked = new ArrayList<Bill>();
		checked = new ArrayList<Bill>();

		if (request.getParameter("action") != null) {
			if (request.getParameter("action").equalsIgnoreCase("check")) {
				if (uncheckDAO.getAllBills().size() > 0)
					uncheckDAO.delete(request.getParameter("billId"));
				checkDAO.insert(new CheckedBill(request.getParameter("billId")));
			}
		}
		if (uncheckDAO.getAllBills().size() > 0)
			for (UncheckedBill ubill : uncheckDAO.getAllBills()) {
				int tmp = 0;
				for (Bill bill : unchecked) {
					if (bill.getBillId().equals(ubill.getBillId())) {
						tmp += 1;
						break;
					}
				}
				if (tmp > 0)
					continue;
				unchecked.add(billDAO.getBillById(ubill.getBillId()));
			}
		if (checkDAO.getAllBills().size() > 0)
			for (CheckedBill cbill : checkDAO.getAllBills()) {
				int tmp = 0;
				for (Bill bill : checked) {
					if (bill.getBillId().equals(cbill.getBillId())) {
						tmp += 1;
						break;
					}
				}
				if (tmp > 0)
					continue;
				checked.add(billDAO.getBillById(cbill.getBillId()));
			}
		request.setAttribute("unchecked", unchecked);
		request.setAttribute("checked", checked);

		RequestDispatcher view = request.getRequestDispatcher("/Chart/StatisticBill.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("txtSearch1") != null) {
			String id = request.getParameter("txtSearch1");
			for (UncheckedBill bill : uncheckDAO.getAllBills()) {
				if (bill.getBillId().equals(id)) {
					unchecked = new ArrayList<Bill>();
					unchecked.add(billDAO.getBillById(id));
				}
			}
		}
		if (request.getParameter("txtSearch2") != null) {
			String id = request.getParameter("txtSearch2");
			for (CheckedBill bill : checkDAO.getAllBills()) {
				if (bill.getBillId().equals(id)) {
					checked = new ArrayList<Bill>();
					checked.add(billDAO.getBillById(id));
				}
			}
		}
		request.setAttribute("unchecked", unchecked);
		request.setAttribute("checked", checked);
		RequestDispatcher view = request.getRequestDispatcher("/Chart/StatisticBill.jsp");
		view.forward(request, response);
	}

}

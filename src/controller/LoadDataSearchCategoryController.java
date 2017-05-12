package controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import model.Category;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet({ "/LoadDataSearchCategoryController", "/manageCategory" })
public class LoadDataSearchCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO dao;

	public static final String INDEX = "/Category/ManageCategory.jsp";
	public static final String DETAIL = "/Category/detail.jsp";
	public static final String PRINT = "/Category/print.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadDataSearchCategoryController() {
		super();
		dao = new CategoryDAO();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (request.getParameter("action") != null) {
			String action = request.getParameter("action");
			String forward = "";
			if (action.equalsIgnoreCase("detail")) {
				forward = DETAIL;
				int categoryId = Integer.parseInt(request.getParameter("categoryId"));
				Category category = dao.getCategoryById(categoryId);
				request.setAttribute("category", category);
			} else if (action.equalsIgnoreCase("print")) {
				forward = PRINT;
				request.setAttribute("listCategory", dao.getAllCategories());
			} else {
				forward = INDEX;
				request.setAttribute("listCategory", dao.getAllCategories());
			}
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		} else {
			request.setAttribute("listCategory", dao.getAllCategories());
			RequestDispatcher view = request.getRequestDispatcher(INDEX);
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String forward = "";

		String action = request.getParameter("hidAction");
		System.out.println("hidAction = " + action);
		if (action.equalsIgnoreCase("search")) {
			String cond = request.getParameter("txtSearch");
			request.setAttribute("listCategory", dao.getCategoryByCond(cond));
			forward = INDEX;
		}
		request.setAttribute("listCategory", dao.getAllCategories());
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}

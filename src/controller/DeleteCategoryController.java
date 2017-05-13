package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;


/**
 * Servlet implementation class CategoryController
 */
@WebServlet({ "/Category/Delete" })
public class DeleteCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO dao;

	public static final String INDEX = "/Category/ManageCategory.jsp";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCategoryController() {
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
			if (action.equalsIgnoreCase("delete")) {
				forward = INDEX;
				int categoryId = Integer.parseInt(request.getParameter("categoryId"));
				dao.delete(categoryId);
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
	}
}

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
@WebServlet({ "/CategoryController", "/manageCategory" })
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO dao;

	public static final String INDEX = "/Category/ManageCategory.jsp";
	public static final String CREATE = "/Category/create.jsp";
	public static final String EDIT = "/Category/edit.jsp";
	public static final String DETAIL = "/Category/detail.jsp";
	public static final String PRINT = "/Category/print.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryController() {
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

			} else if (action.equalsIgnoreCase("create")) {
				forward = CREATE;
			} else if (action.equalsIgnoreCase("edit")) {
				forward = EDIT;
				int categoryId = Integer.parseInt(request.getParameter("categoryId"));
				Category category = dao.getCategoryById(categoryId);
				request.setAttribute("category", category);
			} else if (action.equalsIgnoreCase("detail")) {
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

		String errorId="", errorIdM="", errorIdS="", errorName="", errorLink = "";
		boolean err = false;
		String action = request.getParameter("hidAction");
		System.out.println("hidAction = " + action);
		if (action.equalsIgnoreCase("search")) {
			String cond = request.getParameter("txtSearch");
			request.setAttribute("listCategory", dao.getCategoryByCond(cond));
			forward = INDEX;
		} else {
			String id = request.getParameter("txtId");
			Pattern paternObjectS = Pattern.compile("\\d*");
			Matcher matcherObjectS = paternObjectS.matcher(id);
			if (!matcherObjectS.matches()) {
				errorIdM = "Mã loại sản phẩm phải là số ";
				request.setAttribute("errorIdM", errorIdM);
				err = true;
			}
			for (Category cate : dao.getAllCategories()) {
				if ((cate.getId() + "").equals(request.getParameter("txtId"))) {
					errorIdS = "Mã loại sản phẩm đã tồn tại, vui lòng đổi mã khác!";
					request.setAttribute("errorIdS", errorIdS);
					err = true;
					break;
				}
			}
			if (request.getParameter("txtId") == null || request.getParameter("txtId").equals("")) {
				errorId = "Không được để trống mã loại sản phẩm";
				request.setAttribute("errorId", errorId);
				err = true;
			}
			if (request.getParameter("txtName") == null || request.getParameter("txtName").equals("")) {
				errorName = "Không được để trống tên loại sản phẩm";
				request.setAttribute("errorName", errorName);
				err = true;
			}
			if (request.getParameter("txtLink") == null || request.getParameter("txtLink").equals("")) {
				errorLink = "Không được để trống link đến loại sản phẩm";
				request.setAttribute("errorLink", errorLink);
				err = true;
			}
			if (err == true && action.equalsIgnoreCase("add")) {
				forward = CREATE;
			} 
			else if (err == true && action.equalsIgnoreCase("edit")) {
				Category category = new Category();
				category.setId(Integer.parseInt(request.getParameter("txtId")));
				category.setName(request.getParameter("txtName"));
				category.setLink(request.getParameter("txtLink"));
				request.setAttribute("category", category);
				request.setAttribute("listCategory", dao.getAllCategories());
				forward = EDIT;
			} else if(err == false){
				Category category = new Category();
				category.setId(Integer.parseInt(request.getParameter("txtId")));
				category.setName(request.getParameter("txtName"));
				category.setLink(request.getParameter("txtLink"));

				if (action.equalsIgnoreCase("add")) {
					dao.add(category);
				} else if (action.equalsIgnoreCase("edit")) {
					category.setId(Integer.parseInt(request.getParameter("hidId")));
					dao.update(category);
				}
				forward = INDEX;	
			}
		}
		request.setAttribute("listCategory", dao.getAllCategories());
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}

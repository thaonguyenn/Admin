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
@WebServlet({ "/Category/create","/Category/edit"})
public class CreateEditCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO dao;

	public static final String INDEX = "/Category/ManageCategory.jsp";
	public static final String CREATE = "/Category/create.jsp";
	public static final String EDIT = "/Category/edit.jsp";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateEditCategoryController() {
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
			if (action.equalsIgnoreCase("create")) {
				forward = CREATE;
			} else if (action.equalsIgnoreCase("edit")) {
				forward = EDIT;
				int categoryId = Integer.parseInt(request.getParameter("categoryId"));
				Category category = dao.getCategoryById(categoryId);
				request.setAttribute("category", category);
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
		//gop bien lai, validate trung id o database
		String errorId="", errorIdM="", errorIdS="", errorName="", errorLink = "";
		boolean err = false;
		String action = request.getParameter("hidAction");
		System.out.println("hidAction = " + action);
		if(action.equalsIgnoreCase("add")){
		String id = request.getParameter("txtId");
			Pattern paternObjectS = Pattern.compile("\\d*");
			Matcher matcherObjectS = paternObjectS.matcher(id);//check logic
			if (!matcherObjectS.matches()) {
				errorIdM = "Mã loại sản phẩm phải là số ";
				request.setAttribute("errorIdM", errorIdM);
				err = true;
			}
			for (Category cate : dao.getAllCategories()) {//check logic
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
			if (err == true) {
				forward = CREATE;
			} 
			else if (err == false) {
				Category category = new Category();
				category.setId(Integer.parseInt(request.getParameter("txtId")));
				category.setName(request.getParameter("txtName"));
				category.setLink(request.getParameter("txtLink"));
				dao.add(category);
				forward = INDEX;
			} }
		else if(action.equalsIgnoreCase("edit")){
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
			if (err == true) {
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
				category.setId(Integer.parseInt(request.getParameter("hidId")));
				dao.update(category);
				forward = INDEX;	
		}	
		}	
		request.setAttribute("listCategory", dao.getAllCategories());
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	
	}}

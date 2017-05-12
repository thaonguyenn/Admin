package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import model.Category;
import model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet({"/UserController","/manageUser"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO dao;
	ProductDAO daoP;
	CategoryDAO daoC;
    /**
     * @see HttpServlet#HttpServlet()
     */
	public static final String INDEX = "/Customer/ManageUser.jsp";
	public static final String PRINT = "/Customer/print.jsp";
    public UserController() {
    	super();
    	dao = new UserDAO();
    	daoP = new ProductDAO();
    	daoC = new CategoryDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if (request.getParameter("action") != null) {
            String action = request.getParameter("action");
            String forward = "";
            if (action.equalsIgnoreCase("print")) {
                forward = PRINT;
                request.setAttribute("listCustomer", dao.getAllUsers());
            } else {
                forward = INDEX;
                request.setAttribute("listCustomer", dao.getAllUsers());
            }
            RequestDispatcher view = request.getRequestDispatcher(forward);
            view.forward(request, response);
        } else {
            request.setAttribute("listCustomer", dao.getAllUsers());
            RequestDispatcher view = request.getRequestDispatcher(INDEX);
            view.forward(request, response);
        }
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher view = request.getRequestDispatcher(INDEX);
		String action = request.getParameter("hidAction");
		System.out.println("hidAction = " + action);
		if (action.equalsIgnoreCase("search")) {
			String cond = request.getParameter("txtSearch");
			request.setAttribute("listCustomer", dao.getUsersByCond(cond));}
		view.forward(request, response);
}
}
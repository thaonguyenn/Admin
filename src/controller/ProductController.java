package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Category;
import model.Product;
import dao.CategoryDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class ProductController
 */
@WebServlet({ "/index", "/ProductController", "/manageProduct" })
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO dao;
	private CategoryDAO daoCate;
	// List<Product>drink;

	public static final String INDEX = "/Product/ManageProduct.jsp";
	public static final String CREATE = "/Product/create.jsp";
	public static final String EDIT = "/Product/edit.jsp";
	public static final String DETAIL = "/Product/detail.jsp";
	public static final String PRINT = "/Product/print.jsp";

	/**
	 * Default constructor.
	 */
	public ProductController() {
		dao = new ProductDAO();
		daoCate = new CategoryDAO();
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
				int productId = Integer.parseInt(request.getParameter("productId"));
				dao.delete(productId);

				// Product pIsDelete = dao.getProductById(productId);
				// if (pIsDelete.getCategory().equalsIgnoreCase("cake"))
				// cake.remove(pIsDelete);
				// else if (pIsDelete.getCategory().equalsIgnoreCase("candy"))
				// candy.remove(pIsDelete);
				// for (Category listC : daoCate.getAllCategories()) {
				// for (Product listP : listC.getListProduct()) {
				// if (listP.getCode() == pIsDelete.getCode())
				// listC.getListProduct().remove(listP);
				// break;
				// }
				// break;
				// }
				request.setAttribute("listProduct", dao.getAllProducts());

			} else if (action.equalsIgnoreCase("create")) {
				forward = CREATE;
			} else if (action.equalsIgnoreCase("edit")) {
				forward = EDIT;
				int productId = Integer.parseInt(request.getParameter("productId"));
				Product product = dao.getProductById(productId);
				request.setAttribute("product", product);
			} else if (action.equalsIgnoreCase("detail")) {
				forward = DETAIL;
				int productId = Integer.parseInt(request.getParameter("productId"));
				Product product = dao.getProductById(productId);
				request.setAttribute("product", product);
			} else if (action.equalsIgnoreCase("print")) {
				forward = PRINT;
				request.setAttribute("listProduct", dao.getAllProducts());
			} else {
				forward = INDEX;
				request.setAttribute("listProduct", dao.getAllProducts());
			}
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		} else {
			request.setAttribute("listProduct", dao.getAllProducts());
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
		RequestDispatcher view = request.getRequestDispatcher(INDEX);

		String errorCode, errorName, errorPrice, errorPriceM, errorSale, errorSaleM, errorImg, errorCate = "";
		boolean err = false;
		String action = request.getParameter("hidAction");
		System.out.println("hidAction = " + action);
		if (action.equalsIgnoreCase("search")) {
			String cond = request.getParameter("txtSearch");
			request.setAttribute("listProduct", dao.getProductByCond(cond));
		} else {
			if (request.getParameter("txtCode") == null || request.getParameter("txtCode").equals("")) {
				errorCode = "Không được để trống mã sản phẩm";
				request.setAttribute("errorCode", errorCode);
				err = true;
			}
			if (request.getParameter("txtName") == null || request.getParameter("txtName").equals("")) {
				errorName = "Không được để trống tên sản phẩm";
				request.setAttribute("errorName", errorName);
				err = true;
			}
			if (request.getParameter("txtPrice") == null || request.getParameter("txtPrice").equals("")) {
				errorPrice = "Không được để trống giá sản phẩm";
				request.setAttribute("errorPrice", errorPrice);
				err = true;
			}
			String price = request.getParameter("txtPrice");
			Pattern paternObject = Pattern.compile("\\d*");
			Matcher matcherObject = paternObject.matcher(price);
			if (!matcherObject.matches()) {
				errorPriceM = "Gía sản phẩm phải là số ";
				request.setAttribute("errorPriceM", errorPriceM);
				err = true;
			}
			if (request.getParameter("txtSale") == null || request.getParameter("txtSale").equals("")) {
				errorSale = "Không được để trống giá sale sản phẩm";
				request.setAttribute("errorSale", errorSale);
				err = true;
			}
			String sale = request.getParameter("txtPrice");
			Pattern paternObjectS = Pattern.compile("\\d*");
			Matcher matcherObjectS = paternObjectS.matcher(sale);
			if (!matcherObjectS.matches()) {
				errorSaleM = "Gía sale sản phẩm phải là số ";
				request.setAttribute("errorSaleM", errorSaleM);
				err = true;
			}
			if (request.getParameter("txtImg") == null || request.getParameter("txtImg").equals("")) {
				errorImg = "Không được để trống link hình ảnh sản phẩm";
				request.setAttribute("errorImg", errorImg);
				err = true;
			}
			if (request.getParameter("txtCate") == null || request.getParameter("txtCate").equals("")) {
				errorCate = "Không được để trống loại sản phẩm";
				request.setAttribute("errorCate", errorCate);
				err = true;
			}
			if (err == true && action.equalsIgnoreCase("add")) {
				request.setAttribute("listProduct", dao.getAllProducts());
				RequestDispatcher errm = request.getRequestDispatcher(CREATE);
				errm.forward(request, response);
			} 
//			else if (err == true && action.equalsIgnoreCase("edit")) {
//				Product product = new Product();
//				product.setCode(request.getParameter("txtCode"));
//				request.setAttribute("product",product);
//				request.setAttribute("listProduct", dao.getAllProducts());
//				RequestDispatcher errm = request.getRequestDispatcher(EDIT);
//				errm.forward(request, response);
//			}
			else{
			Product product = new Product();
			product.setCode(request.getParameter("txtCode"));
			product.setName(request.getParameter("txtName"));
			product.setDescription(request.getParameter("txtDesc"));
			product.setPrice(Double.parseDouble(request.getParameter("txtPrice")));
			product.setSale(Double.parseDouble(request.getParameter("txtSale")));
			product.setImage(request.getParameter("txtImg"));
			product.setCategory(request.getParameter("txtCate"));

			if (action.equalsIgnoreCase("add")) {
				dao.add(product);
				// for (Category list : daoCate.getAllCategories()) {
				// if(list.getName().equalsIgnoreCase(request.getParameter("txtCate")))
				// list.getListProduct().add(product);
				// break;
				// }
			} else if (action.equalsIgnoreCase("edit")) {
				product.setId(Integer.parseInt(request.getParameter("hidId")));
				dao.update(product);

				// for (Category listC : daoCate.getAllCategories()) {
				// for (Product listP : listC.getListProduct()) {
				// if (listP.getCode().equalsIgnoreCase(product.getCode()))
				// listC.getListProduct().remove(listP);
				// break;
				// }
				// break;
				// }
				// for (Category list : daoCate.getAllCategories()) {
				// if
				// (list.getName().equalsIgnoreCase(request.getParameter("txtCate")))
				// list.getListProduct().add(product);
				// break;
				// }
			}
			request.setAttribute("listProduct", dao.getAllProducts());
		}}
		view.forward(request, response);
	}
}
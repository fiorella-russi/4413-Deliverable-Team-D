package Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DAO.ReviewsDAO;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import DB.database;

public class ShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public ShoppingCart() {
		super();
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("home.jsp").forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(request.getParameter("color")==null||request.getParameter("warranty")==null|request.getParameter("wheels")==null||request.getParameter("make")==null||request.getParameter("price")==null||request.getParameter("model")==null||request.getParameter("price")==null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"success\": fail, \"message\": \"Error\"}");
				}
		String color = request.getParameter("color");
		String warranty = request.getParameter("warranty");
		String wheels = request.getParameter("wheels");

		String make = request.getParameter("make");
		String price = request.getParameter("price");
		System.out.print(price);
		String model = request.getParameter("model");

		int id = Integer.parseInt(request.getParameter("id"));

		

		addCart ac = new addCart();
		String responseString = ac.addToCart(make, model, color, warranty, wheels, id, price, request, response);
		
		if (request.getHeader("X-Postman-Test") != null) {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(responseString);
		return;
		}
		
		
		
		request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}
}

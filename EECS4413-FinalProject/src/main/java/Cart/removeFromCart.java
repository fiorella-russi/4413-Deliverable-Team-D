package Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import Cart.CartItem;


public class removeFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public removeFromCart() {
		super();
	
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("home.jsp").forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("id")==null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"success\": fail, \"message\": \"Error\"}");
		}

		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");

		removeCart rc = new removeCart();
		String responseString = rc.removeCart(id, cartItems);
		
		if (request.getHeader("X-Postman-Test") != null) {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(responseString);
		
		return;
		}

		request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}

}

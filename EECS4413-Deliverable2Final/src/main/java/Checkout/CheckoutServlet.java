package Checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import Cart.CartItem;
import adminFunctions.adminFunctions;


public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public CheckoutServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
	
if(cartItems!=null) {
	
		String  responseString = handleCheckout.handleCheckout(cartItems);
		 response.getWriter().write(responseString);
}
else {
	request.getRequestDispatcher("home.jsp").forward(request, response);
}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request,response);
		
		
	
	}

}

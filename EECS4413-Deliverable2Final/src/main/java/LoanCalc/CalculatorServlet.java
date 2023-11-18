package LoanCalc;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public CalculatorServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("home.jsp").forward(request, response);
		
		
		


	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(); 
	

	if(request.getParameter("price")==null||request.getParameter("term")==null||request.getParameter("down")==null||request.getParameter("tax")==null) {
		 if (request.getHeader("X-Postman-Test") != null) {
			 response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write("{\"message\": \"error\"}");
			 return;
		 }
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}
	
		double price =  Double.parseDouble(request.getParameter("price"));
		int term = Integer.parseInt(request.getParameter("term"));
		double down = Double.parseDouble(request.getParameter("down"));
		
	
		double tax = Double.parseDouble(request.getParameter("tax"));
		
	 

	
	
	String validationError = Cart.validateInput(term, price, tax, down);
	
	
	 if (validationError != null) {

		 	response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"message\": \""+validationError+"\"}");
	    } else {
	    	System.out.println("here");
	        double total = Cart.calculateTotal(term, price, tax, response, down);
	        total = Math.round(total * 100) / 100.0;

	
	        request.setAttribute("term", term);
	        request.setAttribute("price", price);
	        request.setAttribute("tax", tax);
	        request.setAttribute("totalPrice", total);
	        request.setAttribute("down", down);
	        
	        if (request.getHeader("X-Postman-Test") != null) {
	        
	        	response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write("{\"message\": \"Total cost: "+ total+" per month.  Vehicle Cost: "+price+" down payment: "+down+" term: "+term+" interest rate: "+tax+"\"}");
	       return;
	        }
	        RequestDispatcher dispatcher = request.getRequestDispatcher("Results.jsp");
	        dispatcher.forward(request, response);
	    }

	}

}

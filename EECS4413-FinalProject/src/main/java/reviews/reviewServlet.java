package reviews;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import DAO.ReviewsDAO;
import DB.database;


public class reviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public reviewServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.getRequestDispatcher("home.jsp").forward(request, response);
	        
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		 String make = request.getParameter("make");
	        String model = request.getParameter("model");
	        int rating = Integer.parseInt(request.getParameter("rating"));
	        String comment = request.getParameter("comment");
	        int productId = Integer.parseInt(request.getParameter("productId"));
	       
	       ReviewsDAO dr = new ReviewsDAO();
	       Boolean update = dr.addReview(model, make, rating, comment);
	       
	       if(update) {
	    	   response.sendRedirect("productDetails?param1="+productId);

	       }
	       else {
	    	   response.sendRedirect("home.jsp");
	       }
	}

}

package products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import DB.database;
import DAO.ProductDAO;
import DAO.ReviewsDAO;

public class productDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public productDetails() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String make = "";
		String model = "";
		double average =0;
		int count=0;
		double averageRating=0;
		
if(request.getParameter("param1")==null) {
	request.getRequestDispatcher("home.jsp").forward(request, response);
}
		
		System.out.println(request.getParameter("param1"));
		
		
		
		
		ProductDAO pDAO = new ProductDAO();
		List<Map<String, Object>> myList = pDAO.getProduct(request.getParameter("param1"));
		
		  for (Map<String, Object> review : myList) {
	
			
			  
	             make = (String) review.get("make");
	             model = (String) review.get("model");
	             
	            
			  
	             
	            
		  }
		
		
			ReviewsDAO rDAO = new ReviewsDAO();
			List<Map<String, Object>> myList2= rDAO.getProductReviews(make,model);
			
			System.out.println(myList2.size());
			
			for (Map<String, Object> review : myList2) {
			  
	           
	             
	   
	             average+=(int) review.get("rating");
	             count++;
	             System.out.print("testttt");
	            
		  }
		
		
		average = average/count;
		
		average = Math.round(average * 100) / 100.0;
		
		 request.setAttribute("myList", myList);
		 request.setAttribute("myList2", myList2);
		 request.setAttribute("average", average);
		 request.getRequestDispatcher("productDetails.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

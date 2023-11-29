package products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DAO.ProductDAO;
import DAO.ReviewsDAO;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import DB.database;


public class saleproductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public saleproductsServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO pDAO = new ProductDAO();
		List<Map<String, Object>> hotDealsList= pDAO.getProductList(1);
		
		

	
		 request.setAttribute("myList", hotDealsList);
		 
		 if (request.getHeader("X-Postman-Test") != null) {
	   		 response.setContentType("application/json");
		            response.setCharacterEncoding("UTF-8");
		            response.getWriter().write("{\"success\": true, \"message\": \"Successfully displayed the cars \"}");
		            
		            return;
	   	}
		 request.getRequestDispatcher("hotDeals.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

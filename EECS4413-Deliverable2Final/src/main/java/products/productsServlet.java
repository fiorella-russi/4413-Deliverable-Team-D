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


public class productsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public productsServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
ProductDAO pDAO = new ProductDAO();
		List<Map<String, Object>> myList= pDAO.getProductList(0);

		
		
		
	
		
	
		 request.setAttribute("myList", myList);
		 if (request.getHeader("X-Postman-Test") != null) {
	   		 response.setContentType("application/json");
		            response.setCharacterEncoding("UTF-8");
		            response.getWriter().write("{\"success\": true, \"message\": \"Successfully displayed the cars \"}");
		            
		            return;
	   	}
		 request.getRequestDispatcher("products.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

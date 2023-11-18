package adminFunctions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.convertData;
import DAO.ReviewsDAO;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import DB.database;

public class MarkSoldVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MarkSoldVehicleServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("home.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(request.getParameter("id")==null||request.getParameter("soldPrice")==null||request.getParameter("dateSold")==null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"success\": fail, \"message\": \"Error\"}");
			
		}

		int id = Integer.parseInt(request.getParameter("id"));
		int soldPrice = Integer.parseInt(request.getParameter("soldPrice"));
		String dateSold = request.getParameter("dateSold");

		adminFunctions af = new adminFunctions();
		String responseString = af.markSold(id, dateSold, soldPrice);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(responseString);
	}

}

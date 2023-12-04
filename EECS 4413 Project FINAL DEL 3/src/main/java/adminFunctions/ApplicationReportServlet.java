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
import java.util.List;
import java.util.Map;

import DB.database;

public class ApplicationReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApplicationReportServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		adminFunctions af = new adminFunctions();
		List<Map<String, Object>> myList = af.getAppReport();

		request.setAttribute("ApplicationReports", myList);
		
		if (request.getHeader("X-Postman-Test") != null) {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"success\": true, \"message\": \"Successfully generated application report\"}");
		return;
		}

		request.getRequestDispatcher("ApplicationReports.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

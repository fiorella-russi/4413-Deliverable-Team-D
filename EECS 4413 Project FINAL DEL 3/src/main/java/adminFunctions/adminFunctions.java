package adminFunctions;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import DAO.convertData;
import DAO.AdminDAO;
import DAO.ReviewsDAO;
import DB.database;

public class adminFunctions {

	public String markSold(int id, String dateSold, int soldPrice) {
		String response = "";

		database db = new database();
		ResultSet resultSet = db.getDataResultSet("select soldStatus from products where id= " + id);
		try {
			if (resultSet.isBeforeFirst()) {
				convertData cd = new convertData();
				List<Map<String, Object>> myList = cd.convertData(resultSet);
				if ((int) myList.get(0).get("soldStatus") == 1) {
					response = ("{\"success\": false, \"message\": \"Unable to mark as sold\"}");
				}

				else {
					AdminDAO aDAO = new AdminDAO();
					aDAO.markSold(dateSold, soldPrice, id);
					response = ("{\"success\": true, \"message\": \"Successfully marked as sold\"}");
				}
			} else {
				response = ("{\"success\": false, \"message\": \"Vehicle does not exist\"}");
			}

		} catch (SQLException e) {
			response = ("{\"success\": false, \"message\": \"Unable to mark as sold\"}");
			e.printStackTrace();
		}

		return response;
	}

	public List<Map<String, Object>> getAppReport() {

		AdminDAO aDAO = new AdminDAO();
		List<Map<String, Object>> myList = aDAO.getAppReport();

		return myList;
	}

	public List<Map<String, Object>> getUserReport() {

		AdminDAO aDAO = new AdminDAO();
		List<Map<String, Object>> myList = aDAO.getUserReport();

		return myList;
	}

}

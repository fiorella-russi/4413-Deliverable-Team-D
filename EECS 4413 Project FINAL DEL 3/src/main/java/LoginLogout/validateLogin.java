package LoginLogout;

import java.sql.*;
import java.util.List;
import java.util.Map;

import DB.database;
import jakarta.servlet.http.HttpSession;
import DAO.LoginLogoutDAO;
import DAO.convertData;

public class validateLogin {

//	String dbUrl = "jdbc:mysql://localhost:3306/database_4413", dbUsername = "root", dbPassword = "Ai1130611!";
	
	private boolean admin = false;

	public boolean login(String email, String password, loginservlet servlet) {
		LoginLogoutDAO loginDAO= new LoginLogoutDAO();
		ResultSet resultSet = loginDAO.getLogin(email,password);
			database db = new database();
		try {
			if (resultSet.isBeforeFirst()) {
				convertData cd = new convertData();
				List<Map<String, Object>> myList = cd.convertData(resultSet);
				int loginCount = (int) myList.get(0).get("numVisits");
				db.executeUpdate("update registeredUsers set numVisits = " + (loginCount+1) + " where email=\'" + email + "\' and password=" + "\'" + password + "\'");
				if(myList.get(0).get("isAdmin").equals("True")) {

					setAdmin(true);
				}
				else {
					setAdmin(false);
				}
				
				

				resultSet.close();

				return true;

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return false;
	}
	
	public boolean getAdmin() {
		return admin;
	}
	
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

}

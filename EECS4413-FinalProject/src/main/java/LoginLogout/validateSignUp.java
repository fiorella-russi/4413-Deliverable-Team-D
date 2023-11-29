package LoginLogout;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import DAO.LoginLogoutDAO;
import DB.database;

public class validateSignUp {



	public boolean signUp(String email, String password, signupservlet signupservlet, String name) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet;
		boolean signedUp = false;

		LoginLogoutDAO LDAO = new LoginLogoutDAO();
		database db = new database();
		resultSet = LDAO.getUsers(email);

		if (resultSet.isBeforeFirst()) {
			System.out.println("already registered");
			resultSet.close();
			
			signedUp = false;

		} else {

			db.executeUpdate("insert into registeredUsers values (\'" + email + "\',  \'" + password + "\', \'"
					+ "false" + "\', \'" + name + "\', \'" + 0 + "\')");

			signedUp = true;

		}

		return signedUp;

	}
}

package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import DAO.convertData;

public class database {
	//String dbUrl = "jdbc:mysql://localhost:3306/database_4413", dbUsername = "root", dbPassword = "Ai1130611!";

	public List<Map<String, Object>> getData(String query) {
		
		Connection connection = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EECS4413Project", "root", "11Ishwar");

			Statement statement;
			statement = connection.createStatement();
			ResultSet resultSet;
			resultSet = statement.executeQuery(query);
			
			convertData cd = new convertData();
			List<Map<String, Object>> myList = cd.convertData(resultSet);
			return myList;

		} catch (Exception exception) {
			System.out.println(exception);
		}
		return null;

	}
	public ResultSet getDataResultSet(String query) {

		Connection connection = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EECS4413Project", "root", "11Ishwar");

			Statement statement;
			statement = connection.createStatement();
			ResultSet resultSet;
			resultSet = statement.executeQuery(query);
			
			
			return resultSet;

		} catch (Exception exception) {
			System.out.println(exception);
		}
		return null;

	}
	
	public int executeUpdate(String query) {
	    Connection connection = null;
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EECS4413Project", "root", "11Ishwar");

	        Statement statement = connection.createStatement();
	        int rowsAffected = statement.executeUpdate(query);
	        return rowsAffected; 
	    } catch (Exception exception) {
	        System.out.println(exception);
	    } 
	    return -1;
	}


}

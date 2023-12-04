package DAO;

import java.sql.ResultSet;

import DB.database;

public class LoginLogoutDAO {
	
	public ResultSet getLogin(String email, String password) {
		database db = new database();
		ResultSet rs = db.getDataResultSet("select * from registeredUsers where email=\'" + email + "\' and password=" + "\'" + password + "\'");
		System.out.println("select * from registeredUsers where email=\'" + email + "\' and password=" + "\'" + password + "\'");
		return rs;
	}
	
	public ResultSet getUsers(String email) {
		database db = new database();
		ResultSet rs = db.getDataResultSet("select * from registeredUsers where email=\'" + email + "\'");
		return rs;
	}
	
	

}

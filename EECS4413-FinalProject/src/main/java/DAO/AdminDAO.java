package DAO;

import java.util.List;
import java.util.Map;

import DB.database;

public class AdminDAO {
	database db = new database();
	public List<Map<String, Object>>getUserReport() {
		List<Map<String, Object>> myList= db.getData(
				"select name, numVisits, email from registeredUsers where isAdmin = 'False'");
		
		return myList;
	}

	public List<Map<String, Object>> getAppReport() {
		List<Map<String, Object>> myList = db.getData(
				"select make, model, price, DateListed, DateSold, soldPrice from products where soldStatus = 1");
		return myList;
	}



	public void markSold(String dateSold, int soldPrice, int id) {
		db.executeUpdate("update products set soldStatus = 1, DateSold=\'" + dateSold + "\', soldPrice= " + soldPrice + " where id = " + id);
	
		
	}
}

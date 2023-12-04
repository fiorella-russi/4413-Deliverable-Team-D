package DAO;

import java.util.List;
import java.util.Map;

import DB.database;

public class ProductDAO {
	database db = new database();
	public List<Map<String, Object>> getProductList( int saleStatus){

		if( saleStatus ==0) {
			 List<Map<String, Object>> myList= db.getData("Select * from products where soldStatus = 0 and onSale = 0");
			 return myList;
		}
		if(saleStatus==1) {
			 List<Map<String, Object>> myList= db.getData("Select * from products where soldStatus = 0 and onSale = 1");
			 return myList;
		}
		return null;
		
	}
	
	public List<Map<String, Object>> getProduct( String id){
		
		List<Map<String, Object>> myList = db.getData("select * from products where id ="+id);
		return myList;
	}
	

	
public List<Map<String, Object>> getProduct( int id){
		
		List<Map<String, Object>> myList = db.getData("select * from products where id ="+id);
		return myList;
	}


}

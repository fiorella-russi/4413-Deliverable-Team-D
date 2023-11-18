package DAO;

import java.util.List;
import java.util.Map;

import DB.database;

public class ReviewsDAO {
	database db = new database();
	


public boolean addReview(String model, String make, int rating, String comment) {
	 String query = "insert into reviews values (\""+make+"\",\""+model+"\",\""+rating+"\",\""+comment+"\")";
       
       database db = new database();
      int result =  db.executeUpdate(query);
     if(result >0) {
   	  return true;
   	  
     }
     else {
   	  return false;
     }
}

public List<Map<String, Object>> getProductReviews(String make, String model){
	 List<Map<String, Object>> myList2 = db.getData("select rating, comment from reviews where make=\""+make+"\" and model =\""+model+"\"");
	 System.out.println("select rating, comment from reviews where make=\""+make+"\" and model =\""+model+"\"");
	 return myList2;
}
	

}

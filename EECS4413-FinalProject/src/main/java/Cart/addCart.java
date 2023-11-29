package Cart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import DAO.ProductDAO;
import DAO.ReviewsDAO;
import DB.database;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class addCart {

	public String addToCart(String make, String model, String color, String warranty, String wheels, int id,
			String price, HttpServletRequest request, HttpServletResponse response) {
		


		String responseString = "";
		boolean inCart = false;
		String makeModel = make + " " + model;

		int addOnCost = 0;
		if (color.equals("Red")) {
			addOnCost += 1000;
		}
		if (color.equals("Blue")) {
			addOnCost += 1200;
		}
		if (warranty.equals("1 year")) {
			addOnCost += 3000;
		}
		if (warranty.equals("2 years")) {
			addOnCost += 5000;
		}
		if (wheels.equals("19")) {
			addOnCost += 1500;
		}
		if (wheels.equals("20")) {
			addOnCost += 2000;
		}

		ProductDAO pDAO = new ProductDAO();
		List<Map<String, Object>> car = pDAO.getProduct(id);

		
	
		
		if(car.get(0).get("model").equals(model)&&car.get(0).get("make").equals(make)&&(car.get(0).get("price").toString().equals(price)||car.get(0).get("salePrice").toString().equals(price))) {

		if ((int) car.get(0).get("soldStatus") == 1) {

			responseString = ("{\"success\": fail, \"message\": \"This vehicle is sold\"}");

		} else {

			HttpSession session = request.getSession();
			List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

			if (cart == null) {
				cart = new ArrayList<CartItem>();
				session.setAttribute("cart", cart);
			}

			for (CartItem item : cart) {
				if (item.getID() == id) {
					removeCart rc = new removeCart();
					rc.removeCart(id, cart);
					inCart = false;
					
					break;

				}

			}

			if (!inCart) {

				int finalCost = addOnCost + ((int) car.get(0).get("onSale") == 1 ? (int) car.get(0).get("salePrice")
						: (int) car.get(0).get("price"));

				CartItem newItem = new CartItem(id, makeModel, addOnCost, color, warranty, wheels, finalCost,
						Integer.parseInt(price), car.get(0));

				cart.add(newItem);

				responseString = ("{\"success\": true, \"message\": \"Successfully added to cart\"}");

			}

		}
		}else{
			
			responseString = ("{\"success\": false, \"message\": \"Invalid Vehicle\"}");
		}
		System.out.println(responseString);
		return responseString;
	}
}

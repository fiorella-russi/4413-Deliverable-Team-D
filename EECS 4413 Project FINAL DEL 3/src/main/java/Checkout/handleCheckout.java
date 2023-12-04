package Checkout;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import Cart.CartItem;
import adminFunctions.adminFunctions;

public class handleCheckout {
	
	public static String handleCheckout(List<CartItem> cartItems) {
		String response ="";
		
	
			if(PaymentValidator.validatePayment()== false) {
			
				 response =("{\"success\": false, \"message\": \"PAYMENT REJECTED. This payment method is invalid, please try again.\"}");
				 
			}
			else {

				System.out.println("Size: "+cartItems.size());
				adminFunctions af = new adminFunctions();
				int i =1;
				for (CartItem item : cartItems) {
					System.out.println("times: "+ i++);
					LocalDate today = LocalDate.now();
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					System.out.println("Formatted date: " + today.format(formatter));
					response = af.markSold(item.getID(),today.format(formatter), item.getFinalCost());
					
				}
				cartItems.clear();
				return response;
				

			}
		
		
	
		
			return response;
	}

}



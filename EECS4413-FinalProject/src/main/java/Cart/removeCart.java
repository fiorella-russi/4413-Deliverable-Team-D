package Cart;

import java.util.List;

public class removeCart {

	public String removeCart(int id, List<CartItem> cartItems) {
		String response = "{\"success\": fail, \"message\": \"Unable to remove \"}";

		if (cartItems != null) {
			for (CartItem item : cartItems) {

				if (item.getID() == id) {
					cartItems.remove(item);

					response = ("{\"success\": true, \"message\": \"sucessfull remove \"}");
					break;
				}

			}
		}

		else {

			response = ("{\"success\": fail, \"message\": \"Unable to remove \"}");

		}
		return response;
	}
	
}

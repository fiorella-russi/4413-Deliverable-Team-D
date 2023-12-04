package Checkout;

public class PaymentValidator {

	public static Boolean validatePayment() {
	
		
		int number = (Math.random() <= 0.5) ? 1 : 2;
		
		if(number == 1) {
			return true; 
		}
		else {
			return false; 
		}
	}

}

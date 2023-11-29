package LoanCalc;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;

public class Cart {

	public static String validateInput(int term, double price, double tax, double down) {
		if (term <0) {
			System.out.print("error" +term);
			return "Number of items must be a positive integer.";
		}
		if (price < 0)
			return "Price must be a positive number.";
		if (tax < 0 )
			return "Tax rate must be between 0 and 100.";
		if(down <0)
			return "Down payment must be a positive number";
		if(down >= price)
			return "Down payment must be less than vehicle cost";
		return null;
	}

	public static double calculateTotal(int term, double price, double tax, HttpServletResponse response, double down) throws IOException {
		String validationError = validateInput(term, price, tax, down);
		if (validationError != null) {
			
     
			throw new IllegalArgumentException(validationError);
		}
		double total = ((price-down)/term) * (1 + tax / 100);
		return total;
	}
}

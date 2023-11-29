<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Cart.CartItem"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Currency"%>
<%@ include file="nav.jsp"%>

<%List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart"); 




if(cartItems != null && !cartItems.isEmpty()&&isLoggedIn){
    Locale usa = new Locale("en", "US");
    Currency dollars = Currency.getInstance(usa);
    NumberFormat dollarFormat = NumberFormat.getCurrencyInstance(usa);
    double subtotal = 0;
    double taxRate = 0.13; 
    double tax = 0;

%>
<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<link rel="stylesheet" type="text/css" href="styles/Checkout.css">
<script>

	 document.addEventListener("DOMContentLoaded", function() {
        for (var i = 0; i < <%= cartItems.size() %>; i++) {
            toggleText('productExtraInfo' + i);
        }
    });
	function toggleText(sectionId) {
        var productExtraInfo = document.getElementById(sectionId);
        var checkbox = document.getElementById('toggle' + sectionId.slice(-1)); 

        if (checkbox.checked) {
            productExtraInfo.style.display = "block";
        } else {
            productExtraInfo.style.display = "none";
        }
    }
</script>
<script src="scripts/CheckOutValidations.js"></script>

</head>

<body>

	<div class="container">
		<form id="checkoutInfo"
			onSubmit="event.preventDefault();  validateAndPay();">

			<h1>Checkout</h1>
			<% if(cartItems != null && !cartItems.isEmpty()){ %>

			<div id="shopping-cart">
				<h2>Order Summary</h2>

				<% for(int i = 0; i < cartItems.size(); i++) { %>
				<div class="item-content">
					<h4><%= cartItems.get(i).getMake() %></h4>
					<p>
						Price:
						<%= dollarFormat.format(cartItems.get(i).getPrice()) %>
					</p>
					<p>
						Add-on Cost:<%= dollarFormat.format(cartItems.get(i).getAddOnCost()) %>
					</p>



					<label for="toggle<%= i %>">Show More Details:</label> <input
						type="checkbox" id="toggle<%= i %>"
						onchange="toggleText('productExtraInfo<%= i %>')">

					<div class="expandable-section" id="productExtraInfo<%= i %>">
						Color:
						<%= cartItems.get(i).getColor() %>
						<br>
						<br> Warranty:
						<%= cartItems.get(i).getWarranty() %><br>
						<br> Wheels:
						<%= cartItems.get(i).getWheels() %>

					</div>
				</div>

				<% subtotal += cartItems.get(i).getFinalCost(); tax += cartItems.get(i).getFinalCost() * taxRate; %>
				<% } %>
				<p>
				<h2>Pricing</h2>
				<div id="cost">

					<div id="subtotal">
						Subtotal:
						<%= dollarFormat.format(subtotal) %>
					</div>


					<div id="tax">
						Tax (<%= (taxRate * 100) %>%):
						<%= dollarFormat.format(tax) %>
					</div>


					<div id="total">
						Total:
						<%= dollarFormat.format(subtotal + tax) %>
					</div>
				</div>
			</div>

			<h2>Shipping / Billing Address</h2>

			<div id="billingAddress">
				<label for="fname">First Name<span class="required">*</span></label>
				<input type="text" id="name" name="fullname" placeholder="" required>

				<label for="lname">Last Name<span class="required">*</span></label>
				<input type="text" id="name" name="fullname" placeholder="" required>

				<label for="email">Email<span class="required">*</span></label> <input
					type="text" id="email" name="email" placeholder="" required><br>

				<label for="address">Address<span class="required">*</span></label>
				<input type="text" id="address" name="address" placeholder=""
					required> <label for="city">City<span
					class="required">*</span></label> <input type="text" id="city" name="city"
					placeholder="" required><br> <label for="state">Province<span
					class="required">*</span></label> <input type="text" id="state"
					name="state" placeholder="" required> <label for="zip">Postal
					Code<span class="required">*</span>
				</label> <input type="text" id="zip" name="zip" placeholder="" required>
			</div>
			<h2>Payment Information</h2>

			<div id="paymentInfo">


				<label for="cname">Name on Card</label> <input type="text"
					id="cname" name="cardname" placeholder=""> <br> <label
					for="ccnum">Credit Card Number</label> <input type="text"
					id="ccnum" name="cardnumber" placeholder=""> <br> <label
					for="expmonth">Exp Month</label> <input type="text" id="expmonth"
					name="expmonth" placeholder=""> <br> <label
					for="expyear">Exp Year</label> <input type="text" id="expyear"
					name="expyear" placeholder=""> <br> <label for="cvv">CVV</label>
				<input type="text" id="cvv" name="cvv" placeholder="">
			</div>



			<div>
				<p>
					<button id="checkout-button" type="submit" value="pay">
						Process Payment</button>
			</div>
		</form>



		<div id="errorMessageID" style="color: red;"></div>
	</div>
</body>
</html>
<%} }else{
		session.setAttribute("redirectAfterLogin", "Checkout.jsp"); 
		request.getRequestDispatcher("log-in.jsp").forward(request, response);
	}
	%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Cart.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Currency" %>
<%@ include file="nav.jsp" %>
<%@ include file="chat.jsp" %>

<%List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart"); 

if(cartItems != null && !cartItems.isEmpty()){
	


	
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

<meta charset="ISO-8859-1">
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="styles/Cart.css">
</head>
<body>
	
<h1>Shopping Cart</h1>
    <% if(cartItems != null && !cartItems.isEmpty()){ %>
    <div id="shopping-cart">
        <h2>Your Shopping Cart</h2>
      
        <% for(CartItem item : cartItems) { %>
        <div class="item-content">
            <h3><%= item.getMake() %></h3>
            <p>Price: <%= dollarFormat.format(item.getPrice()) %></p>
            <p>Color: <%= item.getColor() %></p>
            <p>Warranty: <%= item.getWarranty() %></p>
            <p>Wheels: <%= item.getWheels() %></p>
            <p>Add-on Cost: <%= dollarFormat.format(item.getAddOnCost()) %></p>
        </div>
        <% 
            subtotal += item.getFinalCost();
            tax += item.getFinalCost() * taxRate;
        %>
        
        <form action="removeFromCart" method="post">
        <input type="hidden" name="id" value="<%= item.getID()%>">
			<button id="remove-button">Remove Item</button>
		</form>
        <% } %>

 
        <div id="subtotal">
            Subtotal: <%= dollarFormat.format(subtotal) %>
        </div>


        <div id="tax">
            Tax (<%= (taxRate * 100) %>%): <%= dollarFormat.format(tax) %>
        </div>


        <div id="total">
            Total: <%= dollarFormat.format(subtotal + tax) %>
        </div>


		
		<form action="Checkout.jsp">
			<button id="checkout-button">Checkout</button>
		</form>


		
		<%} %>
	</div>

</body>
</html>
<%}
else{
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Empty Cart</title>
<link rel="stylesheet" type="text/css" href="styles/emptyCart.css">
</head>
<body>
	<div id="empty-cart-container">
		<p id="empty-cart-message">Your cart is empty.</p>

	
		<form action="home.jsp">
			<button id="go-back-button">Go Back Home</button>
		</form>
	</div>
</body>
</html>





<%} %>
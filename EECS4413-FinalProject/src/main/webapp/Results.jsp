<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%@ include file="nav.jsp" %>
	   <%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
	<% Locale usa = new Locale("en", "US");
	Currency dollars = Currency.getInstance(usa);
	

NumberFormat dollarFormat = NumberFormat.getCurrencyInstance(usa); %>
<!DOCTYPE html>
<html>
<head>
<title>Loan Calculator</title>
<link rel="stylesheet" type="text/css" href="styles/Results.css">
</head>
<body>



 

	<main>
		<div class="calculator-results">
			<fieldset>
				<legend>Loan Calculator</legend>
				<p><strong>You entered:</strong></p>
				
					<p>Vehicle Cost: <%=dollarFormat.format((double)request.getAttribute("price"))%></p>
					<p>Down Payment: <%=dollarFormat.format((double)request.getAttribute("down"))%></p>
					<p>Term (Months): <%=request.getAttribute("term") %></p>
					<p>Interest rate: <%=request.getAttribute("tax")%> %</p>
					<br>
					
				
				<p><strong>The total price is calculated as:</strong></p>
				<p>Total = (Cost - Down Payment) / Term ) * (1 + interest rate / 100)</p><br>
				<p><strong>The Monthly Payment is: </strong><br><br>$<%=request.getAttribute("totalPrice")%> + applicable taxes</p>
			</fieldset>
			<form action="Pricing.jsp">
			<button id="go-back-button">Calculate Again</button>
		</form>
		</div>
	</main>
	
</body>
</html>

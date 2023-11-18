<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Loan Calculator</title>
<link rel="stylesheet" type="text/css" href="styles/Results.css">
</head>
<body>



 
	<header>
		<h1>LoanCalculator</h1>
	</header>
	<main>
		<div class="calculator-results">
			<fieldset>
				<legend>Loan Calculator</legend>
				<p>You entered:</p>
				
					<p>Vehicle Cost: <%=request.getAttribute("price")%></p>
					<p>Down Payment: <%=request.getAttribute("down")%></p>
					<p>Term (Months): <%=request.getAttribute("term") %></p>
					<p>Interest rate: <%=request.getAttribute("tax")%> %</p>
					
				
				<p>The total price is calculated as:</p>
				<p>total = (Cost - Down Payment) / Term ) * (1 + interest rate / 100)</p>
				<p>
					The Monthly Payment is: $<%=request.getAttribute("totalPrice")%> + applicable taxes</p>
			</fieldset>
			<form action="Pricing.jsp">
			<button id="go-back-button">Calculate Again</button>
		</form>
		</div>
	</main>
	<footer>
		<p>Created for E-Commerce Lab</p>
	</footer>
</body>
</html>

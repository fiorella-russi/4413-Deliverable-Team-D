<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="nav.jsp" %>
<%@ include file="chat.jsp" %>




<!DOCTYPE html>






<html>

<head>
	<title>Loan Calculator</title>
	<link rel="stylesheet" type="text/css" href="styles/Pricing.css">
	<script src="validations.js"></script>
</head>

<body>
	

	<main>
		
		<form id="cartForm" action="CalculatorServlet" method="post">
			<fieldset>
				<legend>Loan Calculator</legend>
				Vehicle Cost: <input type="number" step="any" name="price" id="price" /><br>
				Term (Months): <input type="number" name="term" id="term" /><br>
				Interest Rate: <input type="number" step="any" name="tax" id="tax" /><br>
			Down Payment: <input type="number" step="any" name="down" id="down" /><br>
				<input  id ="PricingSubmit" name="calculate" type="submit" value="Calculate">
			</fieldset>
		</form>
		<div id="error"></div>
	</main>
	<footer>
	
	</footer>
</body>

</html>
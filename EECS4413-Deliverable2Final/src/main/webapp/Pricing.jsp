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
	
    
	<header>
		<h1>Loan Calculator</h1>
	</header>
	<main>
		
		<form id="cartForm" action="CalculatorServlet" method="post">
			<fieldset>
				<legend>Pricing Information</legend>
				Vehicle Cost: <input type="number" name="price" id="price" /><br>
				Term (Months): <input type="number" name="term" id="term" /><br>
				Interest Rate: <input type="number" name="tax" id="tax" /><br>
			Down Payment: <input type="number" name="down" id="down" /><br>
				<input name="calculate" type="submit" value="Calculate">
			</fieldset>
		</form>
		<div id="error"></div>
	</main>
	<footer>
		<p>Created for E-Commerce Lab</p>
	</footer>
</body>

</html>
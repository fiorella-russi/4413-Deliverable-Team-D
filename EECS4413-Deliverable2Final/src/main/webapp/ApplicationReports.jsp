<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ include file="adminNav.jsp" %>
<%
 List<Map<String, Object>> myList = (List<Map<String, Object>>) request.getAttribute("ApplicationReports"); 
 Locale usa = new Locale("en", "US");

Currency dollars = Currency.getInstance(usa);

NumberFormat dollarFormat = NumberFormat.getCurrencyInstance(usa);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application Report</title>
<link rel="stylesheet" type="text/css" href="styles/ApplicationReports.css">
</head>
<body>
        
        <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Make</th>
                    <th>Model</th>
                    <th>Price</th>
                    <th>Date Listed</th>
                    <th>Date Sold</th>
                    <th>Selling Price</th>
                </tr>
            </thead>
            <tbody>
                <% for (Map<String, Object> user : myList) { %>
                <tr>
                    <td><%= user.get("make") %></td>
                    <td><%= user.get("model") %></td>
                    <td><%= dollarFormat.format( (int) user.get("price")) %></td>
                    <td><%= user.get("DateListed") %></td>
                    <td><%= user.get("DateSold") %></td>
                    <td><%= dollarFormat.format( (int) user.get("soldPrice")) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>
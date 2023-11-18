<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ include file="nav.jsp" %>
<%@ include file="chat.jsp" %>
 <% List<Map<String, Object>> myList = (List<Map<String, Object>>) request.getAttribute("myList"); 
 

//Create a new Locale
Locale usa = new Locale("en", "US");
//Create a Currency instance for the Locale
Currency dollars = Currency.getInstance(usa);
//Create a formatter given the Locale
NumberFormat dollarFormat = NumberFormat.getCurrencyInstance(usa);



 
 %>
 

<!DOCTYPE html>
<html>
<head>
<title>Hot Deals</title>
<link rel="stylesheet" type="text/css" href="styles/hotDeals.css">
 
    <script>
    
       
    </script>
</head>
<body>
   
    
    <div id="itemContainer">
        <%
           
            for (Map<String, Object> item : myList) {
               
                String color = (String) item.get("color");
                String make = (String) item.get("make");
                String model = (String) item.get("model");
                int price = (int) item.get("price");
                int discountPrice = (int) item.get("salePrice");
                int km = (int) item.get("odometer");
             
                
                
        %>
        <div class="item card" data-color="<%= color %>" data-make="<%= make %>" data-model="<%= model %>" data-price="<%= price %>" data-km="<%= km %>">
    <div class="item-content">
        <a href="productDetails?param1=<%= item.get("id") %>">
            <img src="<%= item.get("image1") %>" alt="Item Image">
            <br><%= color %><br>
            <%= make %><br>
            <%= model %><br>
           
            <span class="original-price"><%= dollarFormat.format(price) %></span>
            <%= dollarFormat.format(discountPrice) %>
            <br>
        </a>
    </div>
</div>
     <%}%>
    </div>
</body>
</html>
